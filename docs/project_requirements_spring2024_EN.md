> **English translation** of the original Hebrew document: [`project_requirements_spring2024.pdf`](project_requirements_spring2024.pdf).
> The translation keeps the structure and content of the original as closely as possible.

---

**Software Engineering 203.3140** · **System Description for the Semester Project**
**Spring Semester 2024 (5784)**

# Information System for the Cinema Chain "HaSratiya"

## 1. Background

*(The document is written in the feminine form for convenience. The text refers equally to both genders.)*

The cinema chain "HaSratiya" wants to improve the business processes carried out in the chain, and therefore asks to develop a new computerized system that will allow:

1.1 Browsing the list of movies shown in the chain's cinemas.
1.2 Buying tickets for movies.
1.3 Buying links for time-limited home viewing of movies.
1.4 Buying a ticket card for movies.
1.5 Improving customer service.

## 2. The System's Data Basis

Below is a description of the chain and of the different activities carried out with the computerized system, through which the new information system will be specified and implemented.

### 2.1 General information about the chain

The chain has several cinemas spread across different towns in the country. The chain has a chain manager, and every cinema has a cinema manager. Every cinema has several halls, and every hall has a different number of seats. A seat in a hall is defined by its row number and its place in the row.

### 2.2 The movies shown in the cinemas

The system shows the list of movies shown in the chain's cinemas and their screening times. In addition, it shows movies that will be screened soon (without details of which branches and when), and the list of movies that can be watched at home by buying a link for a limited period of time (in hours).

The information shown for each movie includes its name (in Hebrew and in English), the producer, the main actors and a summary. A picture is also shown.

### 2.3 Selling tickets for cinema screenings

Tickets for cinema screenings can be bought through the system or through information stations located in the cinemas (for movies shown in that cinema only).

When buying tickets, a map of the hall is shown to the buyer, and she can choose the seats she wants. The system records the buyer's details and the payment method. At the end of the purchase, the system sends a message to the buyer. This message serves as the entry ticket(s). The message includes the name of the movie, the name of the branch where it is shown, the hall number, and the number of seats and their location.

After the purchase, the buyer can view the details of the tickets she bought.

### 2.4 Buying a link for home viewing

A link for home viewing can be bought for certain movies. The viewing is for a limited period of time (in hours). The link will be available to the customer for the period of time defined at the time of purchase. The system records the customer's details, the purchase details and the payment method. At the end of the purchase, the system sends a message to the buyer's email address with the name of the movie, the link and the times when it is available. The system sends the buyer a reminder message one hour before the time the link becomes available.

After the purchase, the buyer can view the link(s) she bought and the times when they are available.

### 2.5 Buying a ticket card

A ticket card that includes 20 tickets for screenings can be bought at a discounted price. The ticket card allows entry to cinema screenings in all the chain's branches, based on available seats. The buyer's details and the payment method are saved in the system.

After the purchase, the buyer can view the updated number of tickets left on the ticket card.

### 2.6 Cancelling purchases

A customer who changed her mind can return tickets or viewing packages.

<u>Returning tickets</u> – tickets can be returned three hours or more before the screening time for a full refund. Tickets returned between three hours and one hour before the screening time are refunded 50% of the ticket price. A customer who cancels within the last hour before the screening is charged the full price of the tickets. When the cancellation is confirmed, the buyer receives information about the amount of the refund she will get.

<u>Returning a viewing package</u> – a viewing package can be returned up to one hour before the time the link is activated. The buyer is refunded 50% of the package price.

<u>A ticket card cannot be returned.</u>

### 2.7 Customer service

A customer service worker handles complaints. A buyer who is not satisfied (for example: the viewing package was not available at the defined time, she could not use the ticket card, etc.) can submit a complaint (through the system). The worker can decide on a monetary compensation for the buyer. An answer to the complaint must be given within 24 hours to the customer's email address.

### 2.8 Updating the list of movies and viewing packages

The chain's content manager updates the list of movies and viewing packages: adding and removing movies, updating screening times and updating prices. Updating prices requires the approval of the chain manager.

The system sends messages to ticket card owners about new movies shown in the chain. The message is sent on the day of the first screening of the movie(s).

### 2.9 Operational monitoring

For operational monitoring and to improve the handling of customers, at the end of every month the system prepares various reports for the chain manager. The cinema manager can also view the prepared reports about her cinema. The prepared reports include: a monthly report of ticket sales by the different cinemas, a report of sales of ticket cards and viewing packages, and in addition, a report of the status of customer complaints in the form of a histogram (showing the distribution of the number of complaints during the month), for every cinema and for the whole chain.

The chain manager may ask to receive additional reports that are similar in nature but different in content. Therefore, the system must be built in a flexible way, so that producing new reports will require minimal development work.

### 2.10 User information

Every use of the system by the chain's employees requires the user to identify herself (with a name and password) as an authorized user.

All the personal information of the chain's employees is available in the system, while the registration is done as an external process (there is no need to implement this in the system, and it can be assumed that the information is given in the system's database).

Several different users can be connected to the system at the same time. The same user cannot be connected to the system more than once at the same time.

Customers use the system but are not required to identify themselves. A customer who asks to view the details of the products she bought (tickets, links or a ticket card), or to view the status of a complaint she submitted, will be identified by her ID number.

### 2.11 General

In general, the operation of the system must be efficient and user-friendly in every possible aspect.

The system must be designed according to the appropriate and correct design principles (as will be taught in the lectures), and according to the existing needs and constraints. The system must perform the required computing activity in the most efficient way possible, both operationally (the way the user performs actions) and in the efficiency of the internal processing done in the system. In addition, the system must be flexible and allow future changes to the way it works and is operated, efficiently and safely.

## 3. System Definition

The system has different components that allow it to perform the actions required of it. You must develop a software system in the **Java** language that implements the components of the system described in this document. The system will be distributed in its operation, so that the system can be used from several end stations at the same time by different users. The system will be built in a **client-server architecture** and will include a tabular (relational) database. The work will be carried out in stages, according to the instructions you will receive during the semester.

The development of the system is divided into two stages. In the first stage (first version), the system will be used through workstations on personal computers or laptops. The communication between the stations and the system's server will work only through a local network (LAN) based on TCP/IP (where the user interface will not be web-based). In the second stage (second version), the system will be accessible from anywhere through the internet. Within this project, only stage A of the system is developed. Your project includes only the first stage (first version). You must design and develop the system so that the transition to the second stage (second version) will be as efficient and smooth as possible.

## 4. General Instructions

The work on all the project's tasks is group work of all the group members. The work on the different tasks must not be divided between the group members so that each one does part of the task independently / in isolation from the others. All the group members must take part in carrying out all the parts of the project.

**Reuse** (internal and external) is one of the topics taught in the course and is required in the work on the project. The parts of the project that can be reused externally are the infrastructure parts of the software architecture, and they will be described, explained and practiced during the course.

It is strictly forbidden to reuse parts of the different course tasks, for example: parts of a model or code (software) from the work of other students / groups in this semester, or projects and tasks given in previous semesters.

For any question about the required system, please contact the course staff.

**Good luck**
