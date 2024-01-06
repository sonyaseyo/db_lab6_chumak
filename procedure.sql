-- Процедура для зміни жанру фільму за його ідентифікатором
CREATE OR REPLACE PROCEDURE update_movie_genre(
  p_movie_id INT,
  p_new_genre VARCHAR(50)
)
AS $$
BEGIN
  -- оновлення запису, якщо він існує
  BEGIN
    UPDATE movie_genre
    SET genre = p_new_genre
    WHERE movie_id = p_movie_id;

    -- комітимо транзакцію
    COMMIT;
    RAISE NOTICE 'genre updated.';
  EXCEPTION
    WHEN unique_violation THEN
      -- якщо запис не існує, вставляємо новий запис
      INSERT INTO movie_genre (movie_id, genre)
      VALUES (p_movie_id, p_new_genre);

      -- комітимо транзакцію
      COMMIT;
      RAISE NOTICE 'genre added.';
  END;
END;
$$ LANGUAGE plpgsql;
