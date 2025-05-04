# Ride Simulation API

Backend API for the Ride Simulation application. Implements user registration/login and ride‑hailing endpoints. Built with **Ruby on Rails 6.1**, authentication via **Devise Token Auth**, and asynchronous processing using **Sidekiq** + **Redis**. Tested with **RSpec** + **FactoryBot**.

---

## Demo Video

Watch the [demo video](https://www.youtube.com/shorts/YAybenB7RCQ) to see the Ride Simulation in action.
---

## Overview

- **User authentication** (signup, login, password recovery) via Devise Token Auth
- **Ride endpoints**
    - `GET /rides` – list all rides for the current user
    - `POST /rides` – create a new ride request
    - `PATCH /rides/:id` – update ride status (completed)

---

## Prerequisites

- Ruby `3.1.3`
- Rails `~> 6.1.7`
- SQLite3 (development & test) **or** PostgreSQL (production)
- Bundler

---

## Installation & Local Execution

1. **Clone the repo**

    ```bash
    git clone https://github.com/your-username/ride-simulation-api.git
    cd ride-simulation-api
    ```

2. **Install gems**

    ```bash
    bundle install
    ```

3. **Configure database**

    ```bash
    rails db:create
    rails db:migrate
    ```

4. **Run Rails server**

    ```bash
    rails server
    ```

---

## Authentication Flow

All ride endpoints are protected. Before calling them, sign in or sign up:

- **Sign up**: `POST /auth`
    - Params: `email`, `password`, `password_confirmation`
    - Response headers: `access-token`, `client`, `uid`

- **Sign in**: `POST /auth/sign_in`
    - Params: `email`, `password`
    - Response headers: `access-token`, `client`, `uid`

Include those three headers in all subsequent API requests.

---

## API Endpoints

| Method | Path         | Description                         | Auth required |
| ------ | ------------ | ----------------------------------- | ------------- |
| GET    | `/rides`     | List current user’s rides           | Yes           |
| POST   | `/rides`     | Create a new ride                   | Yes           |
| PATCH  | `/rides/:id` | Update ride’s `completed` status    | Yes           |
| GET    | `/auth`      | User registration                   | No            |
| POST   | `/auth/sign_in` | User login                       | No            |

### Example: Create a Ride

```bash
POST /rides
Headers:
  access-token: <token>
  client:       <client-id>
  uid:          user@example.com

Body (JSON):
{
  "rider_details": {
    "originLatitude": 40.7128,
    "originLongitude": -74.0060,
    "destinationLatitude": 40.7306,
    "destinationLongitude": -73.9352,
    "completed": false,
    "price": 0
  }
}
```

## Ride Simulation Frontend

For the frontend, check out the [Ride Simulation frontend repository](https://github.com/afonsocadu/ride-simulation-fr).
