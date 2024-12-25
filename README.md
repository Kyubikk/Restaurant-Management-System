# 🍴 Restaurant Management System

## 📝 Overview
The **Restaurant Management System** is a comprehensive solution designed to streamline restaurant operations. It helps manage menus, orders, table reservations, billing, and more, all in a user-friendly interface.

## 🌟 Features
- 📋 **Menu Management:** Easily add, edit, and remove menu items.
- 🛒 **Order Processing:** Track orders efficiently and update their status in real-time.
- 🪑 **Table Reservations:** Manage table bookings with ease.

## 🛠️ Technologies Used
- **Backend:** Ruby on Rails
- **Database:** PostgreSQL
- **Containerization:** Docker
- **Frontend:** HTML, CSS, JavaScript

## 📥 Installation

1. **Prerequisites:**
   - Ruby 3.0 or higher
   - Docker and Docker Compose
   - PostgreSQL

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/Kyubikk/Restaurant-Management-System.git
   ```

3. **Set Up the Environment:**
   - Navigate to the project directory:
     ```bash
     cd Restaurant-Management-System
     ```
   - Build and run the Docker containers:
     ```bash
     docker-compose up --build
     ```

4. **Set Up the Database:**
   - Run database migrations:
     ```bash
     docker-compose run web rake db:create db:migrate
     ```

5. **Run the Application:**
   - Start the Rails server:
     ```bash
     docker-compose up
     ```
   - Access the application at `http://localhost:3000`.
---
