-- CS4400: Introduction to Database Systems (Fall 2021)
-- Phase II: Create Table & Insert Statements [v0] Thursday, October 14, 2021 @ 2:00pm EDT

-- Team 84
-- Team Member Name (GT username)
-- Team Member Name (GT username)
-- Team Member Name (GT username)
-- Team Member Name (GT username)

-- Directions:
-- Please follow all instructions for Phase II as listed on Canvas.
-- Fill in the team number and names and GT usernames for all members above.
-- Create Table statements must be manually written, not taken from an SQL Dump file.
-- This file must run without error for credit.

-- ------------------------------------------------------
-- CREATE TABLE STATEMENTS AND INSERT STATEMENTS BELOW
-- ------------------------------------------------------

DROP DATABASE IF EXISTS gt_airports;
CREATE DATABASE IF NOT EXISTS gt_airports;
USE gt_airports;

DROP TABLE If EXISTS Account;
CREATE TABLE Account(
	email varchar(100),
    PRIMARY KEY (email),
    fname varchar (32) NOT NULL,
    lname varchar (32) NOT NULL,
    password varchar (100) NOT NULL
)engine = innodb;

DROP TABLE If EXISTS Admin;
CREATE TABLE Admin(
	email varchar(100),
    primary key (email)
) engine = innodb;

DROP TABLE If EXISTS Client;
CREATE TABLE Client(
	phone_number varchar(100),
	primary key (phone_number),
	average_rating int(10) Not NULL
)engine = innodb ;

DROP TABLE If EXISTS Owner;
CREATE TABLE Owner(
	phone_number varchar(100),
	primary key (phone_number),
	total_income decimal(15,2) NOT NULL
)engine = innodb ;

DROP TABLE If EXISTS Property;
CREATE TABLE Property(
	name varchar (100) NOT NULL,
	phone_number varchar(100) NOT NULL,
	description varchar(1000) NOT NULL,
	capacity int(200)NOT NULL,
	cost_per_person decimal (10,4) NOT NULL,
	CONSTRAINT owner_phone_number FOREIGN KEY (phone_number) REFERENCES Owner (phone_number)
)engine = innodb ;


DROP TABLE If EXISTS Airport;
CREATE TABLE Airport(
	airport_ID varchar(100),
    name varchar(100) NOT NULL,
    time_zone varchar(100) NOT NULL,
    street varchar(100) NOT NULL,
    city varchar(100) NOT NULL,
    state varchar(100) NOT NULL,
    zip varchar(100) NOT NULL,
    primary key (airport_ID)
)engine = innodb;

DROP TABLE If EXISTS Airline;
CREATE TABLE Airline(
	name varchar(100),
    primary key (name),
    rating int(3) NOT NULL
)engine = innodb ;

DROP TABLE If EXISTS Flight;
CREATE TABLE Flight(
	flight_number varchar(100),
    primary key (flight_number),
    departure_time varchar(100) not null,
    arrival_time varchar(100) not null,
    date date,
    cost_per_seat decimal(10,4) not null,
    capacity int(200)NOT NULL,
    airline_name varchar(100),
    airport_ID varchar(100),
	CONSTRAINT airline_name FOREIGN KEY (airline_name) REFERENCES Airline (name),
    CONSTRAINT airline_ID FOREIGN KEY (airport_ID) REFERENCES Airport (airport_ID)
)engine = innodb ;

DROP TABLE If EXISTS Customer;
CREATE TABLE Customer(
	cvv int(3) not null,
    exp_date date,
    credit_card varchar(100),
    primary key (credit_card),
    current_location varchar(100) not null,
    phone_number varchar(100) not null,
    email varchar(100) not null
    
)engine = innodb ;

DROP TABLE If EXISTS Rates;
CREATE TABLE Rates(
	score int(10),
    customer_credit_card int(14),
    owner_phone_number varchar(100),
    CONSTRAINT customer_credit_card FOREIGN KEY (customer_credit_card) REFERENCES Customer (credit_card),
    CONSTRAINT owner_phone_number FOREIGN KEY (owner_phone_number) REFERENCES Owner (phone_number)
    
)engine = innodb ;