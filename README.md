# Cinema Management System

A client-server desktop application for managing a cinema chain: browsing movies, booking seats, buying tickets, ticket cards and home-viewing links, handling customer complaints, and managing content, prices and reports by role.

Built as the final project of the **Software Engineering** course at the University of Haifa (Spring 2024) by a team of six students.

📄 **Project requirements:** [`docs/project_requirements_spring2024.pdf`](docs/project_requirements_spring2024.pdf) – the official system description we received (in Hebrew). See [What was required vs. what we built](#what-was-required-vs-what-we-built) below.

## Quick Start (Windows)

> [!IMPORTANT]
> **The only requirement is Java – JDK 17 or newer.**
> Check it by opening a terminal and running `java -version`. If it is missing, install it from [adoptium.net](https://adoptium.net) (Temurin 17).
> You do **not** need to install Maven: the project includes the Maven Wrapper (`mvnw`), which downloads Maven and all the libraries automatically on the first run. This needs an internet connection and can take a few minutes; later runs start much faster.

1. Double-click **`run_server.bat`** – it builds the project and starts the server. The first run downloads Maven and the libraries, so it can take a few minutes. Keep this window open.
2. Double-click **`run_client.bat`** – the client window opens.
3. On the first screen keep **`localhost`** and port **`3000`**, and press **Enter**.

You can open several clients at the same time to see live updates between users.

The server uses a built-in **H2 database**, so no database installation or password is needed. The database is created and filled with sample data every time the server starts.

<details>
<summary>Running manually (any OS)</summary>

```bash
./mvnw install -DskipTests                 # from the project root
./mvnw -pl server exec:java       # terminal 1 – server
./mvnw -pl client exec:java       # terminal 2 – client
```

To use your own MySQL server instead of H2, set `DB_URL`, `DB_USER` and `DB_PASSWORD` before starting the server:

```bash
DB_URL=jdbc:mysql://localhost:3306/finaldatabase?serverTimezone=UTC
DB_USER=root
DB_PASSWORD=your_password
```
</details>

## Demo Accounts

All accounts below exist in the sample data, so you can explore every part of the system.

**Employees** – log in from the employee login screen with a username and password:

| Role | Username | Password | What you can do |
|---|---|---|---|
| Head Manager | `shadaGh0512` | `shada0512` | Approve price changes, view reports for all branches |
| Branch Manager – Haifa | `dema123` | `dema123` | View the reports of the Haifa branch |
| Branch Manager – Tel Aviv | `hala123` | `hala123` | View the reports of the Tel Aviv branch |
| Branch Manager – Eilat | `shatha123` | `shatha123` | View the reports of the Eilat branch |
| Branch Manager – Karmiel | `lian99` | `lian99` | View the reports of the Karmiel branch |
| Branch Manager – Jerusalem | `roza123` | `roza123` | View the reports of the Jerusalem branch |
| Content Manager | `anna123` | `anna123` | Add and remove movies, edit screenings, request price changes |
| Customer Service | `emma123` | `emma123` | View and answer customer complaints |

**Customers** – no password is needed. Anyone can browse movies and buy; to see your purchases, messages and complaints in the personal area, enter one of these ID numbers:

| Customer | ID number |
|---|---|
| Dima | `123123123` |
| Shada | `123456789` |
| Rozaline | `111111111` |
| Dana | `444555666` |

All names, IDs and contact details in the sample data are made up.

## What Was Required vs. What We Built

| Requirement (from the project description) | In the system |
|---|---|
| Browse the movies now showing, coming soon, and available for home viewing | Movies, Coming Soon and Home Viewing pages with movie details and images |
| Buy cinema tickets by choosing seats on a map of the hall | Branch and screening selection, interactive seat map, payment, and a generated ticket |
| Buy time-limited links for home viewing | Home-viewing link purchase with its availability time |
| Buy a ticket card of 20 discounted tickets | Ticket-card purchase and a page to check the remaining tickets |
| Cancel purchases according to the refund policy | Cancellation with the refund rules (full / 50% / none, based on the time left) |
| Customer service: submit complaints and get an answer | Complaint form for customers, and a complaint-handling screen for customer service |
| Content manager updates movies, screenings and prices; price changes need the head manager's approval | Content manager pages, and a price-approval page for the head manager |
| Monthly reports: ticket sales, cards and links, and a complaints histogram – per branch and for the whole chain | Report pages with charts, filtered by month and branch |
| Employees log in with a username and password; the same user cannot log in twice at once; customers are identified by ID number | Role-based employee login, customer identification by ID, and blocking of duplicate logins |
| Client-server architecture over TCP/IP with a relational database, supporting several users at once | JavaFX clients and a multi-client OCSF server over TCP sockets, with Hibernate ORM over a relational database |

## Architecture

```
client (JavaFX)  ⇄  OCSF over TCP sockets (port 3000)  ⇄  server  ⇄  Hibernate ORM  ⇄  database
                         shared "entities" module
```

| Module | Description |
|---|---|
| `client` | JavaFX desktop UI. EventBus (mediator pattern) passes server messages to the right screen. |
| `server` | Multi-client server built on the OCSF framework. Handles requests and persists data with Hibernate. |
| `entities` | Shared domain model: Movie, Screening, Branch, Hall, Purchase, Complaint, employee roles, and more. |

**Tech stack:** Java 17 · JavaFX · OCSF (client-server sockets) · Hibernate ORM · H2 / MySQL · Maven · EventBus

## My Contribution

I built the **complaints module** end to end:
- **Complaint submission** – the customer complaint form (JavaFX) with input validation and subject selection, and the server handler that saves the complaint with Hibernate and pushes the updated complaints list to all connected clients
- **Complaints report** – a report for managers with a bar chart of complaints, filtered by month and branch, and the server query behind it

After finishing my part, I helped teammates with other parts of the system where needed.

## Team

Developed by a team of six students as part of the Software Engineering course, University of Haifa.
Original team repository: [Demaao/Final_Project_VF](https://github.com/Demaao/Final_Project_VF)
