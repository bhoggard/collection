--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE artists (
    id integer NOT NULL,
    name character varying NOT NULL,
    sort_name character varying NOT NULL,
    home_page character varying,
    birth_year integer,
    gender character varying,
    death_year integer,
    notes text,
    show_large_images boolean,
    email character varying,
    telephone character varying,
    address text,
    private_notes text,
    missing_information character varying,
    nationality_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE artists_id_seq OWNED BY artists.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: exhibition_works; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE exhibition_works (
    exhibition_id integer NOT NULL,
    work_id integer NOT NULL,
    "position" integer NOT NULL
);


--
-- Name: exhibitions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE exhibitions (
    id integer NOT NULL,
    title character varying,
    description text,
    start_date date,
    end_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: exhibitions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE exhibitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exhibitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE exhibitions_id_seq OWNED BY exhibitions.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    work_id integer NOT NULL,
    caption character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    file_file_name character varying,
    file_content_type character varying,
    file_file_size integer,
    file_updated_at timestamp without time zone
);


--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: nationalities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nationalities (
    id integer NOT NULL,
    name character varying
);


--
-- Name: nationalities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nationalities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nationalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nationalities_id_seq OWNED BY nationalities.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: works; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE works (
    id integer NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    artist_id integer NOT NULL,
    work_year integer,
    work_display_date character varying,
    dimensions character varying,
    medium text,
    edition character varying,
    acquisition_year integer,
    description text,
    provenance text,
    price_paid integer,
    private_notes text,
    missing_information character varying,
    market_value integer,
    market_value_year integer,
    location_id integer NOT NULL,
    category_id integer NOT NULL,
    featured boolean DEFAULT false NOT NULL,
    image_source character varying,
    published boolean DEFAULT true NOT NULL,
    tags character varying[] DEFAULT '{}'::character varying[],
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: works_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: works_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE works_id_seq OWNED BY works.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY artists ALTER COLUMN id SET DEFAULT nextval('artists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY exhibitions ALTER COLUMN id SET DEFAULT nextval('exhibitions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nationalities ALTER COLUMN id SET DEFAULT nextval('nationalities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY works ALTER COLUMN id SET DEFAULT nextval('works_id_seq'::regclass);


--
-- Name: artists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: exhibitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY exhibitions
    ADD CONSTRAINT exhibitions_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: nationalities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nationalities
    ADD CONSTRAINT nationalities_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: works_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY works
    ADD CONSTRAINT works_pkey PRIMARY KEY (id);


--
-- Name: artist_lower_sort_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX artist_lower_sort_name ON artists USING btree (lower("left"((sort_name)::text, 1)));


--
-- Name: index_artists_on_birth_year; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_artists_on_birth_year ON artists USING btree (birth_year);


--
-- Name: index_artists_on_missing_information; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_artists_on_missing_information ON artists USING btree (missing_information);


--
-- Name: index_artists_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_artists_on_name ON artists USING btree (name);


--
-- Name: index_artists_on_sort_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_artists_on_sort_name ON artists USING btree (sort_name);


--
-- Name: index_categories_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_categories_on_name ON categories USING btree (name);


--
-- Name: index_exhibition_works_on_exhibition_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_exhibition_works_on_exhibition_id ON exhibition_works USING btree (exhibition_id);


--
-- Name: index_exhibition_works_on_exhibition_id_and_work_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_exhibition_works_on_exhibition_id_and_work_id ON exhibition_works USING btree (exhibition_id, work_id);


--
-- Name: index_exhibition_works_on_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_exhibition_works_on_position ON exhibition_works USING btree ("position");


--
-- Name: index_exhibition_works_on_work_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_exhibition_works_on_work_id ON exhibition_works USING btree (work_id);


--
-- Name: index_exhibitions_on_end_date; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_exhibitions_on_end_date ON exhibitions USING btree (end_date);


--
-- Name: index_exhibitions_on_start_date; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_exhibitions_on_start_date ON exhibitions USING btree (start_date);


--
-- Name: index_images_on_work_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_images_on_work_id ON images USING btree (work_id);


--
-- Name: index_locations_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_locations_on_name ON locations USING btree (name);


--
-- Name: index_nationalities_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_nationalities_on_name ON nationalities USING btree (name);


--
-- Name: index_users_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_name ON users USING btree (name);


--
-- Name: index_works_on_artist_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_works_on_artist_id ON works USING btree (artist_id);


--
-- Name: index_works_on_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_works_on_category_id ON works USING btree (category_id);


--
-- Name: index_works_on_featured; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_works_on_featured ON works USING btree (featured);


--
-- Name: index_works_on_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_works_on_location_id ON works USING btree (location_id);


--
-- Name: index_works_on_published; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_works_on_published ON works USING btree (published);


--
-- Name: index_works_on_tags; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_works_on_tags ON works USING gin (tags);


--
-- Name: index_works_on_title; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_works_on_title ON works USING btree (title);


--
-- Name: index_works_on_work_year; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_works_on_work_year ON works USING btree (work_year);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_82dc0f6c87; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exhibition_works
    ADD CONSTRAINT fk_rails_82dc0f6c87 FOREIGN KEY (exhibition_id) REFERENCES exhibitions(id);


--
-- Name: fk_rails_84afe42f10; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exhibition_works
    ADD CONSTRAINT fk_rails_84afe42f10 FOREIGN KEY (work_id) REFERENCES works(id);


--
-- Name: fk_rails_c5bab402b7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY works
    ADD CONSTRAINT fk_rails_c5bab402b7 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_cc614e7148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY works
    ADD CONSTRAINT fk_rails_cc614e7148 FOREIGN KEY (artist_id) REFERENCES artists(id);


--
-- Name: fk_rails_d2d828d1d7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY works
    ADD CONSTRAINT fk_rails_d2d828d1d7 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_rails_e4c65960d8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY images
    ADD CONSTRAINT fk_rails_e4c65960d8 FOREIGN KEY (work_id) REFERENCES works(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150719182246');

INSERT INTO schema_migrations (version) VALUES ('20150719190312');

INSERT INTO schema_migrations (version) VALUES ('20150725173754');

INSERT INTO schema_migrations (version) VALUES ('20150725195621');

INSERT INTO schema_migrations (version) VALUES ('20150725195647');

INSERT INTO schema_migrations (version) VALUES ('20150725195652');

INSERT INTO schema_migrations (version) VALUES ('20150725234415');

INSERT INTO schema_migrations (version) VALUES ('20150726004901');

INSERT INTO schema_migrations (version) VALUES ('20150726004918');

INSERT INTO schema_migrations (version) VALUES ('20150808225536');

