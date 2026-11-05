> **English translation** of the original Hebrew document: [`system_test_scenarios_spring2024.pdf`](system_test_scenarios_spring2024.pdf).
> The translation keeps the structure and content of the original as closely as possible.

---

**Software Engineering 203.3140** · **Spring Semester 2024 (5784)**

# Outline for Testing the Information System of the Cinema Chain "HaSratiya"

| No. | Scenario | Details | Notes |
|---|---|---|---|
| 1. | Logging in to the system | After logging in, a menu that fits each user is shown. | |
| 2. | Browsing the list of movies shown in the cinemas | 1. The list of movies can be paged through.<br>2. Movies can be searched by a search criterion (movies shown in a certain cinema, movies shown on a certain date/dates, movies by genre).<br>3. Movies that will be screened soon can be viewed.<br>4. Packages for home viewing can be viewed.<br>5. The details of a selected movie / home package can be viewed. | The details of a movie include its name (in Hebrew and in English), the producer, the main actors and a summary. A picture is also shown. |
| 3. | Updating content | 1. Adding / removing a movie.<br>2. Adding / removing a package for home viewing.<br>3. Updating screening times.<br>4. Updating prices. | Updating content is done by the chain's content manager.<br>Changing prices after the approval of the chain manager.<br>Sending messages about new movies to ticket card owners. |
| 4. | Buying tickets | 1. After choosing the screening, the system shows the map of the hall.<br>2. Sending a message to the buyer that includes the name of the movie, the name of the branch, the hall number, and the number of seats and their location. | The system will save the purchase details. |
| 5. | Buying movies for home viewing | 1. At the end of the purchase, the system will send a message to the buyer with the name of the movie, the link and the times when it is available.<br>2. The system will send the buyer a reminder message one hour before the time the link becomes available. | The system will save the purchase details.<br>The link will not be available at hours outside the time window in which it was defined as available. |
| 6. | Buying a ticket card | 1. 20 tickets on the ticket card.<br>2. The updated number of tickets can be viewed. | The system will save the buyer's details and the payment method. |
| 7. | Cancelling purchases | 1. Returning tickets, with a refund that depends on the time of the return.<br>2. Returning a viewing package, with a refund that depends on the time of the return. | A ticket card cannot be returned. |
| 8. | Submitting and handling a complaint | 1. The handling can include monetary compensation.<br>2. Handling within 24 hours. | Handled by a customer service worker. |
| 9. | Preparing reports | A monthly report of:<br>1. Ticket sales (with details by the days of the month) for every cinema and for the whole chain.<br>2. A report of sales of ticket cards and viewing packages (with details by the days of the month) – for the whole chain.<br>3. A report of the status of complaints (showing the distribution of the number of complaints during the month) for every cinema and for the whole chain, displayed as a histogram. | The chain manager can view the reports of the chain.<br>A branch manager can view the reports of the branch. |

## Non-Functional Requirements

| No. | Requirement |
|---|---|
| 10. | Client-server, separate computers, running a Jar, a GUI for setting up the connection. |
| 11. | Several users can be connected to the system at the same time.<br>A user cannot be connected more than once at the same time. |
| 12. | Preparing test data in the database. |
| 13. | Performing the computing activity in the most efficient way possible, without manual refreshing of screens. |
| 14. | The system's design must be flexible and adaptable to changes efficiently. |
| 15. | Reuse, use of design patterns. |
| 16. | Quality of the user interface, user-friendliness (use of lists, feedback on progress, reporting of errors and success). |
