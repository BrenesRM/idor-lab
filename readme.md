# IDOR Vulnerability Lab

This lab demonstrates the Insecure Direct Object Reference (IDOR) vulnerability and its mitigation strategies using Flask applications. It includes two versions of the application:
1. **`vulnerable_app`**: A version that simulates the IDOR vulnerability.
2. **`secure_app`**: A secure version that implements basic access control to prevent unauthorized access.

---

## Setup Instructions

### Prerequisites
- Docker and Docker Compose installed on your system.

### Step 1: Clone the Repository
```bash
git clone <repository_url>
cd <repository_directory>
```

### Step 2: Build and Start the Lab
Run the following command to set up the lab:
```bash
docker-compose up
```
This will start two Flask applications:
- **Vulnerable app**: Accessible at `http://localhost:5001`
- **Secure app**: Accessible at `http://localhost:5002`

### Step 3: Test the Applications

#### Vulnerable App
To simulate an IDOR vulnerability:
1. Access any user's data:
   ```bash
   curl http://localhost:5001/user/1
   ```
2. Note that the endpoint does not enforce any access controls, allowing unauthorized access to sensitive data.

#### Secure App
To test the mitigation:
1. Attempt to access another user's data:
   ```bash
   curl http://localhost:5002/user/1
   ```
2. The endpoint will enforce role-based access control and return an **Access Denied (403)** error for unauthorized users.

---

## File Structure
```
.
├── docker-compose.yml
├── vulnerable_app
│   ├── app.py
│   ├── requirements.txt
├── secure_app
│   ├── app.py
│   ├── requirements.txt
└── README.md
```

### Key Files
1. **`vulnerable_app/app.py`**: Contains the code for the vulnerable application.
2. **`secure_app/app.py`**: Contains the code for the secure application.
3. **`docker-compose.yml`**: Orchestrates the two applications in separate containers.
4. **`README.md`**: This file.

---

## Concepts Covered

### 1. Insecure Direct Object Reference (IDOR)
IDOR occurs when an application provides direct access to objects based on user-supplied input without proper authorization checks. This can lead to unauthorized data access or manipulation.

#### Example Scenario
A user can access another user's data by manipulating the `user_id` parameter in the URL:
```bash
GET /user/1
```

### 2. Mitigation Strategies
The secure application implements:
- **Role-based access control (RBAC)**: Ensures users can only access resources they are authorized to view.
- **Authorization checks**: Validates the current user's role and ownership of requested resources.

---

## Security Demonstration

### Vulnerable Endpoint
- Endpoint: `GET /user/<user_id>`
- Behavior: Fetches user data directly without validating ownership or role.

### Secure Endpoint
- Endpoint: `GET /user/<user_id>`
- Behavior: Restricts access based on the current user's role and the `user_id`.

#### Access Control Logic
- Admins can access all user data.
- Regular users can only access their own data.

---

## Cleanup
To stop the lab environment, run:
```bash
docker-compose down
```

---

## References
- [OWASP Top 10: Broken Access Control](https://owasp.org/www-project-top-ten/)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)