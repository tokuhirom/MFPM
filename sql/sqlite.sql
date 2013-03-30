CREATE TABLE user (
    id INTEGER NOT NULL PRIMARY KEY,
    github_login VARCHAR(255) UNIQUE,
    github_info  TEXT
);

CREATE TABLE distribution (
    name VARCHAR(255) UNIQUE
);

CREATE TABLE review (
    id INTEGER NOT NULL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    distribution_id INTEGER NOT NULL,
    review_version VARCHAR(255) NOT NULL,
    body TEXT,
    created_on INTEGER NOT NULL
);

CREATE TABLE comment (
    id INTEGER NOT NULL PRIMARY KEY,
    review_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    body TEXT,
    created_on INTEGER NOT NULL
);
