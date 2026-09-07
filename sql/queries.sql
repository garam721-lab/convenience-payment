-- 편의점별 결제수단 할인 혜택 조회

SELECT
    s.name,
    p.method,
    b.discount_rate
FROM store s
JOIN benefit b
    ON s.store_id = b.store_id
JOIN payment_method p
    ON p.pay_id = b.pay_id
WHERE s.name = :name;

-- 결제금액 기준 할인액 계산 및 추천

SELECT
    s.name,
    p.method,
    b.discount_rate,
    :amount * b.discount_rate / 100 AS discount_amount
FROM store s
JOIN benefit b
    ON s.store_id = b.store_id
JOIN payment_method p
    ON p.pay_id = b.pay_id
WHERE s.name = :name
ORDER BY discount_amount DESC;