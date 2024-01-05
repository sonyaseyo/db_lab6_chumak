-- Додавання даних до таблиці financials
INSERT INTO financials (total_gross, inflation_adjusted_gross) VALUES
  (184925485, 5228953251),
  (84300000, 2188229052),
  (83320000, 2187090808);

-- Додавання даних до таблиці rating
INSERT INTO rating (mpaa_rating) VALUES
  ('G'),
  ('PG'),
  ('PG-13'),
  ('R');

-- Додавання даних до таблиці movie_details
INSERT INTO movie_details (title, release_date, financials_id, rating_id) VALUES
  ('Snow White and the Seven Dwarfs', '1937-12-21', 1, 1),
  ('Pinocchio', '1940-02-09', 2, 1),
  ('Fantasia', '1940-11-13', 3, 1);

-- Додавання даних до таблиці movie_genre
INSERT INTO movie_genre (movie_id, genre) VALUES
  (1, 'Musical'),
  (2, 'Adventure'),
  (3, 'Comedy');
