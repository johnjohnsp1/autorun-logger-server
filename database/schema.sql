--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2016-07-27 11:29:08 BST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16385)
-- Name: alert; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alert (
    id bigint NOT NULL,
    instance integer,
    domain text,
    host text,
    "timestamp" timestamp without time zone,
    autorun_id bigint,
    location text,
    item_name text,
    enabled boolean,
    profile text,
    launch_string text,
    description text,
    company text,
    signer text,
    version_number text,
    file_path text,
    file_name text,
    file_directory text,
    "time" timestamp without time zone,
    sha256 text,
    md5 text
);


--
-- TOC entry 182 (class 1259 OID 16391)
-- Name: alert_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE alert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 182
-- Name: alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE alert_id_seq OWNED BY alert.id;


--
-- TOC entry 183 (class 1259 OID 16393)
-- Name: current_autoruns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE current_autoruns (
    id bigint NOT NULL,
    instance integer,
    location text,
    item_name text,
    enabled boolean,
    profile text,
    launch_string text,
    description text,
    company text,
    signer text,
    version_number text,
    file_path text,
    file_name text,
    file_directory text,
    "time" timestamp without time zone,
    sha256 text,
    md5 text
);


--
-- TOC entry 184 (class 1259 OID 16399)
-- Name: current_autoruns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE current_autoruns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 184
-- Name: current_autoruns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE current_autoruns_id_seq OWNED BY current_autoruns.id;


--
-- TOC entry 189 (class 1259 OID 16417)
-- Name: export; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE export (
    id bigint NOT NULL,
    data_type integer,
    file_name text,
    updated timestamp without time zone
);


--
-- TOC entry 190 (class 1259 OID 16423)
-- Name: export_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE export_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 190
-- Name: export_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE export_id_seq OWNED BY export.id;


--
-- TOC entry 185 (class 1259 OID 16401)
-- Name: instance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE instance (
    id bigint NOT NULL,
    domain text,
    host text,
    "timestamp" timestamp without time zone
);


--
-- TOC entry 186 (class 1259 OID 16407)
-- Name: instance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE instance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 186
-- Name: instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE instance_id_seq OWNED BY instance.id;


--
-- TOC entry 187 (class 1259 OID 16409)
-- Name: previous_autoruns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE previous_autoruns (
    id bigint NOT NULL,
    instance integer,
    location text,
    item_name text,
    enabled boolean,
    profile text,
    launch_string text,
    description text,
    company text,
    signer text,
    version_number text,
    file_path text,
    file_name text,
    file_directory text,
    "time" timestamp without time zone,
    sha256 text,
    md5 text
);


--
-- TOC entry 188 (class 1259 OID 16415)
-- Name: previous_autoruns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE previous_autoruns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 188
-- Name: previous_autoruns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE previous_autoruns_id_seq OWNED BY previous_autoruns.id;


--
-- TOC entry 2046 (class 2604 OID 16425)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY alert ALTER COLUMN id SET DEFAULT nextval('alert_id_seq'::regclass);


--
-- TOC entry 2047 (class 2604 OID 16426)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY current_autoruns ALTER COLUMN id SET DEFAULT nextval('current_autoruns_id_seq'::regclass);


--
-- TOC entry 2050 (class 2604 OID 16429)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY export ALTER COLUMN id SET DEFAULT nextval('export_id_seq'::regclass);


--
-- TOC entry 2048 (class 2604 OID 16427)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY instance ALTER COLUMN id SET DEFAULT nextval('instance_id_seq'::regclass);


--
-- TOC entry 2049 (class 2604 OID 16428)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY previous_autoruns ALTER COLUMN id SET DEFAULT nextval('previous_autoruns_id_seq'::regclass);


--
-- TOC entry 2052 (class 2606 OID 16431)
-- Name: alert_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alert
    ADD CONSTRAINT alert_pk PRIMARY KEY (id);


--
-- TOC entry 2055 (class 2606 OID 16433)
-- Name: current_autoruns_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY current_autoruns
    ADD CONSTRAINT current_autoruns_pk PRIMARY KEY (id);


--
-- TOC entry 2059 (class 2606 OID 16435)
-- Name: instance_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY instance
    ADD CONSTRAINT instance_pk PRIMARY KEY (id);


--
-- TOC entry 2063 (class 2606 OID 16437)
-- Name: previous_autoruns_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY previous_autoruns
    ADD CONSTRAINT previous_autoruns_pk PRIMARY KEY (id);


--
-- TOC entry 2065 (class 2606 OID 16439)
-- Name: summary_file_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY export
    ADD CONSTRAINT summary_file_name_key UNIQUE (file_name);


--
-- TOC entry 2067 (class 2606 OID 16441)
-- Name: summary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY export
    ADD CONSTRAINT summary_pkey PRIMARY KEY (id);


--
-- TOC entry 2053 (class 1259 OID 16442)
-- Name: current_autoruns_instance_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX current_autoruns_instance_idx ON current_autoruns USING btree (instance);


--
-- TOC entry 2056 (class 1259 OID 16443)
-- Name: instance_domain_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX instance_domain_idx ON instance USING btree (domain);


--
-- TOC entry 2057 (class 1259 OID 16444)
-- Name: instance_host_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX instance_host_idx ON instance USING btree (host);


--
-- TOC entry 2060 (class 1259 OID 16445)
-- Name: instance_timestamp_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX instance_timestamp_idx ON instance USING btree ("timestamp");


--
-- TOC entry 2061 (class 1259 OID 16447)
-- Name: previous_autoruns_instance_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX previous_autoruns_instance_idx ON previous_autoruns USING btree (instance);


-- Completed on 2016-07-27 11:29:09 BST

--
-- PostgreSQL database dump complete
--

