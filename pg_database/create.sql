CREATE TABLE base(
    base_id SERIAL PRIMARY KEY,
    base_name TEXT,
	founded timestamptz
);

INSERT INTO base VALUES (1, 'Tharsisland', to_timestamp('2037-06-03', 'YYYY-MM-DD'));
INSERT INTO base VALUES (2, 'Valles Marineris 2.0', to_timestamp('2040-12-01', 'YYYY-MM-DD'));
INSERT INTO base VALUES (3, 'Gale Cratertown', to_timestamp('2041-08-15', 'YYYY-MM-DD'));
INSERT INTO base VALUES (4, 'New New New York', to_timestamp('2042-02-10', 'YYYY-MM-DD'));
INSERT INTO base VALUES (5, 'Olympus Mons Spa & Casino', null);

CREATE TABLE martian(
    martian_id BIGSERIAL PRIMARY KEY,
    first_name TEXT,
	last_name TEXT,
	base_id BIGINT,
	super_ID BIGINT,
	FOREIGN KEY(base_id) REFERENCES base(base_id),
);

INSERT INTO martian VALUES (1, 'Ray', 'Bradbury', 1, null);
INSERT INTO martian VALUES (2, 'John', 'Black', 4, 10);
INSERT INTO martian VALUES (3, 'Samuel', 'Hinkston', 4, 2);
INSERT INTO martian VALUES (4, 'Jeff', 'Spender', 1, 9);
INSERT INTO martian VALUES (5, 'Sam', 'Parkhill', 2, 12);
INSERT INTO martian VALUES (6, 'Emma', 'Parkhill', 3, 8);
INSERT INTO martian VALUES (7, 'Melissa', 'Lewis', 1, 1);
INSERT INTO martian VALUES (8, 'Mark', 'Watney', 3, null);
INSERT INTO martian VALUES (9, 'Beth', 'Johanssen', 1, 1);
INSERT INTO martian VALUES (10, 'Chris', 'Beck', 4, null);
INSERT INTO martian VALUES (11, 'Nathaniel', 'York', 4, 2);
INSERT INTO martian VALUES (12, 'Elon', 'Musk', 2, null);
INSERT INTO martian VALUES (13, 'John', 'Carter', null, 8);

CREATE TABLE visitor(
    visitor_id BIGSERIAL PRIMARY KEY,
	host_id BIGINT,
    first_name TEXT,
	last_name TEXT,
	FOREIGN KEY(host_id) REFERENCES martian(martian_id)
);

INSERT INTO visitor VALUES (1, 7, 'George', 'Ambrose');
INSERT INTO visitor VALUES (2, 1, 'Kris', 'Cardenas');
INSERT INTO visitor VALUES (3, 9, 'Priscilla', 'Lane');
INSERT INTO visitor VALUES (4, 11, 'Jane', 'Thornton');
INSERT INTO visitor VALUES (5, null, 'Doug', 'Stavenger');
INSERT INTO visitor VALUES (6, null, 'Jamie', 'Waterman');
INSERT INTO visitor VALUES (7, 8, 'Martin', 'Humphries');

CREATE TABLE supply (
	supply_id BIGSERIAL PRIMARY KEY,
	name TEXT,
	description TEXT,
	quantity BIGINT
);

INSERT INTO supply VALUES (1, 'Solar Panel', 'asdasdasd', 912);
INSERT INTO supply VALUES (2, 'Water Filter', 'asdasdasd', 6);
INSERT INTO supply VALUES (3, 'Duct Tape', 'asdasdasd', 951);
INSERT INTO supply VALUES (4, 'Ketchup', 'asdasdasd', 206);
INSERT INTO supply VALUES (5, 'Battery Cell', 'asdasdasd', 17);
INSERT INTO supply VALUES (6, 'USB 6.0 Cable', 'asdasdasd', 42);
INSERT INTO supply VALUES (7, 'Fuzzy Duster', 'asdasdasd', 19);
INSERT INTO supply VALUES (8, 'Mars Bar', 'asdasdasd', 3801);
INSERT INTO supply VALUES (9, 'Air Filter', 'asdasdasd', 23);
INSERT INTO supply VALUES (10, 'Famous Ray''s Frozen Pizza', 'asdasdasd', 823);

CREATE TABLE inventory(
    base_id BIGINT,
	supply_id BIGINT,
    quantity BIGINT,
	FOREIGN KEY(base_id) REFERENCES base(base_id),
	FOREIGN KEY(supply_id) REFERENCES supply(supply_id)
);

INSERT INTO inventory VALUES(1,1,8);
INSERT INTO inventory VALUES(1,3,5);
INSERT INTO inventory VALUES(1,5,1);
INSERT INTO inventory VALUES(1,6,2);
INSERT INTO inventory VALUES(1,8,12);
INSERT INTO inventory VALUES(1,9,1);
INSERT INTO inventory VALUES(2,4,5);
INSERT INTO inventory VALUES(2,8,62);
INSERT INTO inventory VALUES(2,10,37);
INSERT INTO inventory VALUES(3,2,11);
INSERT INTO inventory VALUES(3,7,2);
INSERT INTO inventory VALUES(4,10,91);

