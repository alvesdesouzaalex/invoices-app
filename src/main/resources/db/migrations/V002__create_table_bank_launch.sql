CREATE TABLE IF NOT EXISTS bank_launch (
	id BIGINT PRIMARY KEY NOT NULL,
	description VARCHAR(100),
    card VARCHAR(100),
    place VARCHAR(100),
    amount DECIMAL(10,2) NOT NULL,
    installment_value DECIMAL(10,2) NOT NULL,
    number_of_installments INTEGER NOT NULL,
    dte_purchase DATE NOT NULL,
    due_date DATE NOT NULL,
    dte_last_installment DATE NOT NULL,
	buyer_id VARCHAR NOT NULL,
	launch_type VARCHAR(25) NOT NULL,
	status VARCHAR(50),
    number_of_installments_paid INTEGER NOT NULL,
    number_of_installments_remaining INTEGER NOT NULL,
    remaining_total_amount DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);


CREATE SEQUENCE IF NOT EXISTS bank_launch_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



CREATE TABLE IF NOT EXISTS invoice (
    id BIGINT PRIMARY KEY NOT NULL,
    description VARCHAR(100),
    amount DECIMAL(10,2) NOT NULL,
    discount DECIMAL(10,2) NOT NULL,
    total_paid DECIMAL(10,2) NOT NULL,
    buyer_id VARCHAR NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
    );


CREATE SEQUENCE IF NOT EXISTS invoice_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE IF NOT EXISTS invoice_bank_launch (
    invoice_id BIGINT NOT NULL,
    bank_launch_id BIGINT NOT NULL,
    PRIMARY KEY (invoice_id, bank_launch_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (bank_launch_id) REFERENCES bank_launch(id)
    );


