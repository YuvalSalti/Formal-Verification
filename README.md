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
- [Theoretical Knowledge](#theoretical-knowledge)
    - [History](#history)
    - [Why Formal Verification?](#why-formal-verification)
    - [How Does Formal Verification Work?](#how-does-formal-verification-work)
    - [Formal Verification Results](#formal-verification-results)
    - [Formal Verification Methods](#formal-verification-methods)
    - [SystemVerilog (SV) and Its Role in Formal Verification](#systemverilog-sv-and-its-role-in-formal-verification)
- [Prerequisites](#prerequisites)
    - [](#)
    - [](#)
    - [](#)
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

## Why Formal Verification?

Simulation is a widely used method for validating digital designs by testing sequences of binary inputs (0s and 1s). However, it inherently lacks the ability to exhaustively explore all possible states of a system. For instance, a system with a 64-bit state space contains approximately 18.4 quintillion (1.84 × 10¹⁹) unique states, making it computationally infeasible to simulate every possible scenario.

Formal verification addresses this limitation by providing a mathematically rigorous approach to verifying design correctness. Unlike simulation, it employs logic-based techniques to exhaustively prove or disprove system properties across all possible inputs and states. This ensures a higher level of confidence in the design, especially in safety-critical or highly complex systems.

## How Does Formal Verification Work?

🔒 Constraints

Constraints are rules or conditions that define the legal operating environment of the system.

Unlike simulation, where inputs are explicitly provided by the tester, formal verification explores all possible input combinations.
As such, constraints are necessary to limit the input space to realistic and meaningful scenarios.
Examples:
```verilog
// A counter must stay within the range 0 to 15
assume (counter >= 0 && counter <= 15);

// A 'clock enable' signal must be active for at least two consecutive clock cycles
assume property (@ (posedge clk) CE |=> CE);
```
---
✅ Assertions

Assertions define the expected behavior of the system.
They verify that the hardware design meets logical requirements throughout its operation.
While constraints define what’s allowed, assertions check if the system behaves according to the specification.

Examples:
```verilog
// A request must be acknowledged by a grant within 1 to 3 clock cycles
property request_must_get_grant;
  @(posedge clk) req |=> ##[1:3] grant;
endproperty

assert property (request_must_get_grant);

// 'Enable' signal should not remain high for more than two consecutive cycles
assert property (@(posedge clk) enable |=> !enable);
```
---
🔍 Covers

Covers are used to check if certain events or states are reachable in the design.
Unlike assertions, cover properties do not enforce requirements and do not fail when a condition isn’t met. A failed cover simply means the condition might be unreachable or that appropriate input stimuli were not provided.

Examples:
```verilog
// Check if the STANDBY state is reachable
cover property (@(posedge clk) state == STANDBY);

// Check if a grant can follow a request
cover property (@(posedge clk) req |=> grant);
```

## Formal Verification Results

There are three possible outcomes from a formal verification process: Pass, Fail, and Unknown.

🟢 Pass

The design satisfies all defined requirements for all possible input combinations.
This means that every assertion holds true under all valid conditions, and the verification engine has found a mathematical proof that the design contains no bugs.

After receiving a Pass, it’s important to validate:
1.	Were the constraints correctly defined? 
Overly strict constraints may eliminate relevant input scenarios and give a false sense of correctness.
2.	Were the requirements fully captured by assertions?
Some properties might be missing or incorrectly formulated.
---
🔴 Fail

The engine has found a bug in the design or an incorrectly defined assertion.
A failure can stem from:
-	A logic or implementation error in the design.
-	A mistake in the way the requirement or assertion was written.

The tool provides a waveform trace leading to the failure, which helps in debugging.

After receiving a Fail, it’s recommended to:
1.	Examine the waveform to identify where the failure occurred.
2.	Check for errors in the design logic.
3.	Ensure that assertions are correctly written and reflect the intended behavior.
4.	Review the constraints to ensure they do not introduce invalid or irrelevant scenarios.

---

⚪ Unknown

The engine was unable to prove or disprove the assertions or cover properties.
This usually happens when:
-	The system is too complex, and the number of states is too large to fully analyze in reasonable time.
-	The engine lacks sufficient computational power.

After receiving an Unknown, consider:
	1.	Simplifying the design to reduce the number of states.
	2.	Breaking the verification into smaller submodules and verifying them independently.
	3.	Applying inductive proofs to validate properties in stages.


## Formal Verification Methods

Formal verification provides a mathematically rigorous way to prove the correctness of a hardware design without requiring exhaustive simulation.
Several methods exist within the formal verification domain, including BMC, Cover, and Induction, among others.

🔁 Bounded Model Checking (BMC)

Goal:

To verify that the system behaves correctly over a finite number of steps.
The verification engine checks whether any assertion is violated within a bounded time window (e.g., n cycles).
If no violations are found, the engine reports success — but only for the checked range. It does not guarantee correctness beyond the bound.

How it works:
1.	The circuit is translated into a Boolean formula representing its behavior over n steps.
2.	A SAT/SMT solver is used to search for violations of the assertions.
3.	If a violating input sequence exists, the engine generates a trace showing how the failure occurred.

When to use BMC:
-	To detect specific bugs within a limited number of cycles.
-	For early detection of issues in state machine transitions.

---
📍 Cover Mode

Goal:

To check whether a specific condition or state is reachable in the hardware.
This is useful for identifying rare or unexpected states, or for verifying that forbidden states can’t be reached.

How it works:
1.	Define a target condition to be covered.
2.	The engine searches for an input sequence that brings the system to that state.
3.	If a valid input sequence is found, the engine generates a trace showing the path to the condition.
4.	If the state is unreachable, an error message is displayed.

When to use Cover Mode:
-	To explore rare edge cases.
-	To verify reachability of certain operational or forbidden states.

---
📐 Prove / Induction Mode

Goal:

To prove that the system meets its requirements for all time, not just over a fixed number of cycles like in BMC.
This method uses mathematical induction, where we prove:
-	The base case (e.g., time t = 0) is valid.
-	Assuming the system is correct at step N, it is also correct at N + 1.

How it works:
1.	The engine assumes the property holds at all times.
2.	It forces inputs to satisfy the property for several initial cycles.
3.	It then attempts to find a counterexample at cycle N + 1.
4.	If none is found, the property is proven. Otherwise, a trace is shown.

When to use Induction:
-	To prove the long-term correctness of state machines and designs over infinite time.

Limitations:
-	May miss bugs in early states, as it assumes the system starts in a valid state.
-	Requires a proper base case to be effective.


## SystemVerilog (SV) and Its Role in Formal Verification

SystemVerilog (SV) is an extension of the Verilog hardware description language that adds verification-oriented features to support more advanced hardware design and validation.

SV was designed to provide stronger verification capabilities and built-in support for formal verification. It enables the use of assertions, cover properties, and constraints — all of which are essential components in formal verification workflows (as detailed in the previous sections).

In addition to its verification features, SystemVerilog includes capabilities of an advanced programming language, offering support for:
-    Object-Oriented Programming (OOP)
-    Randomization
-    Testbench automation
-    And many other powerful constructs.

These enhancements make SV a comprehensive solution for both design and verification, bridging the gap between hardware description and validation.

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
