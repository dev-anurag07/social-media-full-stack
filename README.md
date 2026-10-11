# DBMS Social & Chat Application

A full-stack social/chat application built with **Node.js**, **Express**, **Socket.IO**, and **React**. Users can sign up, create posts, comment, like, and chat in real time.

## Table of Contents

* [Features](#features)
* [Tech Stack](#tech-stack)
* [Getting Started](#getting-started)

  * [Prerequisites](#prerequisites)
  * [Environment Variables](#environment-variables)
  * [Backend Setup](#backend-setup)
  * [Frontend Setup](#frontend-setup)
* [API Reference](#api-reference)
* [Socket.IO Chat](#socketio-chat)
* [Folder Structure](#folder-structure)
* [Scripts](#scripts)
* [Contributing](#contributing)
* [License](#license)

---

## Features

* **User Authentication** (JWT‑based)
* **Create, Read, Update, Delete** posts
* **Comments** and **Likes** on posts
* **Real‑time Chat** powered by Socket.IO
* Responsive **React** front‑end

---

## Tech Stack

| Layer     | Technology              |
| --------- | ----------------------- |
| Backend   | Node.js, Express.js     |
| Database  | MySQL
| Real‑time | Socket.IO               |
| Frontend  | React, Context API, CSS |
| Dev Tools | ESLint, Prettier        |

---

## Getting Started

### Prerequisites

* [Node.js](https://nodejs.org/) v16+
* [npm](https://npmjs.com/) or [yarn](https://yarnpkg.com/)
* A running **MongoDB** instance (local or Atlas)

### Environment Variables

Create a `.env` file in **both** `/dbms-backend-main` and `/dbms-frontend-main`:

#### Backend (`dbms-backend-main/.env`)

```ini
PORT=4000
MONGODB_URI=<your-mongodb-connection-string>
JWT_SECRET=<your-jwt-secret>
```

#### Frontend (`dbms-frontend-main/.env`)

```ini
REACT_APP_API_URL=http://localhost:4000/api
REACT_APP_SOCKET_URL=http://localhost:4000
```

---

### Backend Setup

1. ```bash
   cd dbms-backend-main
   npm install
   ```
2. Start the server:

   ```bash
   npm run dev
   ```

   The API will be available at `http://localhost:4000/api`.

---

### Frontend Setup

1. ```bash
   cd dbms-frontend-main
   npm install
   ```
2. Start the React app:

   ```bash
   npm start
   ```

   The UI will open at `http://localhost:3000`.

---

## API Reference

| Route                | Method | Description                         |
| -------------------- | ------ | ----------------------------------- |
| `/api/user/register` | POST   | Register a new user                 |
| `/api/user/login`    | POST   | Authenticate and receive a JWT      |
| `/api/post/`         | GET    | Fetch all posts                     |
| `/api/post/`         | POST   | Create a new post (auth required)   |
| `/api/post/:id`      | GET    | Fetch a single post                 |
| `/api/comment/`      | POST   | Add a comment to a post (auth req.) |
| `/api/message/`      | POST   | Send a one‑to‑one message (auth)    |
| …                    | …      | …                                   |

> **Note:** All protected routes require `Authorization: Bearer <token>` header.

---

## Socket.IO Chat

* Connect to the server:

  ```js
  const socket = io(process.env.REACT_APP_SOCKET_URL, {
    auth: { token: localStorage.getItem('jwt') }
  });
  ```
* **Events**:

  * `connect` / `disconnect`
  * `joinRoom`: join a chat room or conversation
  * `sendMessage`: emit a new message
  * `receiveMessage`: listen for incoming messages

---

## Folder Structure

```text
dbms-backend-main/
├── controllers/
│   ├── message.js
│   ├── post.js
│   └── user.js
├── middlewares/
│   ├── isAuthenticated.js
│   └── multer.js
├── routes/
│   ├── comment.js
│   ├── message.js
│   ├── post.js
│   └── user.js
├── socket/
│   └── socket.js
├── utils/
│   └── db.js
├── index.js
├── package.json
└── .env

dbms-frontend-main/
├── public/
│   └── (static assets & icons)
├── src/
│   ├── components/
│   ├── context/
│   ├── pages/
│   ├── utils/
│   ├── App.js
│   └── index.js
├── package.json
└── .env
```

---

## Scripts

### Backend

* `npm run dev` — start with nodemon
* `npm start` — production start

### Frontend

* `npm start` — development server
* `npm run build` — production build

---

## Contributing

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/YourFeature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/YourFeature`
5. Open a Pull Request

---

## License

This project is licensed under the [MIT License](LICENSE).
Feel free to use, modify, and distribute!
