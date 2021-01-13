INSERT INTO `charity-donation`.category (id, name) VALUES (1, 'ubrania, które nadają się do ponownego użycia');
INSERT INTO `charity-donation`.category (id, name) VALUES (2, 'ubrania, do wyrzucenia');
INSERT INTO `charity-donation`.category (id, name) VALUES (3, 'zabawki');
INSERT INTO `charity-donation`.category (id, name) VALUES (4, 'książki');
INSERT INTO `charity-donation`.category (id, name) VALUES (5, 'inne');

INSERT INTO `charity-donation`.institution (id, description, name) VALUES (1, 'Pomoc dzieciom z ubogich rodzin', 'Dbam o Zdrowie');
INSERT INTO `charity-donation`.institution (id, description, name) VALUES (2, 'Pomoc wybudzaniu dzieci ze śpiączki', 'A kogo');
INSERT INTO `charity-donation`.institution (id, description, name) VALUES (3, 'Pomoc osobom znajdującym się w trudnej sytuacji życiowej', 'Dla dzieci');
INSERT INTO `charity-donation`.institution (id, description, name) VALUES (4, 'Pomoc dla osób nie posiadających miejsca zamieszkania', 'Bez domu');

INSERT INTO `charity-donation`.donation (id, city, phone_number, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id, status) VALUES (1, 'Cracow', 600600600, 'Great package', '2020-09-15', '15:00:00', 5, 'Raclawicka', '00-000', 1, true);
INSERT INTO `charity-donation`.donation (id, city, phone_number, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id, status) VALUES (2, 'Kielce', 600700800, 'Super package', '2020-09-11', '10:00:00', 2, 'Radomska', '00-000', 2, false);


INSERT INTO `charity-donation`.donation_category (donation_id, category_id) VALUES (1, 3);
INSERT INTO `charity-donation`.donation_category (donation_id, category_id) VALUES (1, 4);
INSERT INTO `charity-donation`.donation_category (donation_id, category_id) VALUES (2, 1);
INSERT INTO `charity-donation`.donation_category (donation_id, category_id) VALUES (2, 5);