# Poppleton Dog Show – Assignment Report

## 1. Project Overview
Poppleton Dog Show is a PHP/MySQL web application that showcases competition data for dogs, owners, judges and events. The public site lets visitors browse statistics, featured dogs, winners and contact the organizers, while the authentication flow enables owners to log in, review their profile and see the dogs linked to their account. The codebase is organized into clear domains:

- `public/` – page controllers (homepage, about, dogs listing, contact, auth, profile) that render HTML and coordinate database access.
- `core/` – configuration and shared database bootstrap (`config.php`, `db.php`).
- `assets/` – design system (CSS, JS, and raster/vector images).
- `database_sql/` – canonical dataset (`Surnames_O_S_cis2360_dog_show_2.sql`) plus extension scripts for new tables required by the assignment.

## 2. How the Site Works
1. **Bootstrap** – Each page pulls `core/config.php` for environment constants and `core/db.php` to obtain a PDO instance configured with sensible defaults (UTF-8, exceptions, prepared statements).
2. **Routing** – Pages are accessed via friendly URLs (e.g., `/public/01_index.php`, `/public/03_dogs.php`). Shared layout pieces such as the header and footer live under `public/partials/`.
3. **Data Fetching** – Server-side PHP executes SQL queries to hydrate view models. Example: the homepage runs statistics and leaderboard queries before rendering.
4. **Rendering** – Data is output with `htmlspecialchars` to prevent XSS. CSS provides a cohesive design, and small JS helpers handle interactivity (search filtering, nav menus).
5. **Authentication** – Login and registration live under `public/auth/`. Sessions store `user_id` and are checked by profile-specific pages (e.g., `owner.php`) to switch between self-view and public-view states.
6. **Contact Flow** – Visitors can submit the contact form to reach the organizing team; owners are encouraged to tie their contact information to their account so people can email them directly from the homepage “dog of the day” card.

## 3. Best Practices in the Codebase
- **Configuration isolation** – `core/config.php` centralizes application constants and supports overrides through environment variables.
- **Database safety** – `core/db.php` uses PDO with `ATTR_ERRMODE` set to `ERRMODE_EXCEPTION`, disables emulate prepares, and sets UTF-8 charset. SQL statements that accept user data rely on prepared statements (e.g., login, registration, owner profile, contact form).
- **Input validation** – Authentication and contact flows trim inputs, enforce constraints (password length, matching confirmation, valid email) and provide error feedback to the user.
-, **Session hygiene** – `session_start()` is called at the top of each page that needs session data; logout destroys the session before redirecting.
- **Presentation layer separation** – Shared header/footer, design tokens in CSS, and unobtrusive JavaScript keep templates clean.
- **Security-conscious output** – User-provided strings are escaped with `htmlspecialchars` consistently.

## 4. Key SQL Queries
Below are the most significant queries and why they matter:

| Location | Purpose | Description |
|----------|---------|-------------|
| `public/01_index.php` (stats) | Homepage counters | `SELECT` statement with three scalar subqueries counts owners, dogs and events in a single round trip. |
| `public/01_index.php` (top dogs) | Leaderboard | Aggregates `entries` by `dog_id`, returns average scores, entry counts and owner metadata, sorted by performance. |
| `public/01_index.php` (event winners) | Best score per event | Uses a derived table to capture each competition’s max score, joins to events/dogs/owners to show winners. |
| `public/01_index.php` (fun facts) | Dynamic highlights | Four separate queries compute “most popular breed”, “owner with most dogs”, “busiest judge”, and “highest average scoring event”. One result is randomly selected per request. |
| `public/03_dogs.php` | Dog gallery | Retrieves every dog with breed and owner names (left joins `dog_images` so dogs without photos still appear). |
| `public/owner.php` | Owner dashboard | Prepared statements fetch a user + linked owner record, then pull dog stats (entries count + avg score) for that owner. |

These queries favor joins and aggregates so that each page can render rich information without excessive round trips.

## 5. Authentication Flow
1. **Registration (`public/auth/02_register.php`)**
   - Validates password length and confirmation.
   - Checks for duplicate emails.
   - Inserts a new `users` record with `role='user'`, `owner_id=NULL`, `is_active=1`.
   - Hashes passwords with PHP’s `password_hash`.
   - Logs the user in immediately (stores `user_id`, `username`, `role` in `$_SESSION`).

2. **Login (`public/auth/01_login.php`)**
   - Looks up the user by email using a prepared statement.
   - Verifies the password via `password_verify`.
   - Stores identity details in the session and redirects to the homepage.

3. **Logout (`public/auth/03_logout.php`)**
   - Starts the session, calls `session_destroy`, and redirects to the homepage.

4. **Protected view (`public/owner.php`)**
   - If a session is active, loads the logged-in user’s owner profile; otherwise supports a public view via `?id=` query parameter.

## 6. Database & SQL Changes
The base dataset (`database_sql/Surnames_O_S_cis2360_dog_show_2.sql`) did not include tables for site accounts or hosted dog photos. To support the assignment features, we introduced:

- **`users` table** – links authentication records to owners, stores password hashes, role and activation status.
- **`dog_images` table** – attaches hosted image URLs (with primary indicator) to each dog.

Both additions are documented and scripted in `database_sql/cis2360_dog_show_app_extensions.sql`, which can be run after importing the original dataset.

## 7. Running the Project
1. Import `database_sql/Surnames_O_S_cis2360_dog_show_2.sql`.
2. Import `database_sql/cis2360_dog_show_app_extensions.sql` to create the supplemental tables.
3. Open `core/config.php` and set `DB_HOST`, `DB_NAME`, `DB_USER`, `DB_PASS` to match your MySQL credentials.
4. Serve the project from a PHP-capable web server (e.g., Apache with the document root pointing at the repo) and navigate to `/public/01_index.php`.

## 8. Future Enhancements
- Owner self-service profile editing and photo uploads.
- Admin console for moderating entries/judges/events.
- Email templating and queue-backed delivery.
