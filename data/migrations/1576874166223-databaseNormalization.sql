 CREATE TABLE bookshelves (id SERIAL PRIMARY KEY, name VARCHAR(255));
-- creates a table called bookshelves with two columns. id, which is the primary key and iterates a number automatically for the id. It has a name column as well which accepts up to 255 characters.

 INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

--  Inserts all of the unique bookshelf names into the bookshelves table from the books table.

 ALTER TABLE books ADD COLUMN bookshelf_id INT;

--  Adds a column to books called bookshelf_id that has the type integer.

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
-- Sets the values of the bookshelf_id column in the books table to the id of the bookshelf in the bookshelves table.

ALTER TABLE books DROP COLUMN bookshelf;

-- Removes the column bookshelf from the books table.

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);

-- sets the bookshelf_id column in books as a foreign key from the bookshelves table.
