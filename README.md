# Formal Verification

## Overview

Welcome to a basic formal verification implimentetion.

This project explore Formal verification and how it is used to verify a design in verilog.

---

## Purpose

To learn about Formal Verification, why it is needed, how does it differ from other verification types and how to implement it on a simple verilog design.

## Technology Stack

this project is built using the following tools and technology:

- **Verilog / SV:** Hardware description languages used to model, simulate, and verify digital circuits.
- **Yosys:**  Open-source synthesis tool used to convert RTL code into gate-level netlists.
- **SymbiYosys:** Formal verification framework built on top of Yosys.
- **Icarus verilog :** Compiler and simulator for Verilog.
- **Ubunto:** Linux-based development environment used to run synthesis, simulation, and analysis tools.
- **GTKWave:** Waveform viewer.
---

## Table of Contents

- [Overview](#overview)
- [Purpose](#purpose)
- [Technology Stack](#technology-stack)
- [Table of Contents](#table-of-contents)
- [Prerequisites](#prerequisites)
- [Theoretical Knowledge](#theoretical-knowledge)
    - [History](#history) 
- [Getting Started](#getting-started)
    - [Using Docker](#using-docker)
- [Usage](#usage)
    - [City Search Example](#city-search-example)
    - [Generate Monthly Trip Example](#generate-monthly-trip-example)
    - [Generate Trip by Dates Example](#generate-trip-by-dates-example)
- [API Documentation](#api-documentation)
  - [Step 1: Obtain Authentication Token](#step-1-obtain-authentication-token) 
  - [Step 2: Authorize](#step-2-authorize)  
  - [Step 3: Start Using the CheapTrips Services](#step-3-start-using-the-cheaptrips-services)


## Prerequisites

Before diving into the CheapTrips application, ensure you have the following prerequisites installed:

- [Java](https://www.java.com/)
- [Spring Boot](https://spring.io/projects/spring-boot)
- [MongoDB](https://www.mongodb.com/)
- [Redis](https://redis.io/)
- [Docker](https://www.docker.com/)

## Theoretical Knowledge

## History

Formal verification is derived from theorem proving, property checking, and equivalence checking.

<ins>**Theorem Proving –**</ins> A mathematical approach for verifying the correctness of a design by proving logical theorems. This method uses formal inference techniques, such as computational logic, to prove that the design meets the specified requirements.

<ins>**Property Checking –**</ins> A technique for verifying specific behaviors of a system using logical assertions. This method is based on a verification model that scans all possible states by using assertions.

<ins>**Equivalence Checking –**</ins> A method for proving that two representations of a design are logically equivalent. This technique is mainly used to compare a design before and after optimization or to check for equivalence between an RTL design and its gate-level schematic.

## Getting Started

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/OrenGolanProjects/JAVACheapTrips.git
   cd cheap-trips
   ```
2. **Set Up MongoDB:**

   Ensure that you have a MongoDB instance ready.
3. Set Up Redis:

   Ensure that you have a Redis instance ready.

4. .env file:
   
    Ensure you have .env file under resources folder with the following content:
      ```bash
       city_ENDPOINT   = APIEndpoint
       country_ENDPOINT=APIEndpoint
       airport_ENDPOINT=APIEndpoint
       airline_ENDPOINT=APIEndpoint
    
       flight_monthlyENDPOINT=APIEndpoint
       flight_cheapENDPOINT = APIEndpoint
       flight_TOKEN=APIEndpoint
    
       news_ENDPOINT=APIEndpoint
       news_TOKEN=APIEndpoint
    
       opentripmap_ENDPOINT_Geo=APIEndpoint
       opentripmap_ENDPOINT_Places=APIEndpoint
       opentripmap_TOKEN=APIEndpoint

      ```
## Using Docker

Build and Run with Docker:

```bash
  docker-compose up --build
```
This command will build the Docker images and start the CheapTrips application.

## Usage

### City Search Example

Use the following curl command to search for a city:

```bash
   curl -X GET 
      --header 'Accept: application/json' 
      --header 'Authorization: Bearer <your-token>' 'https://www.search-trips-api.com/cheap-trip/city-search?cityName=<search-cityName>>'
```
---


### Generate Monthly Trip Example
Use the following curl command to generate a monthly trip:
```bash
curl -X POST 
  --header 'Content-Type: application/json' 
  --header 'Accept: application/json' 
  --header 'Authorization: Bearer <your-token>' 
  -d '{
        "origin_cityIATACode": "TLV",  
        "destination_cityIATACode": "AMS",  
        "destination_cityName": "amsterdam",  
        "radius": 10000, 
        "limitPlaces": 2  
       }' 'https://www.search-trips-api.com/cheap-trip/generate-monthly-trip'
```

Example JSON for generating a monthly trip:
```json
{
  "origin_cityIATACode": "TLV",
  "destination_cityIATACode": "AMS",
  "destination_cityName": "amsterdam",
  "radius": 10000,
  "limitPlaces": 2
}
```

---
### Generate Trip by Dates Example

Use the following curl command to generate a trip by dates:

```bash
curl -X POST 
  --header 'Content-Type: application/json' 
  --header 'Accept: application/json' 
  --header 'Authorization: Bearer <your-token>' 
  -d '{
        "origin_cityIATACode": "TLV",
        "destination_cityIATACode": "AMS",
        "destination_cityName": "amsterdam",
        "radius": 10000,
        "limitPlaces": 2
       }' 'https://www.search-trips-api.com/cheap-trip/generate-trip-by-dates?departure_at=<your-departure_at>&return_at=<your-return_at>'
```
Note: Replace <your-token>, <your-departure_at>, and <your-return_at> with the actual authentication token, departure date, and return date. Adjust the formatting or wording as needed.


**Example JSON for generating a trip by dates:**
```json
{
  "origin_cityIATACode": "TLV",
  "destination_cityIATACode": "AMS",
  "destination_cityName": "amsterdam",
  "radius": 10000,
  "limitPlaces": 2
}
```
Note: Make sure to replace the values (<departure_at>, <return_at>) when using the swagger-ui.

---

## API Documentation

Explore the CheapTrips API and interact with the available services using the following documentation.

### Step 1: Obtain Authentication Token

Before accessing CheapTrips services, you need to obtain an authentication token.

#### Using Existing User:
To get the authentication token for an existing user, make a request to the `/authentication` endpoint.

```bash
curl -X POST 
  --header 'Content-Type: application/json' 
  -d '{
        "username": "your_existing_username",
        "password": "your_password"
       }' 'https://www.search-trips-api.com/authentication'
```

For New User:
Create a new user and get the token by making a request to the /user endpoint.
```bash
curl -X POST 
  --header 'Content-Type: application/json' 
  -d '{
          "jwtRequest": {
            "email": "your_email",
            "password": "your_password"
          },
          "userInfoRequest": {
            "username": "your_username",
            "firstName": "your_first_name",
            "surname": "your_surname",
            "phone": "your_phone_number"
          }
      }' 'https://www.search-trips-api.com/user'
```

### Step 2: Authorize
Once you have the authentication token, authorize your requests by including it in the headers.
- **Header:** Authorization
- **Value:** Bearer \<your-token\>

### Step 3: Start Using the CheapTrips Services
Now, you're ready to explore CheapTrips services. 
Use the Swagger UI to interactively explore and test the available API endpoints.

- **URL:** [Swagger UI](https://www.search-trips-api.com/swagger-ui.html)
