CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    post_content VARCHAR(100),
    post_date TIMESTAMP
    
);



INSERT INTO Posts VALUES
(1, 'Lorem ipsum dolor sit amet', '2023-08-25 10:00:00'),
(2, 'Exploring the beauty of nature', '2023-08-26 15:30:00'),
(3, 'Unveiling the latest tech trends', '2023-08-27 12:00:00'),
(4, 'Journey into the world of literature', '2023-08-28 09:45:00'),
(5, 'Capturing the essence of city life', '2023-08-29 16:20:00');

CREATE TABLE UserReactions (
    reaction_id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    reaction_type VARCHAR(20),
    reaction_date TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);


INSERT INTO UserReactions VALUES
(1,101,1,'like','2023-08-25 10:15:00'),
(2,102,1,'comment','2023-08-25 11:30:00'),
(3,103,1,'share','2023-08-26 12:45:00'),
(4,101,2,'like','2023-08-26 15:45:00'),
(5,102,2,'comment','2023-08-27 09:20:00'),
(6,104,2,'like','2023-08-27 10:00:00'),
(7,105,3,'comment','2023-08-27 14:30:00'),
(8,101,3,'like','2023-08-28 08:15:00'),
(9,103,4,'like','2023-08-28 10:30:00'),
(10,105,4,'share','2023-08-29 11:15:00'),
(11,104,5,'like','2023-08-29 16:30:00'),
(12,101,5,'comment','2023-08-30 09:45:00');


SELECT * FROM posts;

SELECT * FROM userReactions;

SELECT p.post_id,p.post_content,sum(CASE WHEN reaction_type ='like' 
THEN 1 ELSE 0 END) AS number_of_likes ,
sum(CASE WHEN reaction_type='comment'THEN 1 ELSE 0 END)AS number_of_comments,
sum(CASE WHEN reaction_type='share'THEN 1 ELSE 0 END)AS number_of_shares FROM userReactions u
 JOIN posts p ON p.post_id=u.post_id GROUP BY p.post_id HAVING p.post_id=2;

SELECT p.post_id,p.post_content,count( reaction_type )AS Total_Reaction FROM posts P
JOIN userReactions u ON p.post_id=u.post_id WHERE u.reaction_date>='2023-08-24'AND u.reaction_date<='2023-08-30'
GROUP BY p.post_id ORDER BY Total_Reaction DESC LIMIT 3;

SELECT DATE(reaction_date),count(reaction_type ) AS total_Reaction ,count(DISTINCT user_id ) AS Distinct_User_id , 
count( * )*1.0/count(DISTINCT user_id) AS Avg_Reaction_per_User FROM userReactions 
GROUP BY DATE(reaction_date) ORDER BY DATE ;


SELECT p.post_id,p.post_content,sum(CASE WHEN reaction_type ='like' 
THEN 1 ELSE 0 END) AS number_of_likes ,
sum(CASE WHEN reaction_type='comment'THEN 1 ELSE 0 END)AS number_of_comments,
sum(CASE WHEN reaction_type='share'THEN 1 ELSE 0 END)AS number_of_shares FROM userReactions u
 JOIN posts p ON p.post_id=u.post_id GROUP BY p.post_id HAVING p.post_id=2;








