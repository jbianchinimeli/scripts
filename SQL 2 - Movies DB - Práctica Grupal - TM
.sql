
#Mostrar el título y el nombre del género de todas las series

select s.title , g.name from series s 
inner join genres g on s.genre_id = g.id ;

#Mostrar el título de los episodios, el nombre y apellido de los actores que trabajan en cada uno de ellos.
select e.title , a.first_name , a.last_name from actors a 
inner join actor_episode ae on ae.actor_id = a.id 
inner join episodes e on ae.episode_id = e.id ;

#Mostrar el título de todas las series y el total de temporadas que tiene cada una de ellas.
select
	s.title ,
	COUNT(s.id)
from
	series s
inner join seasons seasons on
	seasons.serie_id = s.id
group by
	s.id;


#Mostrar el nombre de todos los géneros y la cantidad total de películas por cada uno, siempre que sea mayor o igual a 3.
select
	g.name,
	COUNT(g.id) c
from
	genres g
inner join movies m on
	m.genre_id = g.id
group by
	g.id
having
	c >= 3 ;


#Mostrar sólo el nombre y apellido de los actores que trabajan en todas las películas de la guerra de las galaxias y que estos no se repitan.
select
	DISTINCT a.first_name ,
	a.last_name
from
	actors a
inner join actor_movie am ON
	am.actor_id = a.id
inner join movies m on
	am.movie_id = m.id
where
	m.title like '%galaxias%';

