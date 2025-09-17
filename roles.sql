
\restrict UBoRYfCWlfEL285Wv2nRBeVjzo2UkbG96L6QghmASlTRPVzmBywjg31Hn4ARoQS

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

ALTER ROLE "anon" SET "statement_timeout" TO '3s';

ALTER ROLE "authenticated" SET "statement_timeout" TO '8s';

ALTER ROLE "authenticator" SET "statement_timeout" TO '8s';

\unrestrict UBoRYfCWlfEL285Wv2nRBeVjzo2UkbG96L6QghmASlTRPVzmBywjg31Hn4ARoQS

RESET ALL;
