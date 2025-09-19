
\restrict jLm5Ya1TXdjjVDnPrVAYA2hk77d2p61LMtFbaeF0DEWxxJIZx1icMtWpNeTGJJ2

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

ALTER ROLE "anon" SET "statement_timeout" TO '3s';

ALTER ROLE "authenticated" SET "statement_timeout" TO '8s';

ALTER ROLE "authenticator" SET "statement_timeout" TO '8s';

\unrestrict jLm5Ya1TXdjjVDnPrVAYA2hk77d2p61LMtFbaeF0DEWxxJIZx1icMtWpNeTGJJ2

RESET ALL;
