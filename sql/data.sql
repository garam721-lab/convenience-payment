INSERT INTO store (store_id, name)
VALUES (1, 'GS25');

INSERT INTO store (store_id, name)
VALUES (2, 'CU');

INSERT INTO store (store_id, name)
VALUES (3, '세븐일레븐');


INSERT INTO payment_method (pay_id, method)
VALUES (1, '신한카드');

INSERT INTO payment_method (pay_id, method)
VALUES (2, '네이버페이');

INSERT INTO payment_method (pay_id, method)
VALUES (3, '카카오페이');

INSERT INTO payment_method (pay_id, method)
VALUES (4, '토스페이');


INSERT INTO benefit (benefit_id, store_id, pay_id, discount_rate)
VALUES (1, 1, 1, 10);

INSERT INTO benefit (benefit_id, store_id, pay_id, discount_rate)
VALUES (2, 1, 2, 5);

INSERT INTO benefit (benefit_id, store_id, pay_id, discount_rate)
VALUES (3, 1, 3, 3);

INSERT INTO benefit (benefit_id, store_id, pay_id, discount_rate)
VALUES (4, 1, 4, 7);

INSERT INTO benefit (benefit_id, store_id, pay_id, discount_rate)
VALUES (5, 2, 1, 5);

INSERT INTO benefit (benefit_id, store_id, pay_id, discount_rate)
VALUES (6, 2, 2, 10);

INSERT INTO benefit (benefit_id, store_id, pay_id, discount_rate)
VALUES (7, 2, 3, 3);

COMMIT;