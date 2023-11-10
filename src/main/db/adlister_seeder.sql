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

SELECT * FROM ads
JOIN ads_category
ON ads.id = ads_category.ad_id
JOIN category
ON ads_category.cat_id = category.id
WHERE category.id = 1;




