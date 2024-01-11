-- Active: 1703111657368@@127.0.0.1@3306

-- Práticas
CREATE TABLE users_krexu (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  created__at TEXT NOT NULL DEFAULT (DATETIME())
)

INSERT INTO users_krexu (id, name, email, password)
VALUES
  ('u001', 'Fulano', 'fulano@email.com', '123456'),
  ('u002', 'Culano', 'culano@email.com', '623456'),
  ('u003', 'Bulano', 'bulano@email.com', '923456');


SELECT * FROM users_krexu

CREATE TABLE follows (
  follower_id TEXT NOT NULL,
  followed_id TEXT NOT NULL,
  FOREIGN KEY (follower_id) REFERENCES users_krexu (id),
  FOREIGN KEY (followed_id) REFERENCES users_krexu (id)
);

INSERT INTO follows (follower_id, followed_id)
VALUES
  ('u001', 'u002'),
  ('u001', 'u003'),
  ('u002', 'u001');

  SELECT * FROM users_krexu
  INNER JOIN follows
  ON users_krexu.id = follows.follower_id;

  SELECT * FROM users_krexu
  LEFT JOIN follows
  ON follows.follower_id = users_krexu.id;

  SELECT
    users_krexu.id AS userId,
    users_krexu.name AS userName,
    users_krexu.email,
    users_krexu.password,
    users_krexu.created__at AS createdAt,
    follows.followed_id AS followedId,
    usersFollowed.name AS followedName
  FROM users_krexu
  LEFT JOIN follows
  ON follows.follower_id = users_krexu.id
  INNER JOIN users_krexu AS usersFollowed
  ON follows.followed_id = usersFollowed.id;
    

-- PETSHOP

CREATE TABLE pet_shop (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  cellphone TEXT NOT NULL,
  created__at TEXT NOT NULL DEFAULT (DATETIME())
)

INSERT INTO pet_shop (id, name, email, cellphone)
VALUES
  ('p001', 'Fofa', 'fofa@email.com', '123456'),
  ('p002', 'Batman', 'batman@email.com', '623456'),
  ('p003', 'Mingau', 'mingau@email.com', '923456');


SELECT * FROM pet_shop

CREATE TABLE follows (
  follower_id TEXT NOT NULL,
  followed_id TEXT NOT NULL,
  FOREIGN KEY (follower_id) REFERENCES users_krexu (id),
  FOREIGN KEY (followed_id) REFERENCES users_krexu (id)
);

INSERT INTO follows (follower_id, followed_id)
VALUES
  ('u001', 'u002'),
  ('u001', 'u003'),
  ('u002', 'u001');

  SELECT * FROM users_krexu
  INNER JOIN follows
  ON users_krexu.id = follows.follower_id;

  SELECT * FROM users_krexu
  LEFT JOIN follows
  ON follows.follower_id = users_krexu.id;

  SELECT
    users_krexu.id AS userId,
    users_krexu.name AS userName,
    users_krexu.email,
    users_krexu.password,
    users_krexu.created__at AS createdAt,
    follows.followed_id AS followedId,
    usersFollowed.name AS followedName
  FROM users_krexu
  LEFT JOIN follows
  ON follows.follower_id = users_krexu.id
  INNER JOIN users_krexu AS usersFollowed
  ON follows.followed_id = usersFollowed.id;

  -- Simone