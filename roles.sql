
\restrict epM8m2EROuCni4i0xnCgufP521CK83bBgdTwOeQFuSD4a2D6kYxSfeGhTkhrdxx

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

ALTER ROLE "anon" SET "statement_timeout" TO '3s';

ALTER ROLE "authenticated" SET "statement_timeout" TO '8s';

ALTER ROLE "authenticator" SET "statement_timeout" TO '8s';

\unrestrict epM8m2EROuCni4i0xnCgufP521CK83bBgdTwOeQFuSD4a2D6kYxSfeGhTkhrdxx

RESET ALL;
