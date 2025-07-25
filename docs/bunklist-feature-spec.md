Of course. This is an excellent project. Automating the bunk list process will save the admin a lot of time and reduce errors.

Here is a detailed feature specification document that an AI agent or a development team can use to build this feature for the Brettl Hupfers Ski Club website.

***

## Feature Specification: Automated Bunk List Generation

### 1.0 Objective

To create a semi-automated system for the ski club admin to generate, manage, and distribute a weekly bunk list. This feature will replace the current manual spreadsheet process, leveraging existing reservation data to automatically assign bunks, while still allowing for manual adjustments. The final list will be printable and email-able to members.

### 2.0 Data Model & Schema Additions

To support this feature, the database needs to understand the physical layout of the clubhouse rooms and bunks. The following tables should be added to the schema.

**2.1 `rooms` Table**

This table will store information about each room in the clubhouse.

| Column Name | Data Type | Details                                                 |
| :---------- | :-------- | :------------------------------------------------------ |
| `id`        | `integer` | Primary Key                                             |
| `name`      | `string`  | The name of the room (e.g., "Cannon Mt", "Bear Mt").      |
| `gender`    | `string`  | The designated gender for the room ("women" or "men").  |
| `order`     | `integer` | An integer to control the display order on the bunk list. |
| `created_at`| `datetime`|                                                         |
| `updated_at`| `datetime`|                                                         |

**2.2 `bunks` Table**

This table will define every bunk within each room, including who "owns" it.

| Column Name | Data Type | Details                                                              |
| :---------- | :-------- | :------------------------------------------------------------------- |
| `id`        | `integer` | Primary Key                                                          |
| `room_id`   | `integer` | Foreign Key to `rooms.id`.                                           |
| `owner_id`  | `integer` | Foreign Key to `users.id`. **Nullable**. If NULL, the bunk is "Open." |
| `name`      | `string`  | The bunk identifier (e.g., "3 L", "16 S", "28 U").                    |
| `bunk_type` | `string`  | The type of bunk ("Lower", "Upper", "Single"). Corresponds to L/U/S.  |
| `order`     | `integer` | An integer to control the bunk's display order within a room.         |
| `created_at`| `datetime`|                                                                      |
| `updated_at`| `datetime`|                                                                      |

**2.3 `bunk_assignments` Table**

This table will store the assignment of a reservation to a specific bunk for a specific reservation week. This makes the generated list persistent and editable.

| Column Name | Data Type | Details                                          |
| :---------- | :-------- | :----------------------------------------------- |
| `id`        | `integer` | Primary Key                                      |
| `reservation_week_id` | `integer` | Foreign Key to `reservation_weeks.id`.     |
| `reservation_id`| `integer` | Foreign Key to `reservations.id`.              |
| `bunk_id`   | `integer` | Foreign Key to `bunks.id`.                       |
| `created_at`| `datetime`|                                                  |
| `updated_at`| `datetime`|                                                  |

**2.4 Seed Data**

The `rooms` and `bunks` tables will need to be populated once with the data from the provided spreadsheet to reflect the real-world clubhouse layout. This is a one-time setup task.

### 3.0 User Roles & Permissions

*   **Admin (`users.admin == true`):** The entire Bunk List feature will be accessible only to Admins. They can generate, view, edit, print, and email bunk lists.
*   **Standard User:** No changes to their permissions. They cannot access this feature.

### 4.0 Feature Workflow & UI/UX

**4.1 Accessing the Feature**

1.  A new navigation link, **"Bunk Lists,"** will be added to the main admin dashboard/menu.
2.  Clicking this link will take the admin to the Bunk List Index Page.

**4.2 Bunk List Index Page**

*   This page will display a list of all `reservation_weeks` from the database.
*   Each row in the list will represent one week and contain:
    *   The reservation week date (`reservation_weeks.res_date`).
    *   The status of the bunk list for that week:
        *   **Not Generated:** No assignment has been attempted.
        *   **Draft:** An assignment has been generated but not finalized.
        *   **Finalized:** The list has been completed and likely already sent.
    *   A set of action buttons:
        *   **"Generate List":** If status is "Not Generated."
        *   **"View / Edit":** If status is "Draft" or "Finalized."
        *   **"Delete List":** Resets the bunk assignments for that week.

**4.3 Generating a New Bunk List (The Core Logic)**

1.  Admin clicks the **"Generate List"** button for a specific week.
2.  The system will execute the following automated assignment algorithm:
    *   **Step 1: Fetch Data.** Retrieve all `reservations` for the selected `reservation_week_id`. Also, fetch all `bunks` and their associated `owner_id` and `room.gender`.
    *   **Step 2: Assign Owners.** Iterate through the reservations. If a `reservation.user_id` matches a `bunk.owner_id`, automatically create a `bunk_assignment` record linking that reservation to that bunk.
    *   **Step 3: Assign Non-Owners.** For all remaining (unassigned) reservations, iterate through them and assign them to the first available bunk that meets the following criteria:
        *   The bunk is not already assigned for this week.
        *   The bunk is not owned by someone else who is also attending this week.
        *   The `room.gender` for the bunk matches the `reservation.sex`.
        *   An available "Open" bunk is preferred over an "Owned" bunk.
    *   **Step 4: Create Records.** For each successful assignment in Steps 2 and 3, a new record is created in the `bunk_assignments` table.
3.  After the generation process is complete, the admin is redirected to the Bunk List Management/Edit Page for that week.

**4.4 Bunk List Management/Edit Page**

This is the primary interface for managing the generated list.

*   **Layout:** The page will visually mimic the spreadsheet layout, with a "WOMEN'S ROOMS" section and a "MEN'S ROOMS" section, displayed side-by-side.
*   **Room & Bunk Display:** Within each section, rooms and bunks will be listed according to their `order` attribute.
*   **Assignments:**
    *   For each bunk, the display will show: `Bunk Name` (e.g., "15 L"), `Owner Name` (or "Open"), and the `Occupant`.
    *   The **Occupant** will be a dropdown menu, pre-selected with the person assigned by the algorithm. The dropdown will contain all other *unassigned* people of the matching gender for that week, plus an "Empty" option.
    *   This allows the admin to easily override any assignment by selecting a different person from the dropdown.
*   **Drag-and-Drop:** To make editing intuitive, names should be draggable. An admin can drag a person from one bunk to another (of the same gender section) or from the "Unassigned" panel to a bunk.
*   **Unassigned Panel:** A panel on the side of the screen will list any members with reservations that the system could not automatically assign (e.g., if rooms were full). This ensures no one is forgotten.
*   **Action Buttons:**
    *   **"Save Draft":** Saves all current changes to the `bunk_assignments` table.
    *   **"Print":** Opens a new, printer-friendly browser tab (see 4.5).
    *   **"Finalize & Email":** Locks the list from further editing and initiates the email process (see 4.6).

**4.5 Printing the Bunk List**

*   Clicking the **"Print"** button will generate a clean HTML page designed for printing.
*   **Formatting:** The layout will be a high-fidelity replica of the provided Excel sheet, including headers, room names, and columns for Bunk, Owner, and Occupant.
*   **Dynamic Data:** All data will be pulled from the saved `bunk_assignments` for that week.
*   **Summary Section:** The bottom of the printout will include a dynamically calculated summary:
    *   Total Female Bunks / Occupied / Open / Owned
    *   Total Male Bunks / Occupied / Open / Owned
    *   Total Bunks / Total Occupied

**4.6 Emailing the Bunk List**

1.  Clicking **"Finalize & Email"** will first present the admin with a confirmation dialog.
2.  Upon confirmation:
    *   The bunk list status for that week is set to "Finalized."
    *   The system gathers the email addresses of all users associated with the reservations for that week (`users.email`).
    *   An email is sent to all these recipients.
    *   **Email Content:** The email will be an HTML email with the following content:
        *   **Subject:** Bunk List for Your Upcoming Stay at Brettl Hupfers!
        *   **Body:**
            *   A friendly greeting.
            *   A simple, clean HTML table showing the final bunk assignments (Room, Bunk, Occupant).
            *   Any notes the admin wishes to add (via a text box presented before sending).
            *   The `reservation_weeks.note` field should also be displayed prominently.

### 5.0 Future Considerations & Potential Enhancements

*   **Dinner Preferences:** The `reservations.dinner` is a boolean. The spreadsheet tracks Meat (M) vs. Veggie (V). Consider changing the `dinner` column to a `string` in the `reservations` table to store this preference ("meat", "veggie", "none") for more accurate dinner planning on the bunk list.
*   **Advanced Assignment Logic:** Future iterations could include more complex assignment rules, such as trying to keep families or groups with the same last name in adjacent bunks or rooms.
*   **Payment Tracking:** Integrate with a payment system to show a "Paid" status on the bunk list, as seen in the spreadsheet.
*   **Bunk-Specific Comments:** Allow members to add a comment to their reservation like "Prefers an upper bunk" or "Needs to be near the exit," which the admin can see during the manual adjustment phase.