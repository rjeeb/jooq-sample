CREATE TABLE language
(
    id int (7) NOT NULL PRIMARY KEY,
    cd CHAR(2) NOT NULL,
    description varchar (200)
);

CREATE TABLE author
(
    id int (7) NOT NULL PRIMARY KEY,
    first_name varchar (50),
    last_name varchar (50) NOT NULL,
    date_of_birth DATE,
    year_of_birth int (7),
    distinguished int (1)
);

CREATE TABLE book
(
    id int (7) NOT NULL PRIMARY KEY,
    author_id int (7) NOT NULL,
    title varchar (400) NOT NULL,
    published_in int (7) NOT NULL,
    language_id int (7) NOT NULL,

    CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES author (id),
    CONSTRAINT fk_book_language FOREIGN KEY (language_id) REFERENCES language (id)
);

CREATE TABLE book_store
(
    name varchar (400) NOT NULL UNIQUE
);

CREATE TABLE book_to_book_store
(
    name varchar (400) NOT NULL,
    book_id int (7) NOT NULL,
    stock   int (7),

    PRIMARY KEY (name, book_id),
    CONSTRAINT fk_b2bs_book_store FOREIGN KEY (name) REFERENCES book_store (name) ON DELETE CASCADE,
    CONSTRAINT fk_b2bs_book FOREIGN KEY (book_id) REFERENCES book (id) ON DELETE CASCADE
);