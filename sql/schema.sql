CREATE TABLE store (
    store_id NUMBER,
    name VARCHAR2(100),
    CONSTRAINT store_id_pk PRIMARY KEY (store_id)
);

CREATE TABLE payment_method (
    pay_id NUMBER,
    method VARCHAR2(100),
    CONSTRAINT pay_id_pk PRIMARY KEY (pay_id)
);

CREATE TABLE benefit (
    benefit_id NUMBER,
    store_id NUMBER,
    pay_id NUMBER,
    discount_rate NUMBER,
    CONSTRAINT benefit_id_pk PRIMARY KEY (benefit_id),
    CONSTRAINT store_id_fk FOREIGN KEY (store_id)
        REFERENCES store (store_id),
    CONSTRAINT pay_id_fk FOREIGN KEY (pay_id)
        REFERENCES payment_method (pay_id)
);