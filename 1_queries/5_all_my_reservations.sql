SELECT reservations.id, properties.title, properties.cost_per_night, reservations.start_date, AVG(property_reviews.rating) AS average_rating
FROM reservations
JOIN properties ON reservations.property_id = properties.id
Join property_reviews ON property_reviews.reservation_id = reservations.id
Where reservations.guest_id = 1 AND reservations.end_date < now()::date
GROUP BY properties.id, reservations.id 
ORDER By reservations.start_date
LIMIT 10;