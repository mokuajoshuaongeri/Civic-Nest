CREATE TABLE IF NOT EXISTS civicnest.site_reviews (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(254),
    rating SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT NOT NULL CHECK (
        char_length(review_text) BETWEEN 10 AND 2000
    ),
    status TEXT NOT NULL DEFAULT 'new'
        CHECK (status IN ('new', 'reviewed')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS site_reviews_status_created_idx
    ON civicnest.site_reviews (status, created_at DESC);
