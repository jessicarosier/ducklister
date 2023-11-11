USE adlister_db;

INSERT INTO category (cat_title)
VALUES ('Generic'),
       ('Music'),
       ('Sports'),
       ('Seasonal'),
       ('International'),
       ('Patriotic'),
       ('Movie'),
       ('Superhero');

INSERT INTO users (username, first_name, last_name, email, password, jeep_model, jeep_year, jeep_color)
VALUES ('duckyMan', 'Donald', 'Duck', 'donduck@disney.com', 'password', 'Wrangler', 2015, 'Red'),
       ('mickeyMan', 'Mickey', 'Mouse', 'themouse@disney.com', 'password', 'Wrangler', 2023, 'Blue'),
       ('JeepGuy', 'John', 'Doe', 'jdoe@gmail.com', 'password', 'Wrangler', 2018, 'Black'),
       ('AllThingsJeep', 'Jane', 'Doe', 'janedoe@yahoo.com', 'password', 'Wrangler', 2019, 'White'),
       ('JeepLover', 'Jill', 'Doe', 'jeep_jill@aol.com', 'password', 'Wrangler', 2017, 'Green'),
       ('steveTheDeer', 'Steve', 'Deer', 'justAdeer@live.com', 'password', 'Wrangler', 2016, 'Yellow'),
       ('jrose', 'Jessica', 'Rosier', 'jessicarosierc@gmail.com', 'password', 'Wrangler', 2015, 'Red');

INSERT INTO ads (user_id, title, description)
VALUES (1, 'American Duck!', 'This duck is as American as they come!'),
       (2, 'Duck in the headlights', 'This duck is a little scared of the headlights!'),
       (3, 'USN Duck', 'A Navy CPO pride duck! HooYah!'),
       (4, 'USMC Duck', 'A Marine Corps pride duck! Oorah!'),
       (5, 'USAF Duck', 'An Air Force pride duck! Aim High!'),
       (6, 'Punk Rock Duck', 'Check out this Rockin Duck! He can jam out with during your next off road adventure!');

INSERT INTO ads_category (ad_id, cat_id)
VALUES (1, 1),
       (2, 2),
       (3, 1),
       (3, 3),
       (4, 1),
       (4, 4),
       (5, 1),
       (5, 5),
       (6, 1),
       (6, 6);









