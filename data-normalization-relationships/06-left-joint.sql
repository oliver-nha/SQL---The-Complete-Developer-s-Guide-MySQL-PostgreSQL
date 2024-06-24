select *
from users as u
    left JOIN addresses as a on a.id = u.address_id
    left JOIN cities as c on c.id = a.city_id
