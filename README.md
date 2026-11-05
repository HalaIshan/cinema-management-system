# Cinema Management System

A client-server desktop application for the cinema chain **"HaSratiya"**. Customers browse movies, choose seats on a hall map, buy cinema tickets, 20-ticket cards and time-limited home-viewing links, cancel purchases and submit complaints. Employees log in by role to manage movies, screenings and prices, answer complaints and view monthly reports.

Built as the final project of the **Software Engineering** course at the University of Haifa (Spring 2024) by a team of six students.

**Tech stack:** Java 17 · JavaFX · OCSF (client-server over TCP sockets) · Hibernate ORM · H2 / MySQL · Maven · EventBus

📄 **Project documents** – the original documents we received from the course (in Hebrew), and an English translation of each:

| Document | Original (Hebrew) | English translation |
|---|---|---|
| System description – the project requirements | [PDF](docs/project_requirements_spring2024.pdf) | [Read in English](docs/project_requirements_spring2024_EN.md) |
| System test outline – the scenarios the system was tested against | [PDF](docs/system_test_scenarios_spring2024.pdf) | [Read in English](docs/system_test_scenarios_spring2024_EN.md) |

---

## Quick Start (Windows)

> [!IMPORTANT]
> **The only requirement is Java – JDK 17 or newer.**
> Check it by opening a terminal and running `java -version`. If it is missing, install it from [adoptium.net](https://adoptium.net) (Temurin 17).
> You do **not** need to install Maven: the project includes the Maven Wrapper (`mvnw`), which downloads Maven and all the libraries automatically on the first run. This needs an internet connection and can take a few minutes; later runs start much faster.

1. Double-click **`run_server.bat`**. It builds the project and starts the server. Wait until you see **`Server initialized`**, and keep this window open.
2. Double-click **`run_client.bat`**. The client window opens.
3. On the first screen keep **`localhost`** and port **`3000`**, and press **Enter**.

You can open several clients at the same time to see live updates between users. To run the server and the clients on different computers, see [Connecting from other computers](#connecting-from-other-computers) below.

The server uses a built-in **H2 database**, so no database installation or password is needed. The database is created and filled with sample data every time the server starts.

<details>
<summary>Running manually (any OS)</summary>

```bash
./mvnw install -DskipTests          # from the project root
./mvnw -pl server exec:java         # terminal 1 – server
./mvnw -pl client exec:java         # terminal 2 – client
```

To use your own MySQL server instead of H2, set `DB_URL`, `DB_USER` and `DB_PASSWORD` before starting the server:

```bash
DB_URL=jdbc:mysql://localhost:3306/finaldatabase?serverTimezone=UTC
DB_USER=root
DB_PASSWORD=your_password
```

</details>

---

## Connecting from Other Computers

The system is built as a real client-server application: the **server runs on one computer**, and **any number of clients** can connect to it from other computers at the same time.

### The first screen of the client

When the client starts, it asks where the server is:

| Field | What to enter |
|---|---|
| **Host IP** | The address of the computer that runs the server. Use `localhost` when the server runs on the same computer. |
| **Port** | `3000` – the server always listens on this port. |

Press **Enter** to connect. If the server cannot be reached, the client shows *"Failed to connect to server"*, and you can fix the address and try again.

### Server and clients on the same network (Wi-Fi or LAN)

This is the setup the course project was built for.

1. **On the server computer:** run `run_server.bat` and wait for `Server initialized`.
   - The first time, Windows may ask whether to allow Java through the firewall. Choose **Allow** for private networks; otherwise other computers cannot connect.
   - Find the computer's address: open a terminal, run `ipconfig`, and copy the **IPv4 Address** (for example `192.168.1.15`).
2. **On every client computer:** download the project, install Java, and run **only** `run_client.bat`. The first run builds the client, so it takes a few minutes.
3. On the first screen enter the server's IPv4 address as **Host IP** and `3000` as **Port**, and press **Enter**.

Every client that connects sees the changes of the others right away – for example, a seat bought on one computer is shown as taken on all the others.

### Server and clients in different places

When the computers are not on the same network, the clients cannot reach the server's local address directly. Two ways to connect them:

- **A virtual private network tool** such as [Tailscale](https://tailscale.com) or [ZeroTier](https://www.zerotier.com): install it on the server and on every client, and use the address it gives the server computer as **Host IP**. This is the simplest way.
- **Port forwarding:** on the router of the server's network, forward TCP port `3000` to the server computer, and use the network's public IP address as **Host IP**.

### If the client cannot connect

- Check that the server window is open and shows `Server initialized`.
- Check the **Host IP** and that the **Port** is `3000`.
- Check that the firewall on the server computer allows Java.
- Check that both computers are on the same network, or connected through one of the ways above.

---

## Demo Accounts

**Employees** – log in from the employee login screen with a username and password:

| Role | Username | Password | What you can do |
|---|---|---|---|
| Head Manager | `shadaGh0512` | `shada0512` | Approve or deny price changes, view reports for every branch and for the whole chain |
| Branch Manager – Haifa | `dema123` | `dema123` | View the reports of the Haifa branch |
| Branch Manager – Tel Aviv | `hala123` | `hala123` | View the reports of the Tel Aviv branch |
| Branch Manager – Eilat | `shatha123` | `shatha123` | View the reports of the Eilat branch |
| Branch Manager – Karmiel | `lian99` | `lian99` | View the reports of the Karmiel branch |
| Branch Manager – Jerusalem | `roza123` | `roza123` | View the reports of the Jerusalem branch |
| Content Manager | `anna123` | `anna123` | Add and remove movies, edit screenings, request price changes |
| Customer Service | `emma123` | `emma123` | Answer customer complaints and give refunds |

**Customers** – no password is needed. Anyone can browse movies and buy. To see purchases, messages and complaints in the personal area, enter one of these ID numbers:

| Customer | ID number |
|---|---|
| Dima | `123123123` |
| Shada | `123456789` |
| Rozaline | `111111111` |
| Dana | `444555666` |

All names, IDs and contact details in the sample data are made up.

---

## How to Test the System

A short tour of the main features. Open **two clients** side by side to also see the live updates.

**As a customer (no login):**
1. Open the **Movies** page, page through the list and filter by **genre, cinema and date**. Click a movie to see its details.
2. Open **Coming Soon** and **Home Viewing**.
3. Buy a cinema ticket: choose a movie, a branch and a screening, pick seats on the **hall map**, and pay. The order summary with the movie, branch, hall and seats is shown at the end.
4. Buy a **ticket card** (20 tickets) and a **home-viewing link**.
5. Open the **personal area** with ID `123123123`: see your purchases, your links and when they are available, your messages and the tickets left on your card.
6. **Cancel a purchase** and see the refund you get. Try to cancel a ticket card – it is not allowed.
7. **Submit a complaint**.

**As employees:**
1. `emma123` – open the complaint you just submitted, answer it and give a refund if needed.
2. `anna123` – add a movie, edit a screening time and request a price change.
3. `shadaGh0512` – approve or deny the price change, and open the reports for the whole chain.
4. `hala123` – open the reports and see that only the Tel Aviv branch is shown.
5. Try to log in with the same user in a second client – the system blocks it.

---

## What Was Required and How We Built It

Each section below follows the course's [test outline](docs/system_test_scenarios_spring2024_EN.md). **Required** is taken from the [project description](docs/project_requirements_spring2024_EN.md) we received, and **How we built it** describes what the system actually does.

### 1. Logging in

**Required:** employees identify with a username and password and see a menu that fits their role. Customers do not log in; they are identified by ID number when they want to see their purchases or complaints. The same user cannot be logged in twice at the same time.

**How we built it:**
- An employee login screen that checks the username and password on the server and opens the right page for each role: head manager, branch manager, content manager or customer service.
- Customers enter the personal area with their ID number only.
- The server keeps an online flag for every user. A second login with a user that is already connected is refused, for employees and for customers. Logging out clears the flag.

### 2. Browsing movies

**Required:** a list of the movies now showing, with their screening times; movies coming soon; and movies for home viewing. Each movie shows its name in Hebrew and English, the producer, the main actors, a summary and a picture. The list can be paged and searched by cinema, date and genre.

**How we built it:**
- Three pages: **Movies** (now showing), **Coming Soon** and **Home Viewing**, each with movie posters and paging.
- Search by movie name, **genre**, **cinema** and **date**. The filters can be combined, and past dates cannot be picked.
- A movie details page with the Hebrew and English names, director, main actors, year, genre, length, summary, poster and the screening times per branch.

### 3. Updating content

**Required:** the content manager adds and removes movies and home-viewing packages, updates screening times and updates prices. Price changes only take effect after the head manager approves them. Card holders get a message about new movies.

**How we built it:**
- Content manager pages to **add and remove movies** (in the cinema, for home viewing or both, per branch) and to **add, edit and remove screenings**.
- **Price changes** for cinema tickets, cards and home-viewing links are saved as requests. The head manager sees the waiting requests and **approves or denies** them, and only an approved request changes the price.
- On a day a movie is screened, every customer who owns a ticket card gets a **"New Movie" message** in the personal area.
- Every change is sent to all connected clients at once.

### 4. Buying cinema tickets

**Required:** after choosing a screening, the system shows a map of the hall and the customer picks seats. The system saves the purchase and sends the customer a message with the movie, branch, hall number and seats.

**How we built it:**
- Choose a movie, branch and screening, then pick seats on an **interactive map of the hall**. Taken seats cannot be chosen.
- While the customer is paying, the chosen seats are **held** so another customer cannot take them. If the payment is cancelled, the seats are released.
- Pay with a credit card or with **tickets from a ticket card**.
- The order summary shows the movie, date and time, branch, hall and seat numbers, and the purchase is saved in the customer's personal area.

### 5. Buying home-viewing links

**Required:** a link to watch a movie at home for a limited time. The system saves the purchase, sends a message with the movie, the link and the hours it is available, and sends a reminder one hour before the link becomes available. The link cannot be used outside its time window.

**How we built it:**
- Choose a movie and a viewing time, and pay.
- The personal area shows every link with its **start and end time**. The link is shown only during its time window, and the page updates by itself when the time comes.
- One hour before a link becomes available, the customer gets a **reminder message**.

### 6. Buying a ticket card

**Required:** a card of 20 discounted tickets that can be used in every branch. The system saves the buyer's details and payment, and the customer can see how many tickets are left.

**How we built it:**
- Buy one or more cards, each with 20 tickets.
- When buying cinema tickets, the customer can pay with the card, and the tickets are taken off it.
- A page where the customer enters an ID number and sees the **tickets left** on each card.

### 7. Cancelling purchases

**Required:**
- Cinema tickets: a full refund 3 hours or more before the screening, 50% between 3 hours and 1 hour before, and no refund in the last hour.
- Home-viewing links: 50% refund up to one hour before the link becomes available.
- Ticket cards cannot be returned.
- The customer is told how much will be refunded.

**How we built it:**
- The customer enters an ID number, chooses a purchase and sees the **refund percentage** before confirming.
- The refund follows the rules above, and cancelled seats become free again on the hall map for everyone.
- Trying to return a ticket card shows the message *"Cards cannot be returned!"*.

### 8. Complaints

**Required:** a customer can submit a complaint. A customer service worker handles it, can decide on a refund, and must answer within 24 hours.

**How we built it:**
- A **complaint form** with a subject, a description and contact details, with input checks.
- A customer service page with all the complaints and the **time left** until the 24-hour deadline. The worker gets a warning when less than two hours are left.
- The worker can view the customer's purchases, **cancel a purchase as a refund**, and write an answer. The customer sees the answer in the personal area.
- A new complaint appears on the customer service screen right away, without refreshing.

### 9. Reports

**Required:** monthly reports of ticket sales per cinema, of ticket cards and home-viewing links sold, and a histogram of complaints over the month – per branch and for the whole chain. The head manager sees every branch, and a branch manager sees only their own branch.

**How we built it:**
- **Ticket sales report** – tickets sold on each day of the month, per branch.
- **Cards and links report** – cards and home-viewing links sold on each day of the month.
- **Complaints report** – a bar chart of the complaints over the month.
- All reports are filtered by month. The head manager can choose any branch or the whole chain, and a branch manager only sees their own branch.

### Non-functional requirements

| Required | How we built it |
|---|---|
| 10. Client-server on separate computers, with a startup screen to connect | The first client screen asks for the server's address and port, so the client can connect to a server on another computer |
| 11. Several users connected at the same time, and the same user cannot be connected twice | A multi-client OCSF server, and an online flag for every user (see section 1) |
| 12. Test data in the database | The server fills the database with branches, halls, movies, screenings, employees, customers, purchases and complaints every time it starts |
| 13. Efficient operation without manual refreshing of screens | The server pushes every change to all connected clients, and the client screens update by themselves through EventBus |
| 14. Flexible design that is easy to change | Separate client, server and shared entities modules, and one message type for every request between the client and the server |
| 15. Reuse and design patterns | OCSF framework for the client-server layer, the **Mediator** pattern through EventBus, **Observer** for the live updates, and inheritance in the domain model (for example, every employee role extends `Employee`) |
| 16. A friendly user interface | Lists and tables, input checks, and clear success and error messages |

---

## Architecture

```
client (JavaFX)  ⇄  OCSF over TCP sockets (port 3000)  ⇄  server  ⇄  Hibernate ORM  ⇄  database
                         shared "entities" module
```

| Module | Description |
|---|---|
| `client` | JavaFX desktop UI. EventBus (mediator pattern) passes server messages to the right screen. |
| `server` | Multi-client server built on the OCSF framework. Handles requests and saves data with Hibernate. |
| `entities` | Shared domain model: Movie, Screening, Branch, Hall, Purchase, Card, Complaint, employee roles, and more. |

## My Contribution

I built the **complaints module** end to end:
- **Complaint submission** – the customer complaint form (JavaFX) with input checks and subject selection, and the server handler that saves the complaint with Hibernate and sends the updated complaints list to all connected clients
- **Complaints report** – a report for managers with a bar chart of complaints, filtered by month and branch, and the server query behind it

After finishing my part, I helped teammates with other parts of the system where needed.

## Team

Developed by a team of six students as part of the Software Engineering course, University of Haifa.
Original team repository: [Demaao/Final_Project_VF](https://github.com/Demaao/Final_Project_VF)
