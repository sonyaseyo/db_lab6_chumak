-- Виклик процедури для оновлення жанру фільму
CALL update_movie_genre(1, 'Documentary');

-- Виклик функції для отримання фільмів з рейтингом 'PG-13'
SELECT * FROM get_movies_by_rating('G');

-- Оновлення рейтингу фільму за допомогою UPDATE
UPDATE movie_details SET rating_id = 2 WHERE movie_id = 1;

-- Виведення даних з таблиці movie_details
SELECT * FROM movie_details WHERE movie_id = 1;

-- Виведення даних з таблиці rating
SELECT * FROM rating WHERE rating_id = 2;
