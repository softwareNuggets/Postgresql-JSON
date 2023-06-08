create or replace function fn_fetch_movies(pattern text)
returns setof json 
AS
$$
begin

	return query
	select
		json_build_object(
			'movie_id', m.movie_id,
			'movie_name', m.movie_name,
			'year_released',m.year_released
		)
	from movies m
	where m.movie_name LIKE '%' || COALESCE(pattern, 'Lion') || '%';

end;
$$
Language 'plpgsql';




select * from fn_fetch_movies(NULL);
select * from fn_fetch_movies('Father')


