CREATE DATABASE IF NOT EXISTS social_chat;
USE social_chat;


CREATE TABLE IF NOT EXISTS `User` (
    username VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    mobileno VARCHAR(10) UNIQUE NOT NULL,
    profile_image VARCHAR(255) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS Follows (
    follower VARCHAR(50) NOT NULL,
    followed VARCHAR(50) NOT NULL,

    PRIMARY KEY (follower, followed),

    FOREIGN KEY (follower)
        REFERENCES `User`(username)
        ON DELETE CASCADE,

    FOREIGN KEY (followed)
        REFERENCES `User`(username)
        ON DELETE CASCADE,

    CHECK (follower <> followed)
);


CREATE TABLE IF NOT EXISTS Post (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author VARCHAR(50) NOT NULL,
    text VARCHAR(255) NOT NULL,
    media VARCHAR(500) DEFAULT NULL,
    time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    like_count INT NOT NULL DEFAULT 0,

    FOREIGN KEY (author)
        REFERENCES `User`(username)
        ON DELETE CASCADE,

    INDEX idx_post_author_time (author, time)
);



CREATE TABLE IF NOT EXISTS Likes (
    `user` VARCHAR(50) NOT NULL,
    post INT NOT NULL,

    PRIMARY KEY (`user`, post),

    FOREIGN KEY (`user`)
        REFERENCES `User`(username)
        ON DELETE CASCADE,

    FOREIGN KEY (post)
        REFERENCES Post(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Comment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author VARCHAR(50) NOT NULL,
    post INT NOT NULL,
    text VARCHAR(500) NOT NULL,
    parent_comment INT DEFAULT NULL,
    time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (author)
        REFERENCES `User`(username)
        ON DELETE CASCADE,

    FOREIGN KEY (post)
        REFERENCES Post(id)
        ON DELETE CASCADE,

    FOREIGN KEY (parent_comment)
        REFERENCES Comment(id)
        ON DELETE CASCADE,

    INDEX idx_comment_post (post)
);


CREATE TABLE IF NOT EXISTS Chat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user1 VARCHAR(50) NOT NULL,
    user2 VARCHAR(50) NOT NULL,

    FOREIGN KEY (user1)
        REFERENCES `User`(username)
        ON DELETE CASCADE,

    FOREIGN KEY (user2)
        REFERENCES `User`(username)
        ON DELETE CASCADE,

    UNIQUE KEY unique_chat_pair (user1, user2),
    CHECK (user1 <> user2)
);


CREATE TABLE IF NOT EXISTS Message (
    id INT AUTO_INCREMENT PRIMARY KEY,
    chat INT NOT NULL,
    sender VARCHAR(50) NOT NULL,
    text VARCHAR(1000) NOT NULL,
    time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (chat)
        REFERENCES Chat(id)
        ON DELETE CASCADE,

    FOREIGN KEY (sender)
        REFERENCES `User`(username)
        ON DELETE CASCADE,

    INDEX idx_message_chat_time (chat, time)
);



