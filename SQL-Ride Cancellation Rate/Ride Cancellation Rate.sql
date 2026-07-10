CREATE TABLE Trips (
    id INT PRIMARY KEY,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR(50),
    request_at DATE
);

INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES
(1, 1, 10, 1, 'completed', '2023-07-12'),
(2, 2, 11, 1, 'cancelled_by_driver', '2023-07-12'),
(3, 3, 12, 6, 'completed', '2023-07-12'),
(4, 4, 13, 6, 'cancelled_by_client', '2023-07-12'),
(5, 1, 10, 1, 'completed', '2023-07-13'),
(6, 2, 11, 6, 'completed', '2023-07-13'),
(7, 3, 12, 6, 'completed', '2023-07-13'),
(8, 2, 12, 12, 'completed', '2023-07-14'),
(9, 3, 10, 12, 'completed', '2023-07-14'),
(10, 4, 13, 12, 'cancelled_by_driver', '2023-07-14');

CREATE TABLE Users (
    users_id INT PRIMARY KEY,
    banned VARCHAR(3),
    ROLE VARCHAR(10)
);

INSERT INTO Users (users_id, banned, ROLE) VALUES
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');

SELECT * FROM Users;
SELECT * FROM Trips;

SELECT request_at AS DAY,round(sum(CASE WHEN status IN('cancelled_by_client','cancelled_by_driver')THEN 1 ELSE 0 END) *1.0 /count(*),2) AS cancellation_rate
FROM trips t JOIN users u ON t.client_id=u.users_id
JOIN users d ON t.driver_id=d.users_id
WHERE u.banned='No'
AND d.banned='No'
GROUP BY request_at;







