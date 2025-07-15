

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


CREATE EXTENSION IF NOT EXISTS "pg_cron" WITH SCHEMA "pg_catalog";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE OR REPLACE FUNCTION "public"."cleanup_old_logs"() RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO ''
    AS $$
BEGIN
  DELETE FROM logs
  WHERE timestamp < NOW() - INTERVAL '5 days';
  
  RAISE NOTICE 'Deleted logs older than 5 days at %', NOW();
END;
$$;


ALTER FUNCTION "public"."cleanup_old_logs"() OWNER TO "postgres";

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
    "adults" integer DEFAULT 0,
    "children" integer DEFAULT 0,
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
    "price" real DEFAULT 0,
    "prepayment" real DEFAULT 0,
    "deposit" real,
    "commission_included" real DEFAULT 0,
    "price_paid" "text",
    "prepayment_paid" "text",
    "deposit_paid" "text",
    "address_street" "text",
    "mth_adj" "text" DEFAULT 'bookings'::"text",
    "stay_mth" "date" GENERATED ALWAYS AS ("departure") STORED,
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "modified_at" "date",
    "supabase_key" "text",
    "price_baseprice" real DEFAULT 0,
    "price_cleaningfee" real DEFAULT 0,
    "price_longstaydiscount" real DEFAULT 0,
    "price_coupon" real DEFAULT 0,
    "price_addon" real DEFAULT 0,
    "price_curr" "text",
    "price_comm" real
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
    "bookings"."price_baseprice",
    "bookings"."price_cleaningfee",
    "bookings"."price_longstaydiscount",
    "bookings"."price_coupon",
    "bookings"."price_addon",
    "bookings"."price_curr",
    "bookings"."price_comm",
    (("date_trunc"('MONTH'::"text", ("bookings"."arrival")::timestamp with time zone) + '1 mon -1 days'::interval))::"date" AS "stay_mth"
   FROM "public"."bookings"
  WHERE (EXTRACT(month FROM "bookings"."arrival") <> EXTRACT(month FROM "bookings"."departure"));


ALTER VIEW "public"."bookings_mth_adj" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."calendar" (
    "date" "date" NOT NULL
);


ALTER TABLE "public"."calendar" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."parameter" (
    "id" bigint NOT NULL,
    "supabase_key" "text",
    "std_cleaning_fee" real,
    "std_linen_fee" real,
    "use_own_std_fees" boolean,
    "email" "text"
);


ALTER TABLE "public"."parameter" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."bookings_mthly" AS
 SELECT "b"."email",
    "b"."apartment",
    "b"."arrival",
    "b"."departure",
    "b"."created_at",
    "b"."modified_at",
    "b"."channel_name",
    "b"."guestname",
    "b"."adults",
    "b"."children",
    "b"."language",
    "b"."type",
    "b"."reservation_id",
    "b"."guestid",
    "b"."guest_email",
    "b"."phone",
    "b"."address_postalcode",
    "b"."address_city",
    "b"."address_country",
    "b"."screener_openai_job",
    "b"."screener_address_check",
    "b"."screener_google_linkedin",
    "b"."screener_phone_check",
    "b"."screener_disposable_email",
    "b"."price",
    "b"."prepayment",
    "b"."deposit",
    "b"."commission_included",
    "b"."price_paid",
    "b"."prepayment_paid",
    "b"."deposit_paid",
    "b"."address_street",
    "b"."mth_adj",
    "b"."supabase_key",
    "b"."price_baseprice",
    "b"."price_cleaningfee",
    "b"."price_longstaydiscount",
    "b"."price_coupon",
    "b"."price_addon",
    "b"."price_curr",
    "b"."price_comm",
    "p"."std_cleaning_fee",
    "p"."std_linen_fee",
    "p"."use_own_std_fees"
   FROM ("public"."bookings" "b"
     LEFT JOIN "public"."parameter" "p" ON (("b"."email" = "p"."email")))
UNION ALL
 SELECT "bma"."email",
    "bma"."apartment",
    "bma"."arrival",
    "bma"."departure",
    "bma"."created_at",
    "bma"."modified_at",
    "bma"."channel_name",
    "bma"."guestname",
    "bma"."adults",
    "bma"."children",
    "bma"."language",
    "bma"."type",
    "bma"."reservation_id",
    "bma"."guestid",
    "bma"."guest_email",
    "bma"."phone",
    "bma"."address_postalcode",
    "bma"."address_city",
    "bma"."address_country",
    "bma"."screener_openai_job",
    "bma"."screener_address_check",
    "bma"."screener_google_linkedin",
    "bma"."screener_phone_check",
    "bma"."screener_disposable_email",
    "bma"."price",
    "bma"."prepayment",
    "bma"."deposit",
    "bma"."commission_included",
    "bma"."price_paid",
    "bma"."prepayment_paid",
    "bma"."deposit_paid",
    "bma"."address_street",
    "bma"."mth_adj",
    "bma"."supabase_key",
    "bma"."price_baseprice",
    "bma"."price_cleaningfee",
    "bma"."price_longstaydiscount",
    "bma"."price_coupon",
    "bma"."price_addon",
    "bma"."price_curr",
    "bma"."price_comm",
    "p"."std_cleaning_fee",
    "p"."std_linen_fee",
    "p"."use_own_std_fees"
   FROM ("public"."bookings_mth_adj" "bma"
     LEFT JOIN "public"."parameter" "p" ON (("bma"."email" = "p"."email")))
UNION ALL
 SELECT NULL::"text" AS "email",
    NULL::"text" AS "apartment",
    NULL::"date" AS "arrival",
    "c"."date" AS "departure",
    NULL::"date" AS "created_at",
    NULL::"date" AS "modified_at",
    'calendar'::"text" AS "channel_name",
    NULL::"text" AS "guestname",
    NULL::integer AS "adults",
    NULL::integer AS "children",
    NULL::"text" AS "language",
    'calendar'::"text" AS "type",
    NULL::integer AS "reservation_id",
    NULL::integer AS "guestid",
    NULL::"text" AS "guest_email",
    NULL::"text" AS "phone",
    NULL::"text" AS "address_postalcode",
    NULL::"text" AS "address_city",
    NULL::"text" AS "address_country",
    NULL::"text" AS "screener_openai_job",
    NULL::boolean AS "screener_address_check",
    NULL::"text" AS "screener_google_linkedin",
    NULL::boolean AS "screener_phone_check",
    NULL::boolean AS "screener_disposable_email",
    NULL::numeric AS "price",
    NULL::numeric AS "prepayment",
    NULL::numeric AS "deposit",
    NULL::numeric AS "commission_included",
    NULL::"text" AS "price_paid",
    NULL::"text" AS "prepayment_paid",
    NULL::"text" AS "deposit_paid",
    NULL::"text" AS "address_street",
    'calendar'::"text" AS "mth_adj",
    'calendar'::"text" AS "supabase_key",
    NULL::numeric AS "price_baseprice",
    NULL::numeric AS "price_cleaningfee",
    NULL::numeric AS "price_longstaydiscount",
    NULL::numeric AS "price_coupon",
    NULL::numeric AS "price_addon",
    NULL::"text" AS "price_curr",
    NULL::numeric AS "price_comm",
    NULL::real AS "std_cleaning_fee",
    NULL::real AS "std_linen_fee",
    NULL::boolean AS "use_own_std_fees"
   FROM "public"."calendar" "c";


ALTER VIEW "public"."bookings_mthly" OWNER TO "postgres";


CREATE OR REPLACE VIEW "public"."bookings_mthly_bak" AS
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
    "bookings"."supabase_key",
    "bookings"."price_baseprice",
    "bookings"."price_cleaningfee",
    "bookings"."price_longstaydiscount",
    "bookings"."price_coupon",
    "bookings"."price_addon",
    "bookings"."price_curr",
    "bookings"."price_comm"
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
    "bookings_mth_adj"."supabase_key",
    "bookings_mth_adj"."price_baseprice",
    "bookings_mth_adj"."price_cleaningfee",
    "bookings_mth_adj"."price_longstaydiscount",
    "bookings_mth_adj"."price_coupon",
    "bookings_mth_adj"."price_addon",
    "bookings_mth_adj"."price_curr",
    "bookings_mth_adj"."price_comm"
   FROM "public"."bookings_mth_adj"
UNION ALL
 SELECT NULL::"text" AS "email",
    NULL::"text" AS "apartment",
    NULL::"date" AS "arrival",
    "calendar"."date" AS "departure",
    NULL::"date" AS "created_at",
    NULL::"date" AS "modified_at",
    'calendar'::"text" AS "channel_name",
    NULL::"text" AS "guestname",
    NULL::integer AS "adults",
    NULL::integer AS "children",
    NULL::"text" AS "language",
    'calendar'::"text" AS "type",
    NULL::integer AS "reservation_id",
    NULL::integer AS "guestid",
    NULL::"text" AS "guest_email",
    NULL::"text" AS "phone",
    NULL::"text" AS "address_postalcode",
    NULL::"text" AS "address_city",
    NULL::"text" AS "address_country",
    NULL::"text" AS "screener_openai_job",
    NULL::boolean AS "screener_address_check",
    NULL::"text" AS "screener_google_linkedin",
    NULL::boolean AS "screener_phone_check",
    NULL::boolean AS "screener_disposable_email",
    NULL::numeric AS "price",
    NULL::numeric AS "prepayment",
    NULL::numeric AS "deposit",
    NULL::numeric AS "commission_included",
    NULL::"text" AS "price_paid",
    NULL::"text" AS "prepayment_paid",
    NULL::"text" AS "deposit_paid",
    NULL::"text" AS "address_street",
    'calendar'::"text" AS "mth_adj",
    'calendar'::"text" AS "supabase_key",
    NULL::numeric AS "price_baseprice",
    NULL::numeric AS "price_cleaningfee",
    NULL::numeric AS "price_longstaydiscount",
    NULL::numeric AS "price_coupon",
    NULL::numeric AS "price_addon",
    NULL::"text" AS "price_curr",
    NULL::numeric AS "price_comm"
   FROM "public"."calendar";


ALTER VIEW "public"."bookings_mthly_bak" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."logs" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "message" "text",
    "email" "text",
    "function" "text"
);


ALTER TABLE "public"."logs" OWNER TO "postgres";


ALTER TABLE "public"."logs" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."logs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE "public"."parameter" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."parameter_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



ALTER TABLE ONLY "public"."bookings"
    ADD CONSTRAINT "bookings_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."calendar"
    ADD CONSTRAINT "calendar_pkey" PRIMARY KEY ("date");



ALTER TABLE ONLY "public"."logs"
    ADD CONSTRAINT "logs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."parameter"
    ADD CONSTRAINT "parameter_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."parameter"
    ADD CONSTRAINT "unique_email" UNIQUE ("email");



ALTER TABLE ONLY "public"."bookings"
    ADD CONSTRAINT "unique_id" UNIQUE ("reservation_id", "email");





ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";





GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";














































































































































































GRANT ALL ON FUNCTION "public"."cleanup_old_logs"() TO "anon";
GRANT ALL ON FUNCTION "public"."cleanup_old_logs"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."cleanup_old_logs"() TO "service_role";
























GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mth_adj" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mth_adj" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mth_adj" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."calendar" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."calendar" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."calendar" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."parameter" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."parameter" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."parameter" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mthly" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mthly" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mthly" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mthly_bak" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mthly_bak" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."bookings_mthly_bak" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."logs" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."logs" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."logs" TO "service_role";



GRANT ALL ON SEQUENCE "public"."logs_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."logs_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."logs_id_seq" TO "service_role";



GRANT ALL ON SEQUENCE "public"."parameter_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."parameter_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."parameter_id_seq" TO "service_role";









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
