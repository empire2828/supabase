
\restrict sbM5uzt8APnaelJ1rFNrC3R2S0ObSAohyurMeHhEOFeKVBdZHPB8ig5fB9Gr0Lp

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

ALTER ROLE "anon" SET "statement_timeout" TO '3s';

ALTER ROLE "authenticated" SET "statement_timeout" TO '8s';

ALTER ROLE "authenticator" SET "statement_timeout" TO '8s';

\unrestrict sbM5uzt8APnaelJ1rFNrC3R2S0ObSAohyurMeHhEOFeKVBdZHPB8ig5fB9Gr0Lp

RESET ALL;
