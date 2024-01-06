-- тригер для зміни рейтингу фільму
CREATE OR REPLACE FUNCTION update_rating_on_movie_update()
RETURNS TRIGGER AS $$
BEGIN
  -- Оновлення рейтингу в таблиці rating
  UPDATE rating
  SET mpaa_rating = NEW.mpaa_rating
  WHERE rating_id = NEW.rating_id;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- тригер, що викликається перед оновленням рядка в таблиці movie_details
CREATE TRIGGER trigger_update_rating
BEFORE UPDATE ON movie_details
FOR EACH ROW
EXECUTE FUNCTION update_rating_on_movie_update();
