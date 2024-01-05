-- Таблиця для фінансових показників
CREATE TABLE financials
(
  financials_id SERIAL PRIMARY KEY,
  total_gross DECIMAL(18, 2) NOT NULL,
  inflation_adjusted_gross DECIMAL(18, 2) NOT NULL
);

-- Таблиця для рейтингів
CREATE TABLE rating
(
  rating_id SERIAL PRIMARY KEY,
  mpaa_rating VARCHAR(10) NOT NULL
);

-- Таблиця для загальної інформації про фільм
CREATE TABLE movie_details
(
  movie_id SERIAL PRIMARY KEY,
  title VARCHAR(260) NOT NULL,
  release_date DATE NOT NULL,
  financials_id INT NOT NULL,
  rating_id INT NOT NULL,
  FOREIGN KEY (financials_id) REFERENCES financials(financials_id),
  FOREIGN KEY (rating_id) REFERENCES rating(rating_id)
);

-- Таблиця для жанрів фільмів
CREATE TABLE movie_genre
(
  movie_id INT NOT NULL,
  genre VARCHAR(50) NOT NULL,
  PRIMARY KEY (movie_id, genre),
  FOREIGN KEY (movie_id) REFERENCES movie_details(movie_id)
);
