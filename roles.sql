
\restrict pjmMyZXYSIiRhJagLyEIEW9w6UImhDQw6dUJVkwJzKct908a7trOI2Tf89nVU4E

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

ALTER ROLE "anon" SET "statement_timeout" TO '3s';

ALTER ROLE "authenticated" SET "statement_timeout" TO '8s';

ALTER ROLE "authenticator" SET "statement_timeout" TO '8s';

\unrestrict pjmMyZXYSIiRhJagLyEIEW9w6UImhDQw6dUJVkwJzKct908a7trOI2Tf89nVU4E

RESET ALL;
