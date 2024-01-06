-- Функція для отримання фільмів з вказаним рейтингом
CREATE OR REPLACE FUNCTION get_movies_by_rating(p_rating VARCHAR)
RETURNS TABLE (
  movie_id INT,
  title VARCHAR(260),
  release_date DATE,
  genre VARCHAR(50),
  total_gross DECIMAL(18, 2),
  inflation_adjusted_gross DECIMAL(18, 2),
  mpaa_rating VARCHAR(10)
)
AS $$
BEGIN
  RETURN QUERY
  SELECT
    md.movie_id,
    md.title,
    md.release_date,
    mg.genre,
    f.total_gross,
    f.inflation_adjusted_gross,
    r.mpaa_rating
  FROM
    movie_details md
    JOIN movie_genre mg ON md.movie_id = mg.movie_id
    JOIN financials f ON md.financials_id = f.financials_id
    JOIN rating r ON md.rating_id = r.rating_id
  WHERE
    r.mpaa_rating = p_rating;
END;
$$ LANGUAGE plpgsql;
