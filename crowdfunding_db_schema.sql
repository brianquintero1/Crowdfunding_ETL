CREATE TABLE contacts(
    contact_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY(contact_id)
);

CREATE TABLE category(
    category_id VARCHAR(5) NOT NULL,
    category VARCHAR(100) NOT NULL,
    PRIMARY KEY (category_id)
);

CREATE TABLE subcategory(
    subcategory_id VARCHAR(5) NOT NULL,
    subcategory VARCHAR(100) NOT NULL,
    PRIMARY KEY(subcategory_id)
);

CREATE TABLE campaign(
    cf_id INT NOT NULL,
    contact_id INT NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    description_ TEXT NOT NULL,
    goal NUMERIC (15, 2) NOT NULL,
    pledged NUMERIC(15,2) NOT NULL,
    outcome VARCHAR(20) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    launched_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(5) NOT NULL,
    subcategory_id VARCHAR(5) NOT NULL,
    PRIMARY KEY (cf_id),
    FOREIGN KEY (contact_id) REFERENCES contacts (contact_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory (subcategory_id)
);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_contact_id FOREIGN KEY (contact_id)
REFERENCES contacts (contact_id);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_category_id FOREIGN KEY (category_id)
REFERENCES category (category_id);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_subcategory_id FOREIGN KEY (subcategory_id)
REFERENCES subcategory (subcategory_id);