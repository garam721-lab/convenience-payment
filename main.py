from fastapi import FastAPI
from database import get_connection

app = FastAPI()


@app.get("/recommend")
def recommend(name: str, amount: int):
    connection = get_connection()
    cursor = connection.cursor()

    sql = """
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
    ORDER BY discount_amount DESC
    """

    cursor.execute(
        sql,
        {"name": name, "amount": amount}
    )

    results = cursor.fetchall()
    
    best_method = results[0][1]
    best_discount_amount=results[0][3]

    recommendations = []

    for row in results:
        recommendations.append({
            "method": row[1],
            "discount_rate": row[2],
            "discount_amount": row[3]
        })

    cursor.close()
    connection.close()

    return {
        "store": name,
        "amount": amount,
        "best_method": best_method,
        "best_discount_amount": best_discount_amount,
        "recommendations": recommendations
    }