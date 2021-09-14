CREATE TABLE drop table product;
CREATE TABLE product(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(20),
	p_unitPrice  number,
	p_description varchar(2000),
   	p_category VARCHAR(20),
	p_manufacturer VARCHAR(20),
	p_unitsInStock number,
	p_condition VARCHAR(20),
	p_fileName  VARCHAR(200),
	PRIMARY KEY (p_id)
) ;

