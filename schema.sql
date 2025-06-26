

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pg_cron" WITH SCHEMA "pg_catalog";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE OR REPLACE FUNCTION "public"."set_nights_mthly"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
  IF NEW.arrival IS NULL OR NEW.departure IS NULL THEN
    NEW.nights_mthly := NULL;
  ELSIF date_part('year', NEW.arrival) = date_part('year', NEW.departure)
        AND date_part('month', NEW.arrival) = date_part('month', NEW.departure) THEN
    NEW.nights_mthly := NEW.departure - NEW.arrival;
  ELSE
    NEW.nights_mthly := NEW.departure - make_date(date_part('year', NEW.departure)::int, date_part('month', NEW.departure)::int, 1);
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."set_nights_mthly"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."bookings" (
    "email" "text",
    "apartment" "text",
    "arrival" "date",
    "departure" "date",
    "created_at" "date",
    "channel_name" "text",
    "guestname" "text",
    "adults" integer,
    "children" integer,
    "language" "text",
    "type" "text",
    "reservation_id" integer NOT NULL,
    "guestid" integer,
    "guest_email" "text",
    "phone" "text",
    "address_postalcode" "text",
    "address_city" "text",
    "address_country" "text",
    "screener_openai_job" "text",
    "screener_address_check" boolean,
    "screener_google_linkedin" "text",
    "screener_phone_check" boolean,
    "screener_disposable_email" boolean,
    "price" real,
    "prepayment" real,
    "deposit" real,
    "commission_included" real,
    "price_paid" "text",
    "prepayment_paid" "text",
    "deposit_paid" "text",
    "address_street" "text",
    "booking_lead_time" integer GENERATED ALWAYS AS (
CASE
    WHEN (("created_at" IS NULL) OR ("arrival" IS NULL)) THEN NULL::integer
    ELSE ("arrival" - "created_at")
END) STORED,
    "nights_mthly" integer,
    "adjustment" "text" DEFAULT 'bookings_data'::"text",
    "stay_date_mthly" "date",
    "booking_count" integer GENERATED ALWAYS AS (
CASE
    WHEN ("adjustment" = 'bookings_data'::"text") THEN 1
    ELSE 0
END) STORED,
    "cancellation_count" integer GENERATED ALWAYS AS (
CASE
    WHEN (("type" = 'cancellation'::"text") AND ("adjustment" = 'bookings_data'::"text")) THEN 1
    ELSE 0
END) STORED,
    "revenue_mthly" numeric GENERATED ALWAYS AS (
CASE
    WHEN (("price" IS NULL) OR ("arrival" IS NULL) OR ("departure" IS NULL) OR ("nights_mthly" IS NULL)) THEN NULL::numeric
    WHEN (("departure" - "arrival") = 0) THEN NULL::numeric
    ELSE "round"(((("price")::numeric / (("departure" - "arrival"))::numeric) * ("nights_mthly")::numeric), 2)
END) STORED,
    "bookings" real,
    "revenue" numeric GENERATED ALWAYS AS (
CASE
    WHEN ("adjustment" = 'monthly_adj'::"text") THEN (0)::real
    ELSE COALESCE("price", (0)::real)
END) STORED,
    "nights" integer GENERATED ALWAYS AS (
CASE
    WHEN ("adjustment" = 'monthly_adj'::"text") THEN 0
    WHEN (("arrival" IS NULL) OR ("departure" IS NULL)) THEN NULL::integer
    ELSE ("departure" - "arrival")
END) STORED,
    "id" bigint NOT NULL
);


ALTER TABLE "public"."bookings" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."bookings_duplicate" (
    "id" bigint NOT NULL,
    "email" "text",
    "apartment" "text",
    "arrival" "date",
    "departure" "date",
    "created_at" "date",
    "channel_name" "text",
    "guestname" "text",
    "adults" integer,
    "children" integer,
    "language" "text",
    "type" "text",
    "reservation_id" integer NOT NULL,
    "guestid" integer,
    "guest_email" "text",
    "phone" "text",
    "address_postalcode" "text",
    "address_city" "text",
    "address_country" "text",
    "screener_openai_job" "text",
    "screener_address_check" boolean,
    "screener_google_linkedin" "text",
    "screener_phone_check" boolean,
    "screener_disposable_email" boolean,
    "price" real,
    "prepayment" real,
    "deposit" real,
    "commission_included" real,
    "price_paid" "text",
    "prepayment_paid" "text",
    "deposit_paid" "text",
    "address_street" "text",
    "booking_lead_time" integer GENERATED ALWAYS AS (
CASE
    WHEN (("created_at" IS NULL) OR ("arrival" IS NULL)) THEN NULL::integer
    ELSE ("arrival" - "created_at")
END) STORED,
    "nights_mthly" integer,
    "adjustment" "text" DEFAULT 'bookings_data'::"text",
    "stay_date_mthly" "date",
    "booking_count" integer GENERATED ALWAYS AS (
CASE
    WHEN ("adjustment" = 'bookings_data'::"text") THEN 1
    ELSE 0
END) STORED,
    "cancellation_count" integer GENERATED ALWAYS AS (
CASE
    WHEN (("type" = 'cancellation'::"text") AND ("adjustment" = 'bookings_data'::"text")) THEN 1
    ELSE 0
END) STORED,
    "revenue_mthly" numeric GENERATED ALWAYS AS (
CASE
    WHEN (("price" IS NULL) OR ("arrival" IS NULL) OR ("departure" IS NULL) OR ("nights_mthly" IS NULL)) THEN NULL::numeric
    WHEN (("departure" - "arrival") = 0) THEN NULL::numeric
    ELSE "round"(((("price")::numeric / (("departure" - "arrival"))::numeric) * ("nights_mthly")::numeric), 2)
END) STORED,
    "bookings" real,
    "revenue" numeric GENERATED ALWAYS AS (
CASE
    WHEN ("adjustment" = 'monthly_adj'::"text") THEN (0)::real
    ELSE COALESCE("price", (0)::real)
END) STORED,
    "nights" integer GENERATED ALWAYS AS (
CASE
    WHEN ("adjustment" = 'monthly_adj'::"text") THEN 0
    WHEN (("arrival" IS NULL) OR ("departure" IS NULL)) THEN NULL::integer
    ELSE ("departure" - "arrival")
END) STORED
);


ALTER TABLE "public"."bookings_duplicate" OWNER TO "postgres";


COMMENT ON TABLE "public"."bookings_duplicate" IS 'This is a duplicate of bookings';



ALTER TABLE "public"."bookings" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."bookings_new_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY "public"."bookings"
    ADD CONSTRAINT "bookings_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."bookings"
    ADD CONSTRAINT "unique_booking" UNIQUE ("reservation_id", "email");





ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";





GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";














































































































































































GRANT ALL ON FUNCTION "public"."set_nights_mthly"() TO "anon";
GRANT ALL ON FUNCTION "public"."set_nights_mthly"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."set_nights_mthly"() TO "service_role";
























GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_duplicate" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_duplicate" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_duplicate" TO "service_role";



GRANT ALL ON SEQUENCE "public"."bookings_new_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."bookings_new_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."bookings_new_id_seq" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO "service_role";






























RESET ALL;
