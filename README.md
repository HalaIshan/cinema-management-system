# Cinema Management System

A client-server desktop application for managing a cinema chain: browsing movies, booking seats, buying tickets and home-viewing links, handling customer complaints, and managing content, prices and reports by role.

Built as the final project of the **Software Engineering** course at the University of Haifa (2024) by a team of six students.

## Features

**Customers**
- Browse movies now showing, coming soon, and available for home viewing
- Choose a branch, screening time and seats on an interactive seat map
- Buy tickets, ticket cards (bundles), and home-viewing links, and receive a generated ticket
- Personal area: purchase history, personal messages, and cancellations with a refund policy
- Submit complaints and get responses

**Employees** (role-based login)
- **Content Manager:** add and remove movies, edit screenings, request price changes
- **Head Manager:** approve price changes, view reports across all branches
- **Branch Manager:** view branch reports (tickets, cards and links, complaints)
- **Customer Service:** handle open complaints

## Architecture

```
client (JavaFX)  ⇄  OCSF over TCP sockets (port 3000)  ⇄  server  ⇄  Hibernate ORM  ⇄  database
                         shared "entities" module
```

| Module | Description |
|---|---|
| `client` | JavaFX desktop UI. EventBus (mediator pattern) passes server messages to the right screen. |
| `server` | Multi-client server built on the OCSF framework. Handles requests and persists data with Hibernate. |
| `entities` | Shared domain model: Movie, Screening, Branch, Hall, Purchase, Complaint, Employee roles, and more. |

**Tech stack:** Java 17, JavaFX, OCSF (client-server sockets), Hibernate ORM, H2 / MySQL, Maven, EventBus

## Running the project

Requirements: **JDK 17** and **Maven**.

```bash
# 1. Build everything (from the project root)
mvn install

# 2. Start the server
cd server
mvn exec:java

# 3. In a second terminal, start the client
cd client
mvn javafx:run
```

The server uses a built-in **H2 in-memory database** by default, so no database installation or password is needed. The database is created and filled with sample data each time the server starts.

To use your own MySQL server instead, set these environment variables before starting the server:

```bash
DB_URL=jdbc:mysql://localhost:3306/finaldatabase?serverTimezone=UTC
DB_USER=root
DB_PASSWORD=your_password
```

## My contribution

I built the **complaints module** end to end:
- **Complaint submission** – the customer complaint form (JavaFX) with input validation and subject selection, and the server handler that saves the complaint with Hibernate and pushes the updated complaints list to all connected clients
- **Complaints report** – a report for managers with a bar chart of complaints, filtered by month and branch, and the server query behind it

After finishing my part, I helped teammates with other parts of the system where needed.

## Team

Developed by a team of six students as part of the Software Engineering course, University of Haifa.
Original team repository: [Demaao/Final_Project_VF](https://github.com/Demaao/Final_Project_VF)
