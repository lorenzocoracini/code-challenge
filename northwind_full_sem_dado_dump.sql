--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Debian 12.22-1.pgdg120+1)
-- Dumped by pg_dump version 12.22 (Debian 12.22-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: categories; Type: SCHEMA; Schema: -; Owner: northwind_user
--

CREATE SCHEMA categories;


ALTER SCHEMA categories OWNER TO northwind_user;

--
-- Name: tap_csv_order_details_localsystem; Type: SCHEMA; Schema: -; Owner: northwind_user
--

CREATE SCHEMA tap_csv_order_details_localsystem;


ALTER SCHEMA tap_csv_order_details_localsystem OWNER TO northwind_user;

--
-- Name: tap_csv_tables_orders; Type: SCHEMA; Schema: -; Owner: northwind_user
--

CREATE SCHEMA tap_csv_tables_orders;


ALTER SCHEMA tap_csv_tables_orders OWNER TO northwind_user;

--
-- Name: target_csv_tables_localsystem; Type: SCHEMA; Schema: -; Owner: northwind_user
--

CREATE SCHEMA target_csv_tables_localsystem;


ALTER SCHEMA target_csv_tables_localsystem OWNER TO northwind_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: categories; Owner: northwind_user
--

CREATE TABLE categories.categories (
    category_id character varying NOT NULL,
    category_name character varying,
    description character varying,
    picture character varying
);


ALTER TABLE categories.categories OWNER TO northwind_user;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.categories (
    category_name character varying(15),
    category_id character varying,
    description character varying,
    picture character varying
);


ALTER TABLE public.categories OWNER TO northwind_user;

--
-- Name: customer_customer_demo; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.customer_customer_demo (
    customer_id bpchar NOT NULL,
    customer_type_id bpchar NOT NULL
);


ALTER TABLE public.customer_customer_demo OWNER TO northwind_user;

--
-- Name: customer_demographics; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.customer_demographics (
    customer_type_id bpchar NOT NULL,
    customer_desc text
);


ALTER TABLE public.customer_demographics OWNER TO northwind_user;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.customers (
    company_name character varying(40),
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    customer_id character varying,
    employee_id character varying,
    territory_id character varying
);


ALTER TABLE public.customers OWNER TO northwind_user;

--
-- Name: employee_territories; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.employee_territories (
    territory_id character varying(20),
    employee_id character varying
);


ALTER TABLE public.employee_territories OWNER TO northwind_user;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.employees (
    employee_id smallint,
    last_name character varying(20),
    first_name character varying(10),
    title character varying(30),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    reports_to smallint,
    photo_path character varying(255)
);


ALTER TABLE public.employees OWNER TO northwind_user;

--
-- Name: order_details; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.order_details (
    discount character varying,
    order_id character varying,
    product_id character varying,
    quantity character varying,
    unit_price character varying
);


ALTER TABLE public.order_details OWNER TO northwind_user;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.orders (
    ship_name character varying(40),
    ship_address character varying(60),
    ship_city character varying(15),
    ship_region character varying(15),
    ship_postal_code character varying(10),
    ship_country character varying(15),
    customer_id character varying,
    employee_id character varying,
    freight character varying,
    order_date character varying,
    order_id character varying,
    required_date character varying,
    ship_via character varying,
    shipped_date character varying
);


ALTER TABLE public.orders OWNER TO northwind_user;

--
-- Name: ordes; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.ordes (
    customer_id character varying,
    employee_id character varying,
    freight character varying,
    order_date character varying,
    order_id character varying NOT NULL,
    required_date character varying,
    ship_address character varying,
    ship_city character varying,
    ship_country character varying,
    ship_name character varying,
    ship_postal_code character varying,
    ship_region character varying,
    ship_via character varying,
    shipped_date character varying
);


ALTER TABLE public.ordes OWNER TO northwind_user;

--
-- Name: products; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.products (
    product_name character varying(40),
    quantity_per_unit character varying(20),
    category_id character varying,
    discontinued character varying,
    product_id character varying,
    reorder_level character varying,
    supplier_id character varying,
    unit_price character varying,
    units_in_stock character varying,
    units_on_order character varying
);


ALTER TABLE public.products OWNER TO northwind_user;

--
-- Name: region; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.region (
    region_id_20250205_0718 smallint,
    region_description_20250205_0718 bpchar,
    region_description character varying,
    region_id character varying
);


ALTER TABLE public.region OWNER TO northwind_user;

--
-- Name: shippers; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.shippers (
    shipper_id_20250205_0638 smallint,
    company_name character varying(40),
    phone character varying(24),
    shipper_id character varying
);


ALTER TABLE public.shippers OWNER TO northwind_user;

--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.suppliers (
    supplier_id_20250205_0638 smallint,
    company_name character varying(40),
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage_20250205_0638 text,
    homepage character varying,
    supplier_id character varying
);


ALTER TABLE public.suppliers OWNER TO northwind_user;

--
-- Name: territories; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.territories (
    territory_id character varying(20),
    territory_description_20250205_0638 bpchar,
    region_id_20250205_0638 smallint,
    region_id character varying,
    territory_description character varying
);


ALTER TABLE public.territories OWNER TO northwind_user;

--
-- Name: us_states; Type: TABLE; Schema: public; Owner: northwind_user
--

CREATE TABLE public.us_states (
    state_id_20250205_0710 smallint,
    state_name character varying(100),
    state_abbr character varying(2),
    state_region character varying(50),
    state_id character varying
);


ALTER TABLE public.us_states OWNER TO northwind_user;

--
-- Name: order_details; Type: TABLE; Schema: tap_csv_order_details_localsystem; Owner: northwind_user
--

CREATE TABLE tap_csv_order_details_localsystem.order_details (
    order_id_20250202_1959 text NOT NULL,
    product_id_20250202_1959 text,
    unit_price_20250202_1959 text,
    quantity_20250202_1959 text,
    discount_20250202_1959 text,
    _sdc_extracted_at timestamp without time zone,
    _sdc_received_at timestamp without time zone,
    _sdc_batched_at timestamp without time zone,
    _sdc_deleted_at timestamp without time zone,
    _sdc_sequence bigint,
    _sdc_table_version bigint,
    _sdc_sync_started_at bigint,
    discount character varying,
    order_id character varying,
    product_id character varying,
    quantity character varying,
    unit_price character varying
);


ALTER TABLE tap_csv_order_details_localsystem.order_details OWNER TO northwind_user;

--
-- Name: order_details_localsystem; Type: TABLE; Schema: tap_csv_order_details_localsystem; Owner: northwind_user
--

CREATE TABLE tap_csv_order_details_localsystem.order_details_localsystem (
    order_id text NOT NULL,
    product_id text,
    unit_price text,
    quantity text,
    discount text,
    _sdc_extracted_at timestamp without time zone,
    _sdc_received_at timestamp without time zone,
    _sdc_batched_at timestamp without time zone,
    _sdc_deleted_at timestamp without time zone,
    _sdc_sequence bigint,
    _sdc_table_version bigint,
    _sdc_sync_started_at bigint
);


ALTER TABLE tap_csv_order_details_localsystem.order_details_localsystem OWNER TO northwind_user;

--
-- Name: {{ filename | split: '.' | first }}; Type: TABLE; Schema: tap_csv_order_details_localsystem; Owner: northwind_user
--

CREATE TABLE tap_csv_order_details_localsystem."{{ filename | split: '.' | first }}" (
    order_id text NOT NULL,
    product_id text,
    unit_price text,
    quantity text,
    discount text,
    _sdc_extracted_at timestamp without time zone,
    _sdc_received_at timestamp without time zone,
    _sdc_batched_at timestamp without time zone,
    _sdc_deleted_at timestamp without time zone,
    _sdc_sequence bigint,
    _sdc_table_version bigint,
    _sdc_sync_started_at bigint
);


ALTER TABLE tap_csv_order_details_localsystem."{{ filename | split: '.' | first }}" OWNER TO northwind_user;

--
-- Name: orders; Type: TABLE; Schema: tap_csv_tables_orders; Owner: northwind_user
--

CREATE TABLE tap_csv_tables_orders.orders (
    customer_id character varying,
    employee_id character varying,
    freight character varying,
    order_date character varying,
    order_id character varying NOT NULL,
    required_date character varying,
    ship_address character varying,
    ship_city character varying,
    ship_country character varying,
    ship_name character varying,
    ship_postal_code character varying,
    ship_region character varying,
    ship_via character varying,
    shipped_date character varying
);


ALTER TABLE tap_csv_tables_orders.orders OWNER TO northwind_user;

--
-- Name: categories; Type: TABLE; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

CREATE TABLE target_csv_tables_localsystem.categories (
    category_id character varying NOT NULL,
    category_name character varying,
    description character varying,
    picture character varying
);


ALTER TABLE target_csv_tables_localsystem.categories OWNER TO northwind_user;

--
-- Name: customers; Type: TABLE; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

CREATE TABLE target_csv_tables_localsystem.customers (
    address character varying,
    city character varying,
    company_name character varying,
    contact_name character varying,
    contact_title character varying,
    country character varying,
    customer_id character varying NOT NULL,
    fax character varying,
    phone character varying,
    postal_code character varying,
    region character varying
);


ALTER TABLE target_csv_tables_localsystem.customers OWNER TO northwind_user;

--
-- Name: employee_territories; Type: TABLE; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

CREATE TABLE target_csv_tables_localsystem.employee_territories (
    employee_id character varying NOT NULL,
    territory_id character varying
);


ALTER TABLE target_csv_tables_localsystem.employee_territories OWNER TO northwind_user;

--
-- Name: employees; Type: TABLE; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

CREATE TABLE target_csv_tables_localsystem.employees (
    address character varying,
    birth_date character varying,
    city character varying,
    country character varying,
    employee_id character varying NOT NULL,
    extension character varying,
    first_name character varying,
    hire_date character varying,
    home_phone character varying,
    last_name character varying,
    notes character varying,
    photo character varying,
    photo_path character varying,
    postal_code character varying,
    region character varying,
    reports_to character varying,
    title character varying,
    title_of_courtesy character varying
);


ALTER TABLE target_csv_tables_localsystem.employees OWNER TO northwind_user;

--
-- Name: orders; Type: TABLE; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

CREATE TABLE target_csv_tables_localsystem.orders (
    customer_id character varying,
    employee_id character varying,
    freight character varying,
    order_date character varying,
    order_id character varying NOT NULL,
    required_date character varying,
    ship_address character varying,
    ship_city character varying,
    ship_country character varying,
    ship_name character varying,
    ship_postal_code character varying,
    ship_region character varying,
    ship_via character varying,
    shipped_date character varying
);


ALTER TABLE target_csv_tables_localsystem.orders OWNER TO northwind_user;

--
-- Name: products; Type: TABLE; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

CREATE TABLE target_csv_tables_localsystem.products (
    category_id character varying,
    discontinued character varying,
    product_id character varying NOT NULL,
    product_name character varying,
    quantity_per_unit character varying,
    reorder_level character varying,
    supplier_id character varying,
    unit_price character varying,
    units_in_stock character varying,
    units_on_order character varying
);


ALTER TABLE target_csv_tables_localsystem.products OWNER TO northwind_user;

--
-- Name: region; Type: TABLE; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

CREATE TABLE target_csv_tables_localsystem.region (
    region_description character varying,
    region_id character varying NOT NULL
);


ALTER TABLE target_csv_tables_localsystem.region OWNER TO northwind_user;

--
-- Name: shippers; Type: TABLE; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

CREATE TABLE target_csv_tables_localsystem.shippers (
    company_name character varying,
    phone character varying,
    shipper_id character varying NOT NULL
);


ALTER TABLE target_csv_tables_localsystem.shippers OWNER TO northwind_user;

--
-- Name: suppliers; Type: TABLE; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

CREATE TABLE target_csv_tables_localsystem.suppliers (
    address character varying,
    city character varying,
    company_name character varying,
    contact_name character varying,
    contact_title character varying,
    country character varying,
    fax character varying,
    homepage character varying,
    phone character varying,
    postal_code character varying,
    region character varying,
    supplier_id character varying NOT NULL
);


ALTER TABLE target_csv_tables_localsystem.suppliers OWNER TO northwind_user;

--
-- Name: territories; Type: TABLE; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

CREATE TABLE target_csv_tables_localsystem.territories (
    region_id character varying,
    territory_description character varying,
    territory_id character varying NOT NULL
);


ALTER TABLE target_csv_tables_localsystem.territories OWNER TO northwind_user;

--
-- Name: us_states; Type: TABLE; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

CREATE TABLE target_csv_tables_localsystem.us_states (
    state_abbr character varying,
    state_id character varying NOT NULL,
    state_name character varying,
    state_region character varying
);


ALTER TABLE target_csv_tables_localsystem.us_states OWNER TO northwind_user;

--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: categories; Owner: northwind_user
--

ALTER TABLE ONLY categories.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: customer_customer_demo customer_customer_demo_pkey; Type: CONSTRAINT; Schema: public; Owner: northwind_user
--

ALTER TABLE ONLY public.customer_customer_demo
    ADD CONSTRAINT customer_customer_demo_pkey PRIMARY KEY (customer_id, customer_type_id);


--
-- Name: customer_demographics customer_demographics_pkey; Type: CONSTRAINT; Schema: public; Owner: northwind_user
--

ALTER TABLE ONLY public.customer_demographics
    ADD CONSTRAINT customer_demographics_pkey PRIMARY KEY (customer_type_id);


--
-- Name: ordes ordes_pkey; Type: CONSTRAINT; Schema: public; Owner: northwind_user
--

ALTER TABLE ONLY public.ordes
    ADD CONSTRAINT ordes_pkey PRIMARY KEY (order_id);


--
-- Name: order_details_localsystem order_details_localsystem_pkey; Type: CONSTRAINT; Schema: tap_csv_order_details_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY tap_csv_order_details_localsystem.order_details_localsystem
    ADD CONSTRAINT order_details_localsystem_pkey PRIMARY KEY (order_id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: tap_csv_order_details_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY tap_csv_order_details_localsystem.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (order_id_20250202_1959);


--
-- Name: {{ filename | split: '.' | first }} {{ filename | split: '.' | first }}_pkey; Type: CONSTRAINT; Schema: tap_csv_order_details_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY tap_csv_order_details_localsystem."{{ filename | split: '.' | first }}"
    ADD CONSTRAINT "{{ filename | split: '.' | first }}_pkey" PRIMARY KEY (order_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: tap_csv_tables_orders; Owner: northwind_user
--

ALTER TABLE ONLY tap_csv_tables_orders.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY target_csv_tables_localsystem.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY target_csv_tables_localsystem.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: employee_territories employee_territories_pkey; Type: CONSTRAINT; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY target_csv_tables_localsystem.employee_territories
    ADD CONSTRAINT employee_territories_pkey PRIMARY KEY (employee_id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY target_csv_tables_localsystem.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY target_csv_tables_localsystem.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY target_csv_tables_localsystem.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY target_csv_tables_localsystem.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (region_id);


--
-- Name: shippers shippers_pkey; Type: CONSTRAINT; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY target_csv_tables_localsystem.shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY (shipper_id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY target_csv_tables_localsystem.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);


--
-- Name: territories territories_pkey; Type: CONSTRAINT; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY target_csv_tables_localsystem.territories
    ADD CONSTRAINT territories_pkey PRIMARY KEY (territory_id);


--
-- Name: us_states us_states_pkey; Type: CONSTRAINT; Schema: target_csv_tables_localsystem; Owner: northwind_user
--

ALTER TABLE ONLY target_csv_tables_localsystem.us_states
    ADD CONSTRAINT us_states_pkey PRIMARY KEY (state_id);


--
-- Name: customer_customer_demo customer_customer_demo_customer_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: northwind_user
--

ALTER TABLE ONLY public.customer_customer_demo
    ADD CONSTRAINT customer_customer_demo_customer_type_id_fkey FOREIGN KEY (customer_type_id) REFERENCES public.customer_demographics(customer_type_id);


--
-- PostgreSQL database dump complete
--

