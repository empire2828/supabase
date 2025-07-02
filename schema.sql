

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
    "mth_adj" "text" DEFAULT 'bookings'::"text",
    "stay_mth" "date" GENERATED ALWAYS AS ("departure") STORED,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "modified_at" "date",
    "supabase_key" "text"
);


ALTER TABLE "public"."bookings" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."bookings_mth_adj" AS
 SELECT "bookings"."email",
    "bookings"."apartment",
    "bookings"."arrival",
    "bookings"."departure",
    "bookings"."created_at",
    "bookings"."modified_at",
    "bookings"."channel_name",
    "bookings"."guestname",
    "bookings"."adults",
    "bookings"."children",
    "bookings"."language",
    "bookings"."type",
    "bookings"."reservation_id",
    "bookings"."guestid",
    "bookings"."guest_email",
    "bookings"."phone",
    "bookings"."address_postalcode",
    "bookings"."address_city",
    "bookings"."address_country",
    "bookings"."screener_openai_job",
    "bookings"."screener_address_check",
    "bookings"."screener_google_linkedin",
    "bookings"."screener_phone_check",
    "bookings"."screener_disposable_email",
    "bookings"."price",
    "bookings"."prepayment",
    "bookings"."deposit",
    "bookings"."commission_included",
    "bookings"."price_paid",
    "bookings"."prepayment_paid",
    "bookings"."deposit_paid",
    "bookings"."address_street",
    'mth_adj'::"text" AS "mth_adj",
    "bookings"."supabase_key",
    (("date_trunc"('MONTH'::"text", ("bookings"."arrival")::timestamp with time zone) + '1 mon -1 days'::interval))::"date" AS "stay_mth"
   FROM "public"."bookings"
  WHERE (EXTRACT(month FROM "bookings"."arrival") <> EXTRACT(month FROM "bookings"."departure"));


ALTER VIEW "public"."bookings_mth_adj" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."bookings_mthly" AS
 SELECT "bookings"."email",
    "bookings"."apartment",
    "bookings"."arrival",
    "bookings"."departure",
    "bookings"."created_at",
    "bookings"."modified_at",
    "bookings"."channel_name",
    "bookings"."guestname",
    "bookings"."adults",
    "bookings"."children",
    "bookings"."language",
    "bookings"."type",
    "bookings"."reservation_id",
    "bookings"."guestid",
    "bookings"."guest_email",
    "bookings"."phone",
    "bookings"."address_postalcode",
    "bookings"."address_city",
    "bookings"."address_country",
    "bookings"."screener_openai_job",
    "bookings"."screener_address_check",
    "bookings"."screener_google_linkedin",
    "bookings"."screener_phone_check",
    "bookings"."screener_disposable_email",
    "bookings"."price",
    "bookings"."prepayment",
    "bookings"."deposit",
    "bookings"."commission_included",
    "bookings"."price_paid",
    "bookings"."prepayment_paid",
    "bookings"."deposit_paid",
    "bookings"."address_street",
    "bookings"."mth_adj",
    "bookings"."supabase_key"
   FROM "public"."bookings"
UNION ALL
 SELECT "bookings_mth_adj"."email",
    "bookings_mth_adj"."apartment",
    "bookings_mth_adj"."arrival",
    "bookings_mth_adj"."departure",
    "bookings_mth_adj"."created_at",
    "bookings_mth_adj"."modified_at",
    "bookings_mth_adj"."channel_name",
    "bookings_mth_adj"."guestname",
    "bookings_mth_adj"."adults",
    "bookings_mth_adj"."children",
    "bookings_mth_adj"."language",
    "bookings_mth_adj"."type",
    "bookings_mth_adj"."reservation_id",
    "bookings_mth_adj"."guestid",
    "bookings_mth_adj"."guest_email",
    "bookings_mth_adj"."phone",
    "bookings_mth_adj"."address_postalcode",
    "bookings_mth_adj"."address_city",
    "bookings_mth_adj"."address_country",
    "bookings_mth_adj"."screener_openai_job",
    "bookings_mth_adj"."screener_address_check",
    "bookings_mth_adj"."screener_google_linkedin",
    "bookings_mth_adj"."screener_phone_check",
    "bookings_mth_adj"."screener_disposable_email",
    "bookings_mth_adj"."price",
    "bookings_mth_adj"."prepayment",
    "bookings_mth_adj"."deposit",
    "bookings_mth_adj"."commission_included",
    "bookings_mth_adj"."price_paid",
    "bookings_mth_adj"."prepayment_paid",
    "bookings_mth_adj"."deposit_paid",
    "bookings_mth_adj"."address_street",
    "bookings_mth_adj"."mth_adj",
    "bookings_mth_adj"."supabase_key"
   FROM "public"."bookings_mth_adj";


ALTER VIEW "public"."bookings_mthly" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."calendar" (
    "date" "date" NOT NULL
);


ALTER TABLE "public"."calendar" OWNER TO "postgres";


ALTER TABLE ONLY "public"."bookings"
    ADD CONSTRAINT "bookings_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."calendar"
    ADD CONSTRAINT "calendar_pkey" PRIMARY KEY ("date");



ALTER TABLE ONLY "public"."bookings"
    ADD CONSTRAINT "unique_id" UNIQUE ("reservation_id", "email");





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



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mth_adj" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mth_adj" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mth_adj" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mthly" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mthly" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mthly" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."calendar" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."calendar" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."calendar" TO "service_role";









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
