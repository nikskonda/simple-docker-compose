create database wb_parsed_data
	with owner postgres;

create sequence hibernate_sequence;

alter sequence hibernate_sequence owner to postgres;

create table tag
(
	id bigint not null
		constraint tag_pkey
			primary key,
	name varchar(255)
		constraint uk_qp93jyuw586kcgdajsb3tfbjy
			unique
);

alter table tag owner to postgres;

create table update_event
(
	id bigint not null
		constraint update_event_pkey
			primary key,
	finish_dtm timestamp,
	start_dtm timestamp
);

alter table update_event owner to postgres;

create table category
(
	id bigint not null
		constraint category_pkey
			primary key,
	level integer,
	parent_id bigint,
	text varchar(255),
	type integer,
	url varchar(255),
	update_event_id bigint
		constraint fk38532ycfax41btw8f0q50g50b
			references update_event
);

alter table category owner to postgres;

create table product
(
	article bigint not null
		constraint product_pkey
			primary key,
	brand varchar(255),
	composition varchar(1000),
	first_comment_date_time timestamp,
	name varchar(255),
	url varchar(255),
	update_event_id bigint
		constraint fkk9nxk3eqranoy3422fb4vgio2
			references update_event
);

alter table product owner to postgres;

create table position
(
	count_comments char,
	page integer,
	position integer,
	rating char,
	sales char,
	sales_by_date_range char,
	product_id bigint not null
		constraint fkjyaaheio0o2g9c7fm40p5xx7j
			references product,
	category_id bigint not null
		constraint fkk296qji0pokn8bgk8cw0d6lmx
			references category,
	constraint position_pkey
		primary key (category_id, product_id)
);

alter table position owner to postgres;

create table product_tag
(
	product_id bigint not null
		constraint fk2rf7w3d88x20p7vuc2m9mvv91
			references product,
	update_event_id bigint not null
		constraint fkbfpe95bmrup5757oga18wxsjy
			references update_event,
	tag_id bigint not null
		constraint fk3b3a7hu5g2kh24wf0cwv3lgsm
			references tag,
	constraint product_tag_pkey
		primary key (product_id, tag_id, update_event_id)
);

alter table product_tag owner to postgres;

create table update_product
(
	bought_count integer,
	comments_count integer,
	final_sale integer,
	price double precision,
	price_with_coupon_and_discount integer,
	rating real,
	sale integer,
	product_id bigint not null
		constraint fk802rff3ep5gguygu6gqlff0xo
			references product,
	update_event_id bigint not null
		constraint fkhx9t19bhgqhd9d9kigp8g6hch
			references update_event,
	constraint update_product_pkey
		primary key (product_id, update_event_id)
);

alter table update_product owner to postgres;