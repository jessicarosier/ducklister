USE adlister_db;

INSERT INTO users (username, email, password)
VALUES ('JessicaRosier', 'jessicarosierc@gmail.com', 'password'),
       ('JordanRosier', 'jordanrosier1@gmail.com', 'paSSw0rd');



INSERT INTO ads (title, description, user_id)
VALUES ('Washer and Dryer', 'Washer and Dryer for sale. 2 years old. Works great. $500', 1),
       ('2005 Honda Accord', '2005 Honda Accord for sale. 150,000 miles. $5,000', 2),
       ('70in flat screen TV', '70in Samsung Flat Screen TV, works great, 300 bucks OBO', 1),
       ('Desk Chair', 'old rolling desk chair, the cat has been using it as a scratching post. Free to anyone who wants it.', 1),
       ('Play Station Games', 'Original playstation games incluing Parapa Tha Rappa and Um Jammer Lammy. Must haves for any great collection!', 2);