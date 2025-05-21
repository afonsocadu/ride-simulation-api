# System Design Documentation

## Ride Simulation API 

### Overview - Implements user registration/login and ride‑hailing endpoints via a stateless, token-based authentication API.


**System Objective:** 

**Key Features:**
- User authentication (signup, login) via Devise Token Auth
- Ride endpoints
    - `GET /rides` – list all rides for the current user
    - `POST /rides` – create a new ride request
    - `PATCH /rides/:id` – update ride status (completed)

---

### Data Modeling
#### Entities & Relationships

1. **Ride:**
    - `belongs_to :user` — Each Ride belongs to a User. Each ride request is associated with a specific user.

2. **User:**
    - `has_many :rides` — A User can have many Rides. Each user can request multiple rides.
    - **Business Rule:**  User authentication is managed by Devise Token Auth, ensuring security and flexibility for multiple platforms (web, mobile).

--


### Authentication Flow

- The Devise Token Auth gem was chosen to handle user authentication, as it is a widely adopted solution for stateless, token-based authentication using JWTs.
- This approach is particularly well-suited for APIs that serve multiple platforms, allowing the backend to operate independently of the frontend.
- Additionally, it is a mature and well-maintained gem, with frequent updates and an active community, ensuring security, compatibility with Devise, and easy integration into modern Rails projects


1. **Login - Credential Submission**
    - The user submits their credentials (email and password) to the login endpoint (POST /auth/sign_in).
    - The server validates the credentials and, if correct, generates a JWT token for the user.


2. **Server Response with Token**
    - The server sends a response containing the generated JWT token, which will be used to authenticate subsequent requests.

    ```bash
    {
    "access-token": "xyz123",
    "client": "client_token",
    "uid": "user@example.com"
    }
    ```

3. **Authenticated Requests**
    - The user includes the JWT token in subsequent requests through the Authorization header:

    ```http
    Authorization: Bearer xyz123
    ```

   The server validates the token in each request, ensuring that the user is authenticated before processing the request.

4. **Logout - Token Invalidation**
    - The user can log out by sending a request to the logout endpoint (DELETE /auth/sign_out).
    - The server invalidates the JWT token, ensuring that it cannot be used for further requests.

--

### Architecture

- **Architecture Style:** Monolithic — All logic resides within a single Ruby on Rails application.
- **Pattern:** MVC (Model-View-Controller)
    - **Model:** Core business logic and relationships.
    - **Controller:** HTTP handling and coordination.
    - **View:** Not applicable (API-only).

---

### Technologies Used:

- **Ruby**: Version 3.1.3
- **Rails**: Version 6.1.7
- **SQLite3**: Version 1.4 (Database)
- **RSpec Rails**: Testing framework for Rails
- **Devise Token Auth**: User authentication via JWT tokens


