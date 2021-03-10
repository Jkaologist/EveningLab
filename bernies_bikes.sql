
CREATE TABLE models (
    id SERIAL PRIMARY KEY,
    model_name TEXT NOT NULL,
    nickname TEXT NOT NULL,
    price_in_dollars INT NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    note TEXT DEFAULT '',
    model_id INTEGER NOT NULL REFERENCES models
);

INSERT INTO models(model_name, nickname, price_in_dollars)
    VALUES
        ('The Flyer', 'FLY', 500),
        ('The Big Haul', 'HAUL', 600),
        ('The Skinny', 'SKIN', 700),
        ('Big Buddy', 'BUD', 800);

INSERT INTO orders(note, model_id)
    VALUES
        ('add training wheels', 1),
        (NULL, 2),
        ('don''t add kickstand', 2),
        ('', 3),
        ('big bike!', 4);

