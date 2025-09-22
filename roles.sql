
\restrict yHXkta8oE04q3yfcb9CyTybn4rKDjbP2iyXOAj1JnfVqx0t71H8HFcqSEsk5x0W

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

ALTER ROLE "anon" SET "statement_timeout" TO '3s';

ALTER ROLE "authenticated" SET "statement_timeout" TO '8s';

ALTER ROLE "authenticator" SET "statement_timeout" TO '8s';

\unrestrict yHXkta8oE04q3yfcb9CyTybn4rKDjbP2iyXOAj1JnfVqx0t71H8HFcqSEsk5x0W

RESET ALL;
