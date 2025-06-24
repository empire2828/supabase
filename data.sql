SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 17.4

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

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."instances" ("id", "uuid", "raw_base_config", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_factors" ("id", "user_id", "friendly_name", "factor_type", "status", "created_at", "updated_at", "secret", "phone", "last_challenged_at", "web_authn_credential", "web_authn_aaguid") FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_challenges" ("id", "factor_id", "created_at", "verified_at", "ip_address", "otp_code", "web_authn_session_data") FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."one_time_tokens" ("id", "user_id", "token_type", "token_hash", "relates_to", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_providers" ("id", "resource_id", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_providers" ("id", "sso_provider_id", "entity_id", "metadata_xml", "metadata_url", "attribute_mapping", "created_at", "updated_at", "name_id_format") FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_relay_states" ("id", "sso_provider_id", "request_id", "for_email", "redirect_to", "created_at", "updated_at", "flow_state_id") FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_domains" ("id", "sso_provider_id", "domain", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."bookings" ("id", "email", "apartment", "arrival", "departure", "created_at", "channel_name", "guestname", "adults", "children", "language", "type", "reservation_id", "guestid", "guest_email", "phone", "address_postalcode", "address_city", "address_country", "screener_openai_job", "screener_address_check", "screener_google_linkedin", "screener_phone_check", "screener_disposable_email", "price", "prepayment", "deposit", "commission_included", "price_paid", "prepayment_paid", "deposit_paid", "address_street", "nights_mthly", "adjustment", "stay_date_mthly") FROM stdin;
40	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-05-13	2023-05-20	2023-03-30	Direct booking	Isolde Hertz	4	0		modification of booking	37235281	29104798	isolde.hertz@online.de	49 1525 (356)-482-1				\N	\N	\N	\N	\N	1125	189	0	\N	Yes	Yes	No		7	bookings_data	2023-05-20
41	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-05-20	2023-05-26	2023-04-26	Booking.com	Lisa Näther	4	1	de	modification of booking	38626993	30245671	lnathe.711840@guest.booking.com	+49 177 3442340				\N	\N	\N	\N	\N	922	0	0	138.3	Yes	No	No		6	bookings_data	2023-05-26
42	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-05-26	2023-05-29	2023-03-30	Airbnb	Funk Meister	4	1	de	modification of booking	37233427	29103295	\N	+4915228466391				\N	\N	\N	\N	\N	625.6	0	0	22.34	Yes	No	No		3	bookings_data	2023-05-29
43	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-05-29	2023-05-30	2023-05-22	FeWo-direkt / HomeAway	Sandra	2	0		cancellation	39906374	34363637	\N	\N				\N	\N	\N	\N	\N	39	0	0	\N	Yes	No	No		1	bookings_data	2023-05-30
44	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-05-30	2023-05-31	2023-05-24	Ferienhausmiete.de	Jana Schmidt	2	2		cancellation	40033853	30298534	jana.schmidt060@gmail.com	01739998969			DE	\N	\N	\N	\N	\N	0	0	0	\N	No	No	No		1	bookings_data	2023-05-31
45	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-05-30	2023-05-31	2023-05-24	Traum-Ferienwohnungen	Sandy Becker	\N	\N		cancellation	40065284	31878929	beckersandra459@gmail.com	\N	12489	Berlin	Deutschland	\N	\N	\N	\N	\N	\N	\N	\N	\N	No	No	No	Süßer Grund 3	1	bookings_data	2023-05-31
46	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-06-01	2023-06-04	2023-05-06	Booking.com	Marco Trettin	5	1	de	modification of booking	39122521	30652165	mtrett.420544@guest.booking.com	+49 163 8468477				\N	\N	\N	\N	\N	541	0	0	108.2	Yes	No	No		3	bookings_data	2023-06-04
47	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-06-05	2023-06-07	2023-06-04	Ferienhausmiete.de	Sandy Becker	5	\N		cancellation	40610522	31878929	beckersandra459@gmail.com	016094763683	12489	Berlin	Deutschland	\N	\N	\N	\N	\N	463.92	92.78	\N	\N	No	No	No	Süßer Grund 3	2	bookings_data	2023-06-07
48	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-06-07	2023-06-17	2023-03-30	Direct booking	Beate Schaal	3	2		modification of booking	37238491	29107606	beate-schaal@gmx.net	02845/7470				\N	\N	\N	\N	\N	1660	320	0	\N	Yes	Yes	No		10	bookings_data	2023-06-17
49	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-06-17	2023-07-01	2023-03-30	Direct booking	Joachim vom Berg	2	1		modification of booking	37235710	33099758	joachim.vomberg@web.de	0 17372-59894				\N	\N	\N	\N	\N	2070	378	0	\N	Yes	Yes	No		0	bookings_data	2023-07-01
50	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-07-01	2023-07-08	2023-03-30	Direct booking	Manuela Feist	4	0		modification of booking	37236322	29105758	feisthabubi@t-online.de	49 15 141282455				\N	\N	\N	\N	\N	1125	189	0	\N	Yes	Yes	No		7	bookings_data	2023-07-08
101	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-07-08	2023-07-22	2023-03-30	Direct booking	Jens Neumann	2	1		modification of booking	37236595	35617196	jens.neumann@wolfsburg.de	49 17647713608	38440	Wolfsburg		\N	\N	\N	\N	\N	1990	378	0	\N	Yes	Yes	No	Wohltbergstr. 35	14	bookings_data	2023-07-22
102	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-07-22	2023-07-29	2023-03-30	Direct booking	Thomas Pöhner	2	1		modification of booking	37236655	29106013	thomas.poehner@t-online.de	49 1729050029				\N	\N	\N	\N	\N	1105	189	0	\N	Yes	Yes	No		7	bookings_data	2023-07-29
103	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-07-29	2023-08-05	2023-03-30	Direct booking	Thomas Apel	4	2		modification of booking	37236718	29106058	apeltom@web.de	49 1778404373				\N	\N	\N	\N	\N	1045	189	0	\N	Yes	Yes	No		4	bookings_data	2023-08-05
104	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-08-05	2023-08-12	2023-03-30	Direct booking	Christian Hertel	2	3		cancellation	37236742	29106085	hertel.christian82@googlemail.com	\N				\N	\N	\N	\N	\N	1550	310	0	\N	No	Yes	No		7	bookings_data	2023-08-12
105	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-08-05	2023-08-12	2023-06-02	Traum-Ferienwohnungen	Klementine Rehm	3	0		modification of booking	40529369	31810475	rehm.k@t-online.de	01709114912				\N	\N	\N	\N	\N	1553	310.6	0	\N	Yes	Yes	No		7	bookings_data	2023-08-12
106	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-08-12	2023-08-19	2023-03-30	Direct booking	Peter Kücking	5	1		modification of booking	37236859	29106178	star@cphinx.de	49 1773848292				\N	\N	\N	\N	\N	1045	189	0	\N	Yes	Yes	No		7	bookings_data	2023-08-19
107	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-08-19	2023-09-01	2023-03-30	Direct booking	Chris Keichel	4	2		modification of booking	37237051	29106352	chris.keichel@gmx.de	49 15786344060				\N	\N	\N	\N	\N	1975	1755	0	\N	Yes	Yes	No		0	bookings_data	2023-09-01
108	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-09-02	2023-09-09	2023-03-30	Direct booking	Pascal Doms	2	1		modification of booking	37237147	29106454	pascal.doms@hotmail.de	4915110760501				\N	\N	\N	\N	\N	1105	189	0	\N	Yes	Yes	No		7	bookings_data	2023-09-09
111	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-10-03	2023-10-08	2023-08-17	Airbnb	Nora Schmacke	4	2	de	modification of booking	44583182	35179097	\N	+4915737500221				\N	\N	\N	\N	\N	1062.25	0	0	159.34	Yes	No	No		5	bookings_data	2023-10-08
112	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-10-09	2023-10-13	2023-09-20	FeWo-direkt / HomeAway	Anja Krüger	4	3		modification of booking	46326559	36625645	anjah78@gmx.de	+49 0179 5183116				\N	\N	\N	\N	\N	769	0	0	\N	Yes	No	No		4	bookings_data	2023-10-13
114	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-10-15	2023-10-22	2023-08-26	FeWo-direkt / HomeAway	Gudrun Gottschalk	5	1	de	modification of booking	45011870	35532275	migu.gottschalk@t-online.de	+49 1775468354				\N	\N	\N	\N	\N	1001.51	0	0	\N	Yes	No	No		7	bookings_data	2023-10-22
115	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-10-23	2023-11-01	2023-07-04	Website	Johannes Stolz	2	2	de	cancellation	42174074	33175391	famfjstolz@gmail.com	01736848061	03046	Cottbus	Deutschland	\N	\N	\N	\N	\N	1239.17	239.17	0	\N	No	Yes	No	Friedrich-Hebbel-Straße 2	0	bookings_data	2023-11-01
116	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-10-23	2023-10-26	2023-09-26	Booking.com	Lena Rohleder	2	2	de	modification of booking	46650049	36896239	lrohle.828386@guest.booking.com	+49 171 2830366	21717	Fredenbeck		\N	\N	\N	\N	\N	656.53	0	0	98.48	Yes	No	No	Alter Stadtweg 13	3	bookings_data	2023-10-26
117	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-10-26	2023-11-01	2023-09-18	Booking.com	Ulrike Grote	3	2	de	modification of booking	46237336	36551734	ugrote.887653@guest.booking.com	+49 1590 6697317	03149	Forst		\N	\N	\N	\N	\N	1063.22	0	0	159.48	Yes	No	No	Skurumer Str.20	0	bookings_data	2023-11-01
118	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-11-03	2023-11-05	2023-08-28	Booking.com	Hanna Westermann	6	0	de	cancellation	45132746	35629889	hweste.674017@guest.booking.com	+49 160 98900310	\N	21423 Winsen Luhe	\N	\N	\N	\N	\N	\N	788.42	\N	\N	118.26	No	No	No	Sandbergenweg 38	2	bookings_data	2023-11-05
295	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-08	2099-12-09	2025-04-09	Direct booking	Max Mustermann	1	0		cancellation	93331487	75388063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-09
119	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-11-03	2023-11-05	2023-10-30	Booking.com	Hanna Westermann	6	0	de	modification of booking	48364505	35629889	hweste.750533@guest.booking.com	+49 160 98900310	\N	21423 Winsen Luhe	\N	\N	\N	\N	\N	\N	727.88	0	0	109.18	Yes	No	No	Sandbergenweg 38	2	bookings_data	2023-11-05
120	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-11-14	2023-11-15	2023-11-06	Agoda	Jana Schmidt	1	0	de	modification of booking	48715745	30298534	0k9vgeez5n8xgc91w7wrjbsc9kdg@agoda-messaging.com	\N			DE	\N	\N	\N	\N	\N	63.57	0	0	\N	Yes	No	No		1	bookings_data	2023-11-15
121	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-11-20	2023-11-26	2023-08-13	Direct booking	Rene Vosskuehler	1	0		cancellation	44342243	34984202	rene.vosskuehler@gmx.de	+491705819465				\N	\N	\N	\N	\N	716.04	143.21	0	\N	No	No	No		6	bookings_data	2023-11-26
122	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-11-20	2023-11-25	2023-10-21	Airbnb	Silvia Schwob	4	4	de	modification of booking	47955929	37975136	\N	+4915774739191				\N	\N	\N	\N	\N	851.1	0	0	127.66	Yes	No	No		5	bookings_data	2023-11-25
123	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-12-01	2023-12-03	2023-07-05	Airbnb	Lisa Marie	7	0	de	cancellation	42274334	33258434	\N	+491731576552	\N	\N	\N	\N	\N	\N	\N	\N	588	\N	\N	88.2	No	No	No	\N	2	bookings_data	2023-12-03
124	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-12-21	2023-12-26	2023-09-14	Airbnb	Stine Bittner	7	2	de	modification of booking	46030151	36379443	\N	+4917663091077				\N	\N	\N	\N	\N	1285.97	0	0	192.9	Yes	No	No		5	bookings_data	2023-12-26
125	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-12-28	2024-01-03	2023-07-04	Website	Maria Rusinova	6	0	de	modification of booking	42208310	33203771	m.e.rusinova@gmail.com	0163-3348370	30449	Hannover 		\N	\N	\N	\N	\N	1462.9	292.58	0	\N	Yes	Yes	No	Niemeyerstr. 17A	2	bookings_data	2024-01-03
126	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-01-04	2024-01-11	2023-06-18	Airbnb	Renate Quell	4	0	de	modification of booking	41311748	32458289	\N	+491758814425				\N	\N	\N	\N	\N	1091.74	0	0	194.87	Yes	No	No		7	bookings_data	2024-01-11
279	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-06-03	2099-06-04	2025-04-14	Direct booking	Dirk Klemer	1	0		cancellation	93843454	75814549	dirk.klemer@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-06-04
127	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-01-19	2024-01-21	2024-01-03	Booking.com	Alena Reinhardt	6	0	de	modification of booking	51382178	40763318	areinh.483266@guest.booking.com	+49 176 23204309	29643	Neuenkirchen		\N	\N	\N	\N	\N	761.62	0	0	114.24	Yes	No	No	Drosselweg	2	bookings_data	2024-01-21
128	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-02-06	2024-02-10	2023-09-18	Website	Nadja Kühn	6	0	de	modification of booking	46246870	36559816	nadja-mighali@t-online.de	+491746969640 	18609 	Ostseebad Binz 	Deutschland 	\N	\N	\N	\N	\N	648	129.6	0	\N	Yes	Yes	No	Rabenstr. 78	4	bookings_data	2024-02-10
129	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-02-11	2024-02-18	2024-01-23	Direct booking	Johanna Seidel	2	1		modification of booking	52585904	41743280	johanna.seidel90@gmx.de	\N	72072	Tübingen		\N	\N	\N	\N	\N	801	150.2	0	\N	Yes	Yes	No	Derendinger Straße 27	7	bookings_data	2024-02-18
130	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-02-15	2024-02-18	2023-12-08	Booking.com	Petra Teutsch	2	0	de	cancellation	50211665	39796007	pteuts.779634@guest.booking.com	+49 163 8889343	50374	Erftstadt	\N	\N	\N	\N	\N	\N	633.27	\N	\N	94.99	No	No	No	Kölner Ring 134	3	bookings_data	2024-02-18
131	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-02-19	2024-02-25	2024-02-14	Booking.com	Gabriele Lorenz	2	2	de	modification of booking	53930972	42865343	gloren.216988@guest.booking.com	+49 1520 4415285		Zwickau		\N	\N	\N	\N	\N	833.12	0	0	124.97	Yes	No	No	Cainsdorfer Bergstraße 30	6	bookings_data	2024-02-25
132	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-03-02	2024-03-09	2023-11-27	Booking.com	martin Sprödhuber	2	0	de	modification of booking	49694045	39380303	msprod.331538@guest.booking.com	+49 172 8537807		Bayreuth		\N	\N	\N	\N	\N	919.26	0	0	137.89	Yes	No	No	Theodor-Storm-Str 32	7	bookings_data	2024-03-09
133	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-03-11	2024-03-16	2023-10-07	Airbnb	Jessica Frenzel	5	1	de	modification of booking	47265460	37407214	\N	+4915904048479				\N	\N	\N	\N	\N	1024.42	0	0	153.66	Yes	No	No		5	bookings_data	2024-03-16
134	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-03-16	2024-03-23	2023-05-18	Airbnb	Tim Kaemena	4	1	de	modification of booking	39759215	31176416	\N	+491729115555				\N	\N	\N	\N	\N	1029.97	\N	\N	183.86	No	No	No		7	bookings_data	2024-03-23
135	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-03-23	2024-03-29	2023-12-18	Booking.com	Felicitas Kramer	2	2	de	modification of booking	50707367	45074396	fkrame.612944@guest.booking.com	+49 1523 3733645	38116	Braunschweig	\N	\N	\N	\N	\N	\N	1242.39	0	0	186.36	Yes	No	No	Mühlenfeld 4	6	bookings_data	2024-03-29
136	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-03-29	2024-04-02	2023-05-17	Booking.com	Silke Hohengarten	5	0	de	modification of booking	39714032	31137893	shohen.696340@guest.booking.com	+49 171 9337995				\N	\N	\N	\N	\N	972	0	0	145.8	Yes	No	No		1	bookings_data	2024-04-02
137	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-04-02	2024-04-06	2024-01-09	Airbnb	Rene Brand	6	0	de	modification of booking	51696443	41018135	\N	+491727209850				\N	\N	\N	\N	\N	920	0	0	138	Yes	No	No		4	bookings_data	2024-04-06
138	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-04-07	2024-04-12	2024-01-31	Booking.com	Nora Beiter	2	3	de	modification of booking	53096084	42175616	nbeite.312963@guest.booking.com	+49 163 6259058	65191	Wiesbaden		\N	\N	\N	\N	\N	964.25	0	0	144.64	Yes	No	No	Panoramaweg 20	5	bookings_data	2024-04-12
140	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-04-19	2024-05-03	2023-09-29	Ferienhausmiete.de	Clemens Gutsmann	4	0		modification of booking	46855876	37065943	csc.gutsmann@arcor.de	01773253457	45277	Essen	Deutschland	\N	\N	\N	\N	\N	2044.55	384	0	\N	Yes	Yes	No	Am Ehrenmal 28	2	bookings_data	2024-05-03
143	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-05-13	2024-05-18	2023-12-01	Booking.com	Juergen Michael Hain	4	0	de	cancellation	49883390	39530903	jhain.754770@guest.booking.com	+49 491 5205674181	14163	Berlin	\N	\N	\N	\N	\N	\N	1156.7	\N	\N	173.5	No	No	No	Lloyd-G-Wells-Str.35	5	bookings_data	2024-05-18
144	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-05-16	2024-05-21	2024-01-07	Booking.com	Jana Nitzsche	5	0	de	modification of booking	51620189	40956860	jnitzs.301010@guest.booking.com	+49 173 1843205	19075	Pampow		\N	\N	\N	\N	\N	1186.01	0	0	177.9	Yes	No	No	Sandweg 3a	5	bookings_data	2024-05-21
146	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-05-21	2024-05-26	2023-05-18	Blocked channel	\N	0	0		modification of booking	39760097	41052344	\N	\N				\N	\N	\N	\N	\N	0	0	0	\N	No	No	No		5	bookings_data	2024-05-26
147	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-05-26	2024-06-05	2023-08-18	Traum-Ferienwohnungen	Harald Gohlke	2	0		modification of booking	44603381	35281865	harald-gohlke@t-online.de	01753113485	47239	Duisburg		\N	\N	\N	\N	\N	1803	363	0	\N	Yes	Yes	No	Karrenweg 55	4	bookings_data	2024-06-05
145	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-05-17	2024-05-23	2023-11-14	Airbnb	Leuthard Landsberg	7	0	de	cancellation	49098260	38901962	\N	+491712839924	\N	\N	\N	\N	\N	\N	\N	\N	1607.88	\N	\N	241.18	No	No	No	\N	6	bookings_data	2024-05-23
148	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-06-08	2024-06-15	2023-07-08	Travanto	Tom Becher	4	2		modification of booking	42423434	33382940	tom_16_04@yahoo.de	017660425848	06667	Weißenfels	DE	\N	\N	\N	\N	\N	1634.22	490.27	0	\N	Yes	Yes	No	Karl-Marx-Straße 4 	7	bookings_data	2024-06-15
149	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-06-15	2024-06-22	2023-07-04	Ferienhausmiete.de	Konstanze Rudolph	3	5		modification of booking	42197765	33194762	Konstanze.r@gmx.net	01606501616				\N	\N	\N	\N	\N	1484.4	484.4	0	\N	Yes	Yes	No		7	bookings_data	2024-06-22
150	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-06-22	2024-06-29	2024-01-11	Booking.com	Melanie Borrmann	2	3	de	modification of booking	51830900	41148011	mborrm.504362@guest.booking.com	+49 1575 4092574	39397	Gröningen		\N	\N	\N	\N	\N	1510.93	\N	\N	226.64	No	No	No	Am Bahnhof 94D	7	bookings_data	2024-06-29
151	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-06-29	2024-07-06	2023-08-13	Booking.com	Mark Mathew	5	2	de	cancellation	44363906	34999094	mmathe.972170@guest.booking.com	+49 172 3763640	01237	Dresden	\N	\N	\N	\N	\N	\N	2091.45	0	0	313.72	No	No	No	Basedowstr. 22	5	bookings_data	2024-07-06
152	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-06-29	2024-07-06	2024-04-27	Airbnb	Christian Necke	3	1	de	modification of booking	58404098	46556378	\N	+4917632485595				\N	\N	\N	\N	\N	1502.3	0	0	225.35	Yes	No	No		5	bookings_data	2024-07-06
153	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-07-06	2024-07-13	2023-06-18	Booking.com	Heike Nass	3	0	de	cancellation	41336111	32478434	hnass.110985@guest.booking.com	+49 365 4201994	\N	\N	\N	\N	\N	\N	\N	\N	1816.29	\N	\N	272.44	No	No	No	\N	7	bookings_data	2024-07-13
154	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-07-06	2024-07-13	2023-09-27	Booking.com	Silvio Heidenreich	4	3	de	modification of booking	46700827	36938140	sheide.234121@guest.booking.com	+49 177 7451014		04435 Schkeuditz		\N	\N	\N	\N	\N	1996.07	0	0	299.41	No	No	No	Edith-Müller-Straße 5	7	bookings_data	2024-07-13
155	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-07-13	2024-07-20	2023-08-12	Ferienhausmiete.de	Bianka Hendrich	6	2		cancellation	44300000	34945508	hendrich-bianka@web.de	015231944673	02827	Görlitz	Deutschland	\N	\N	\N	\N	\N	1895.62	379.12	\N	\N	No	No	No	Schlaurother Straße 56	7	bookings_data	2024-07-20
156	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-07-13	2024-07-20	2023-08-28	Website	Jens Neumann	3	0	de	modification of booking	45117179	35617196	jens.neumann@wolfsburg.de	49 17647713608	38440	Wolfsburg		\N	\N	\N	\N	\N	1477.43	295.49	0	\N	Yes	Yes	No	Wohltbergstr. 35	7	bookings_data	2024-07-20
157	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-07-18	2024-07-28	2023-04-18	Booking.com	Petra Seifert	2	1		cancellation	38183260	29883349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2012.87	0	0	\N	No	No	No	\N	10	bookings_data	2024-07-28
282	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-09-14	2099-09-15	2025-05-01	Direct booking	DKL	1	0		cancellation	95683338	77335938	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-09-15
158	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-07-20	2024-07-27	2023-09-10	Booking.com	Frank Schneider	4	2	de	cancellation	45800846	36188285	fschne.487271@guest.booking.com	+49 1512 8865177	92421	Schwandorf	\N	\N	\N	\N	\N	\N	2372.3	\N	\N	355.85	No	No	No	Wiesenleite 8	7	bookings_data	2024-07-27
159	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-07-20	2024-07-27	2023-09-29	Traum-Ferienwohnungen	Michael Kuhndt	5	2		modification of booking	46857022	37066939	michael.kuhndt@gmail.com	015770590570	04317 	Leipzig		\N	\N	\N	\N	\N	1933	386.6	0	\N	Yes	Yes	No	Kippenbergstraße 3	7	bookings_data	2024-07-27
160	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-07-28	2024-08-04	2023-07-13	Traum-Ferienwohnungen	Kathleen Jungmann	4	4		modification of booking	42712043	33621005	kathleen.jungmann@gmx.de	\N	47475	Kamp-Lintfort		\N	\N	\N	\N	\N	1889	377.8	0	\N	Yes	Yes	No	Friedrich-Heinrich-Allee 34	3	bookings_data	2024-08-04
161	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-08-04	2024-08-18	2023-05-16	Traum-Ferienwohnungen	Stephan Wiesmann	4	2		modification of booking	39649223	31084367	s.wn@gmx.de	01726837159	97737	Gemünden		\N	\N	\N	\N	\N	2964	592.8	0	\N	Yes	Yes	No	Dirmbachstr. 59	14	bookings_data	2024-08-18
162	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-08-18	2024-08-24	2023-07-08	Blocked channel	Eigenbelegung	0	0		cancellation	42425198	\N	\N	\N				\N	\N	\N	\N	\N	0	0	0	\N	No	No	No		6	bookings_data	2024-08-24
163	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-08-18	2024-08-24	2023-12-26	Travanto	Annett Noack	2	3		modification of booking	51000653	40445351	anlo79@kabelmail.de	+49493883721239	19230	Hagenow	DE	\N	\N	\N	\N	\N	1572.36	284.59	0	\N	Yes	Yes	No	Rudolf-Tarnow-Straße 25 	6	bookings_data	2024-08-24
164	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-08-24	2024-08-31	2023-07-03	Website	Christiane Kücking	5	0	de	modification of booking	42150692	33155183	c@cphinx.de	01577-2040366	48147	Münster	Deutschland	\N	\N	\N	\N	\N	1595.71	319.14	0	\N	Yes	Yes	No	Auf der Horst 22	7	bookings_data	2024-08-31
165	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-08-31	2024-09-07	2023-06-22	Booking.com	Susanne Kiefer	4	1	de	cancellation	41551514	32656988	skiefe.812830@guest.booking.com	+49 174 3085995	\N	\N	\N	\N	\N	\N	\N	\N	1943.79	\N	\N	291.57	No	No	No	\N	6	bookings_data	2024-09-07
166	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-08-31	2024-09-07	2024-08-22	Blocked channel	\N	0	0		modification of booking	70089301	\N	\N	\N				\N	\N	\N	\N	\N	0	0	0	\N	No	No	No		6	bookings_data	2024-09-07
167	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-09-07	2024-09-14	2023-08-21	Website	Pascal Doms	6	0	de	modification of booking	44759006	29106454	pascal.doms@hotmail.de	49 1511 0760501				\N	\N	\N	\N	\N	1473.35	294.67	0	\N	Yes	Yes	No		7	bookings_data	2024-09-14
168	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-09-15	2024-09-23	2024-07-20	Website	Gerd Schönfeld	3	0	de	modification of booking	66748371	53482236	gerdschonfeld06@gmail.com	0304558486	13437	Berlin	Deutschland	\N	\N	\N	\N	\N	1197.61	239.52	0	\N	Yes	Yes	No	Roedernallee	8	bookings_data	2024-09-23
169	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-09-17	2024-09-27	2024-05-03	Booking.com	Reto Strebel	2	0	de	cancellation	58873346	46942862	rstreb.655784@guest.booking.com	+41 79 771 94 61	\N	Basel	\N	\N	\N	\N	\N	\N	1726.37	\N	\N	258.96	No	No	No	Largitzenstrasse 40	10	bookings_data	2024-09-27
171	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-09-28	2024-10-05	2023-09-20	Website	Stephanie Glaeser	8	0	de	modification of booking	46342081	36637363	glaeser.stephanie@t-online.de	01605519941	99096	Erfurt	Deutschland	\N	\N	\N	\N	\N	1515.61	266.32	0	\N	Yes	Yes	No	Geibelstraße 42	4	bookings_data	2024-10-05
172	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-10-05	2024-10-12	2023-10-29	Booking.com	Yvonne Schurig	5	2	de	cancellation	48315929	38267594	yschur.621191@guest.booking.com	+49 177 7572761	04179	Leipzig		\N	\N	\N	\N	\N	1620.96	\N	\N	243.14	No	No	No	William-Zipperer-Straße 124 b	7	bookings_data	2024-10-12
174	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-10-12	2024-10-19	2024-04-19	Airbnb	Frank Jerger	5	1	de	modification of booking	57933319	46165726	\N	+491736602413				\N	\N	\N	\N	\N	1381.37	0	0	207.21	Yes	No	No		7	bookings_data	2024-10-19
175	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-10-19	2024-10-26	2024-03-15	Booking.com	Susann Salzmann	2	3	de	modification of booking	55794185	44400737	ssalzm.562197@guest.booking.com	+49 173 7322339	18069	Rostock		\N	\N	\N	\N	\N	1303.65	0	0	195.55	Yes	No	No	Bregenzer Str.9	7	bookings_data	2024-10-26
176	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-10-27	2024-11-02	2024-06-30	Booking.com	Uwe Babenschneider	2	2	de	modification of booking	64722116	51782151	ubaben.542763@guest.booking.com	+49 162 8948196	80639	München		\N	\N	\N	\N	\N	1140.44	0	0	171.07	Yes	No	No	Birketweg 57	1	bookings_data	2024-11-02
177	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-11-06	2024-11-11	2024-08-04	Booking.com	Miklos Hegybiro	4	1	de	modification of booking	68229791	54720901	mhegyb.847921@guest.booking.com	+49 175 3354961	29571	Rosche		\N	\N	\N	\N	\N	841	0	0	118.35	Yes	No	No	Katzien	5	bookings_data	2024-11-11
178	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-11-13	2024-11-16	2024-09-09	Blocked channel	\N	0	0		modification of booking	71945218	\N	\N	\N				\N	\N	\N	\N	\N	0	0	0	\N	No	No	No		3	bookings_data	2024-11-16
179	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-11-16	2024-11-18	2024-08-30	HomeToGo	Nicole Rath	2	0		modification of booking	70871066	56921136	Nicole.rath69@gmail.com	01738099954			DE	\N	\N	\N	\N	\N	207	0	0	36.95	Yes	No	No		2	bookings_data	2024-11-18
180	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-11-18	2024-11-25	2024-09-17	Blocked channel	\N	\N	\N		cancellation	72686463	\N	\N	\N				\N	\N	\N	\N	\N	\N	\N	\N	\N	No	No	No		7	bookings_data	2024-11-25
181	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-12-21	2024-12-28	2024-10-06	Airbnb	Steffi Witte	5	1	de	modification of booking	74680598	60058598	\N	+491746656768	\N	\N	\N	\N	\N	\N	\N	\N	1403.12	0	0	210.47	Yes	No	No	\N	7	bookings_data	2024-12-28
182	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-12-26	2025-01-02	2023-11-19	Booking.com	Sandra Janzen	4	4	de	cancellation	49311224	39072800	sjanze.260621@guest.booking.com	+49 173 7508828	32312	Luebbecke	\N	\N	\N	\N	\N	\N	1932.73	\N	\N	289.91	No	No	No	Molkereiweg 1a	1	bookings_data	2025-01-02
183	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-12-28	2025-01-04	2023-12-31	Booking.com	Andrea Querner	5	0	de	cancellation	51208766	40621268	aquern.522887@guest.booking.com	+49 160 7589094	01326	Dresden		\N	\N	\N	\N	\N	1738	\N	\N	260.7	No	No	No	Wachwitzgrund 55	3	bookings_data	2025-01-04
184	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-12-28	2025-01-04	2024-01-15	Direct booking	Andrea Querner	5	0		modification of booking	52125746	40621268	Andreaquerner@gmail.com	+49 160 7589094	01326	Dresden		\N	\N	\N	\N	\N	1565	313	0	\N	Yes	Yes	No	Wachwitzgrund 55	3	bookings_data	2025-01-04
185	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-01-04	2025-01-11	2024-12-10	Ferienhausmiete.de	Simone Mühlich	2	0		modification of booking	80679908	64931583	simmue@gmx.de	017662209933	71732	Tamm	Deutschland	\N	\N	\N	\N	\N	801.22	0	0	\N	Yes	No	No	Alleen 96	7	bookings_data	2025-01-11
186	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-01-19	2025-01-26	2024-09-01	Booking.com	Lars Kessler	4	0	de	modification of booking	71022111	57045636	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	932.74	0	0	139.91	Yes	No	No	\N	7	bookings_data	2025-01-26
187	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-01-26	2025-01-30	2024-09-30	Booking.com	Kevin Nofz	2	0	de	cancellation	74012298	59511438	knofz.759217@guest.booking.com	+49 173 6402835	\N	Berlin	\N	\N	\N	\N	\N	\N	625.8	\N	\N	93.87	No	No	No	Reichsstrasse 21	4	bookings_data	2025-01-30
280	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-06-09	2099-06-10	2025-06-09	Direct booking	Tester Testeo	1	0		reservation	100093953	78333698	dirk.klemer@10minutemailbox.com	\N				\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No		1	bookings_data	2099-06-10
188	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-02-01	2025-02-08	2024-02-07	Booking.com	Adrian Germanus	2	2	de	cancellation	53481926	54792041	agerma.124737@guest.booking.com	+49 491 7644266192	14473	Potsdam		\N	\N	\N	\N	\N	1089.6	\N	\N	163.44	No	No	No	Albert-Einstein-Straße 23	7	bookings_data	2025-02-08
190	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-02-11	2025-02-16	2025-01-09	Direct booking	Lutz Kobernuß	2	3		modification of booking	83300118	67067653	lutz.kobernuss@icloud.com	\N	17129	Alt Tellin		\N	\N	\N	\N	\N	708.14	0	0	\N	Yes	No	No	Siedenbüssow 31	5	bookings_data	2025-02-16
191	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-02-17	2025-02-19	2024-11-08	Blocked channel	\N	0	0		modification of booking	77794083	\N	\N	\N				\N	\N	\N	\N	\N	0	0	0	\N	No	No	No		2	bookings_data	2025-02-19
192	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-02-22	2025-03-01	2024-10-01	Airbnb	Johanna Richter	2	3	de	modification of booking	74211238	59671403	\N	+491734539723	\N	\N	\N	\N	\N	\N	\N	\N	979.43	0	0	146.91	Yes	No	No	\N	0	bookings_data	2025-03-01
193	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-03-01	2025-03-05	2025-02-16	Booking.com	Janina Herrmann	2	2	de	modification of booking	87622103	70631278	jherrm.992543@guest.booking.com	+49 162 3574964	\N	Rostock	\N	\N	\N	\N	\N	\N	676.2	0	0	101.43	Yes	No	No	PatriotischerWeg 30	4	bookings_data	2025-03-05
194	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-03-06	2025-03-09	2024-06-10	Booking.com	Yvonne Griephan	8	0	de	modification of booking	62663916	50088181	ygriep.475752@guest.booking.com	+49 491 5227397043	\N	Berlin	\N	\N	\N	\N	\N	\N	1064.07	0	0	159.61	Yes	No	No	Gielower str. 28b	3	bookings_data	2025-03-09
195	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-03-14	2025-03-18	2025-01-07	Airbnb	Nina Schwarz	3	1	de	modification of booking	83066173	66877473	\N	+4917654028613	\N	\N	\N	\N	\N	\N	\N	\N	647	0	0	97.05	Yes	No	No	\N	4	bookings_data	2025-03-18
196	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-03-22	2025-03-29	2025-01-24	Website	Sabine Schmidt	2	0	de	modification of booking	85014913	68470443	schmidts_bine@web.de	02302 962983	58453	Witten	Deutschland	\N	\N	\N	\N	\N	923.26	184.65	0	\N	Yes	Yes	No	Steinbachstrasse 35 a	7	bookings_data	2025-03-29
197	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-04-05	2025-04-12	2024-10-23	Booking.com	Felicitas Kramer	2	2	de	modification of booking	76265488	61353043	fkrame.147131@guest.booking.com	+49 1523 3733645	38116	Braunschweig	\N	\N	\N	\N	\N	\N	1470.4	\N	\N	220.56	No	No	No	Mühlenfeld 4	7	bookings_data	2025-04-12
198	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-04-12	2025-04-18	2024-03-29	Booking.com	Felicitas Kramer	2	2	de	cancellation	56608169	45074396	fkrame.199014@guest.booking.com	+49 1523 3733645	38116	Braunschweig	\N	\N	\N	\N	\N	\N	1470.32	\N	\N	220.55	No	No	No	Mühlenfeld 4	6	bookings_data	2025-04-18
199	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-04-12	2025-04-18	2024-11-16	Website	Benjamin Beinicke	7	0	de	modification of booking	78532063	63187183	bei.ben@web.de	015226329135	33824	Werther	Deutschland	\N	\N	\N	\N	\N	1321.08	264.22	0	\N	Yes	Yes	No	Astrid-Lindgren-Weg 1	6	bookings_data	2025-04-18
200	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-04-18	2025-04-26	2024-05-29	Website	Elke Jäger	6	0	de	modification of booking	61428373	49066141	elke1978@web.de	01714771899	04229	Leipzig 		\N	\N	\N	\N	\N	1576.73	315.35	0	\N	Yes	Yes	No	Merseburger Straße 30	8	bookings_data	2025-04-26
201	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-04-30	2025-05-05	2024-03-29	Blocked channel	\N	0	0		modification of booking	56612624	57284616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	No	No	No	\N	4	bookings_data	2025-05-05
203	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-05-10	2025-05-17	2024-12-23	Booking.com	Martin D. Ole Nitsche	8	0	de	cancellation	81651978	65745203	mnitsc.868225@guest.booking.com	+49 491 634564422	13057	Berlin	\N	\N	\N	\N	\N	\N	1694.66	\N	\N	254.2	No	No	No	Welsestrasse 57	7	bookings_data	2025-05-17
204	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-05-10	2025-05-18	2024-12-23	Booking.com	Martin Daniel Ole Nitsche	8	0	de	cancellation	81687363	65745203	mnitsc.779240@guest.booking.com	+49 163 4564422	13057	Berlin	\N	\N	\N	\N	\N	\N	1922.47	\N	\N	288.37	No	No	No	Welsestrasse 57	8	bookings_data	2025-05-18
205	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-05-14	2025-05-18	2025-04-26	Blocked channel	\N	\N	\N		modification of booking	95124723	\N	\N	\N				\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No		4	bookings_data	2025-05-18
207	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-05-18	2025-06-01	2025-05-01	Blocked channel	Wasserschaden	\N	\N		cancellation	95670638	77325273	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	0	bookings_data	2025-06-01
208	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-05-26	2025-06-01	2024-10-30	Website	Katrin Schmökel	7	0	de	cancellation	76987738	61939663	k.schmoekel@hotmail.de	015737189642	14059	Berlin Charlottenburg-Wilmersdorf		\N	\N	\N	\N	\N	1560.64	312.13	0	\N	Yes	Yes	No	Sophie-Charlotten-Str. 82 82	0	bookings_data	2025-06-01
209	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-05-26	2025-06-01	2025-05-02	Blocked channel	Wasserschaden	\N	\N		cancellation	95706603	77355083	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	0	bookings_data	2025-06-01
210	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-05-29	2025-06-02	2025-05-28	Blocked channel	Wasserschaden	\N	\N		reservation	98684018	79783733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2025-06-02
211	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-06-01	2025-06-05	2025-04-26	Blocked channel	\N	\N	\N		cancellation	95124783	\N	\N	\N				\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No		4	bookings_data	2025-06-05
212	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-06-05	2025-06-10	2024-07-24	Direct booking	Evi Mengel	5	0		cancellation	67222876	53880226	evimengel.sn@gmail.com	\N	19063	Schwerin		\N	\N	\N	\N	\N	1225.4	245.08	0	\N	Yes	Yes	No	Ziolkowskistraße 68	5	bookings_data	2025-06-10
213	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-06-05	2025-06-10	2025-05-02	Blocked channel	Wasserschaden	\N	\N		cancellation	95707633	77355948	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	5	bookings_data	2025-06-10
214	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-06-05	2025-06-10	2025-05-28	Blocked channel	Wasserschaden	\N	\N		reservation	98684048	79783758	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	5	bookings_data	2025-06-10
215	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-06-10	2025-06-20	2024-08-11	Ferienhausmiete.de	Michael Schuster	4	2		modification of booking	68985316	55356431	rhode.schuster@gmail.com	015901484305	72636	Frickenhausen	Deutschland	\N	\N	\N	\N	\N	2095	419	0	\N	Yes	Yes	No	Florianweg 13	10	bookings_data	2025-06-20
216	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-06-20	2025-06-28	2024-09-02	Blocked channel	\N	\N	\N		cancellation	71090291	\N	\N	\N				\N	\N	\N	\N	\N	\N	\N	\N	\N	No	No	No		8	bookings_data	2025-06-28
217	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-06-21	2025-06-28	2024-07-17	Booking.com	Caroline Reinhardt	2	0	de	cancellation	66428801	53216521	creinh.764363@guest.booking.com	+49 1512 0185322	61350	Bad Homburg	\N	\N	\N	\N	\N	\N	1653.32	\N	\N	248	No	No	No	Kirdorfer Strasse, 13	7	bookings_data	2025-06-28
218	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-06-21	2025-06-28	2024-11-24	Website	Carolin Bunsen	2	0	de	modification of booking	79177543	63708048	carolin.bunsen@gmx.de	01622965120	49124	Georgsmarienhütte 	\N	\N	\N	\N	\N	\N	1584	316.8	0	\N	Yes	Yes	No	Neuer Kamp 24	7	bookings_data	2025-06-28
219	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-06-28	2025-07-12	2024-08-02	Booking.com	Andreas Grunow	3	4	de	cancellation	68040451	54561351	agruno.905145@guest.booking.com	+49 163 1603766	94377	Steinach	\N	\N	\N	\N	\N	\N	3774.48	\N	\N	566.17	No	No	No	Hohenburgstr 19	11	bookings_data	2025-07-12
220	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-06-28	2025-07-12	2024-08-27	Booking.com	Elisabeth Merkel	4	4	de	modification of booking	70507371	56625976	emerke.720545@guest.booking.com	+49 1511 9484469	98646	Hildburghausen	\N	\N	\N	\N	\N	\N	4102.74	0	0	615.41	No	No	No	Kuhgasse 14	11	bookings_data	2025-07-12
221	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-07-12	2025-07-19	2024-06-21	Direct booking	Konstanze Rudolph	4	4		modification of booking	63791606	33194762	Konstanze.r@gmx.net	01606501616				\N	\N	\N	\N	\N	1957	500	0	\N	Yes	Yes	No		7	bookings_data	2025-07-19
222	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-07-19	2025-07-26	2024-07-19	Website	Jens Neumann	3	0	de	modification of booking	66645526	35617196	jens.neumann@wolfsburg.de	017647713608	38440	Wolfsburg		\N	\N	\N	\N	\N	1716	343.2	0	\N	Yes	Yes	No	Wohltbergstr. 35	7	bookings_data	2025-07-26
223	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-07-26	2025-08-02	2024-07-24	Booking.com	Marleen Mair	4	3	de	cancellation	67219311	53877071	mmair.868715@guest.booking.com	+49 1517 0098582	\N	Bernau	\N	\N	\N	\N	\N	\N	2236.64	\N	\N	335.5	No	No	No	Käthe-Paulus-Str. 1	1	bookings_data	2025-08-02
224	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-07-26	2025-08-02	2025-01-14	HomeToGo	Nicolas Jost	4	3		modification of booking	83814703	67489818	njost.ch@gmail.com	0794647500	\N	\N	CH	\N	\N	\N	\N	\N	2203.72	\N	\N	393.37	No	No	No	\N	1	bookings_data	2025-08-02
225	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-08-02	2025-08-09	2024-06-22	Website	Christiane Kücking	5	0	de	modification of booking	63877941	33155183	c@cphinx.de	015772040366	48147	Münster	Deutschland	\N	\N	\N	\N	\N	1582	338.4	0	\N	No	Yes	No	Auf der Horst 22	7	bookings_data	2025-08-09
226	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-08-09	2025-08-16	2024-10-27	Ferienhausmiete.de	Antje Jürschik	4	4		modification of booking	76670593	61683308	antje.arndt86@web.de	01743090000	16928	Pritzwalk	Deutschland	\N	\N	\N	\N	\N	2094	418.8	0	\N	Yes	Yes	No	Neuhof 3a	7	bookings_data	2025-08-16
227	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-08-16	2025-08-23	2024-10-28	Airbnb	Jørgen Bo Jørgensen	4	2	de	reservation	76733848	61734938	\N	+491784917986	\N	\N	\N	\N	\N	\N	\N	\N	2061.71	\N	\N	309.26	No	No	No	\N	7	bookings_data	2025-08-23
228	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-08-23	2025-08-30	2024-11-03	Booking.com	Claus Mueller	2	1	de	reservation	77324538	62216173	cmuell.496436@guest.booking.com	+49 7621 1690129	79576	Weil am Rhein	\N	\N	\N	\N	\N	\N	1938.17	\N	\N	290.73	No	No	No	Wittlinger Strasse 37	7	bookings_data	2025-08-30
229	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-08-30	2025-09-06	2025-05-29	Website	Stefan Betz	2	0	de	modification of booking	98780038	79862553	stefan.betz1@gmx.de	025918921349	59348	Lüdinghausen	Deutschland	\N	\N	\N	\N	\N	1334.54	266.91	0	\N	No	Yes	No	Im Ried, 1b	5	bookings_data	2025-09-06
230	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-09-06	2025-09-14	2024-03-29	Blocked channel	\N	0	0		cancellation	56612600	\N	\N	\N				\N	\N	\N	\N	\N	0	0	0	\N	No	No	No		8	bookings_data	2025-09-14
231	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-09-06	2025-09-14	2024-10-31	Ferienhausmiete.de	Madlen Weber	4	0		cancellation	77035513	61977123	blaulicht69@gmx.de	01785239659				\N	\N	\N	\N	\N	2077	415	0	\N	No	No	No		8	bookings_data	2025-09-14
232	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-09-06	2025-09-14	2024-11-15	Website	Robert Keilhauer	4	0	de	modification of booking	78445488	63117113	robert.keilhauer@web.de	01787100369	04808	Nemt	\N	\N	\N	\N	\N	\N	1984.73	396.95	0	\N	No	Yes	No	Mühlbacher Straße 4	8	bookings_data	2025-09-14
233	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-09-14	2025-09-21	2024-10-31	Blocked channel	\N	0	0		cancellation	77040863	\N	\N	\N				\N	\N	\N	\N	\N	0	0	0	\N	No	No	No		7	bookings_data	2025-09-21
235	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-09-19	2025-09-26	2025-05-13	Booking.com	Marcus Wendlandt	6	2	de	cancellation	97015113	78422283	mwendl.658304@guest.booking.com	+49 1517 2214905	38539	Müden(Aller)	\N	\N	\N	\N	\N	\N	1515.33	0	0	227.3	No	No	No	Am Walde 4	7	bookings_data	2025-09-26
236	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-09-21	2025-09-28	2024-11-04	Booking.com	Eric Kutzer	5	2	de	cancellation	77428633	62299668	ekutze.222077@guest.booking.com	+49 1520 3092422	\N	Schönefeld	\N	\N	\N	\N	\N	\N	1687.96	\N	\N	253.19	No	No	No	Aldebaranstr. 4	7	bookings_data	2025-09-28
237	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-09-28	2025-10-05	2024-10-14	Ferienhausmiete.de	Hannelore Beewen	2	\N		cancellation	75400878	60645693	hannebeewen@gmail.com	01711420941	49356	Diepholz	Deutschland	\N	\N	\N	\N	\N	1310	262	\N	\N	No	No	No	willenberg  55	4	bookings_data	2025-10-05
238	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-10-11	2025-10-18	2025-02-03	Airbnb	Katrin Holzbrink	6	2	de	reservation	86194008	69450638	\N	+491797012853	\N	\N	\N	\N	\N	\N	\N	\N	1601.81	\N	\N	240.27	No	No	No	\N	7	bookings_data	2025-10-18
109	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-09-14	2023-09-23	2023-06-15	Traum-Ferienwohnungen	Martina Kaesler	3	0		modification of booking	41162672	32334569	hausdrachen.martina@freenet.de	051268261	31191	Algermissen		\N	\N	\N	\N	\N	1323	264.6	0	\N	Yes	Yes	No	Hildesheimer Str. 7	9	bookings_data	2023-09-23
139	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-04-15	2024-04-19	2024-01-28	Booking.com	Rainer Gramsch	4	0	de	modification of booking	52874489	41993906	rgrams.351526@guest.booking.com	+49 174 3452673		.Berlin		\N	\N	\N	\N	\N	820.2	0	0	123.03	Yes	No	No	Prenzlauer Allee 47	4	bookings_data	2024-04-19
141	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-05-03	2024-05-05	2024-02-25	Booking.com	Alexander Kämpfe	6	0	de	modification of booking	54540410	43368560	akampf.456685@guest.booking.com	+49 162 9570274		Rathenow		\N	\N	\N	\N	\N	901.94	0	0	135.29	Yes	No	No	Mühlenstraße 12, 14712 Rathenow	2	bookings_data	2024-05-05
239	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-10-18	2025-10-25	2024-09-29	HomeToGo	Kristina Karol	5	3		modification of booking	73920928	59433773	kristina.karol@web.de	015751740039	\N	\N	DE	\N	\N	\N	\N	\N	1679.81	\N	\N	299.84	No	No	No	\N	7	bookings_data	2025-10-25
240	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-10-25	2025-11-01	2024-11-02	Booking.com	Stephan Segerer	4	3	de	reservation	77198463	62114408	sseger.229485@guest.booking.com	+49 176 62088127	\N	Hamburg	\N	\N	\N	\N	\N	\N	1713.19	\N	\N	256.98	No	No	No	Lottestraße 38	0	bookings_data	2025-11-01
241	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-11-08	2025-11-15	2024-11-13	Booking.com	Petra Wirtz	4	0	de	cancellation	78265943	62974048	pwirtz.476164@guest.booking.com	+49 1511 1124359	\N	.Ellerhoop	\N	\N	\N	\N	\N	\N	1139.8	\N	\N	170.97	No	No	No	Dorfstraße 11f	7	bookings_data	2025-11-15
242	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-11-14	2025-11-16	2025-06-10	Blocked channel	Eigenbelegung	\N	\N		cancellation	100200508	81028813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	2	bookings_data	2025-11-16
243	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-11-14	2025-11-17	2025-06-10	Blocked channel	\N	\N	\N		reservation	100200718	\N	\N	\N				\N	\N	\N	\N	\N	\N	\N	\N	\N	No	No	No		3	bookings_data	2025-11-17
244	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-11-21	2025-11-22	2025-04-02	Rentals United iCal	\N	\N	\N		cancellation	92628313	\N	\N	\N				\N	\N	\N	\N	\N	\N	\N	\N	\N	No	No	No		1	bookings_data	2025-11-22
245	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-12-19	2025-12-27	2025-05-17	Airbnb	Fanny Förster	4	1	de	modification of booking	97408903	78742663	\N	+4917673581425	\N	\N	\N	\N	\N	\N	\N	\N	1570.87	0	0	235.63	No	No	No	\N	8	bookings_data	2025-12-27
246	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-12-27	2026-01-03	2025-01-11	Airbnb	Alfred Krohmer	4	3	de	modification of booking	83526463	67252208	\N	+491724645688	\N	\N	\N	\N	\N	\N	\N	\N	2023.17	0	0	303.48	No	No	No	\N	2	bookings_data	2026-01-03
247	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2026-02-06	2026-02-08	2025-04-08	Booking.com	Christian Stamerjohanns	6	0	de	reservation	93239307	75311183	cstame.948665@guest.booking.com	+49 178 3563810	27777	Ganderkesee	\N	\N	\N	\N	\N	\N	762.64	\N	\N	114.4	No	No	No	Schierbroker Str. 49	2	bookings_data	2026-02-08
281	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-06-11	2099-06-12	2025-06-09	Direct booking	Tester	1	0		cancellation	100093253	80942738	tester10@minutemail.net	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-06-12
248	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2026-02-08	2026-02-13	2025-02-23	Booking.com	Michaela Lins	4	0	de	reservation	88369678	71238913	mlins.964037@guest.booking.com	+49 1515 4849512	99428	Grammetal OT Hopfgarten	\N	\N	\N	\N	\N	\N	841.6	\N	\N	126.24	No	No	No	Ahornweg 5	5	bookings_data	2026-02-13
249	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2026-05-23	2026-05-30	2025-05-26	Booking.com	Renate Moraske	4	0	de	reservation	98436613	79585258	rmoras.205545@guest.booking.com	+49 171 4986092	\N	Karlshagen	\N	\N	\N	\N	\N	\N	1580.02	\N	\N	237	No	No	No	Dünenstrasse 31	7	bookings_data	2026-05-30
250	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2026-08-01	2026-08-08	2025-06-07	Website	Christiane Kücking	4	1	de	modification of booking	99840158	80732033	c@cphinx.de	01577-2040366	48147	Münster	Deutschland	\N	\N	\N	\N	\N	1921	384.2	\N	\N	No	Yes	No	Auf der Horst 22	7	bookings_data	2026-08-08
251	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2098-12-30	2098-12-31	2025-05-13	Direct booking	Max Mustermann	1	0		cancellation	97030323	75960844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2098-12-31
252	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-01-09	2099-01-10	2025-04-14	Direct booking	Moritz Klemer	1	0		cancellation	93840549	75812219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-01-10
253	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-01-12	2099-01-13	2025-04-09	Direct booking	Dirk Klemer	1	0		cancellation	93330379	75387115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-01-13
254	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-01-13	2099-01-14	2025-04-08	Direct booking	Dirk Klemer	1	0		cancellation	93275267	75341115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-01-14
255	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-01-14	2099-01-15	2025-04-14	Direct booking	Dirk Klemer	1	0		cancellation	93841709	75813169	dirk.klemer@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-01-15
256	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-01-14	2099-01-15	2025-04-16	Direct booking	Hannes Klemer	1	0		cancellation	94121719	76044989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-01-15
257	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-01-15	2099-01-16	2025-04-08	Direct booking	Dirk Klemer	1	0		cancellation	93273623	75339831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-01-16
258	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-01-16	2099-01-17	2025-04-14	Direct booking	Dirk Klemer	1	0		cancellation	93842164	75813579	dirk.klemer@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-01-17
259	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-01-29	2099-01-30	2025-04-14	Direct booking	Hannes Klemer	1	0		cancellation	93841154	75812744	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-01-30
260	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-04	2099-04-05	2025-04-14	Direct booking	Dirk Klemer	1	0		cancellation	93859759	75827974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-04-05
261	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-04	2099-04-14	2025-04-15	Direct booking	Dirk Klemer	1	0		cancellation	93904974	75866414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	10	bookings_data	2099-04-14
262	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-04	2099-04-05	2025-04-15	Direct booking	Dirk Klemer	1	0		cancellation	93905564	75866929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-04-05
263	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-15	2099-04-16	2025-04-15	Direct booking	Max Mustermann	1	0		cancellation	94019219	75960844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-04-16
264	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-23	2099-04-24	2025-04-15	Direct booking	Max Mustermann	1	0		cancellation	93905324	75866729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-04-24
265	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-25	2099-04-26	2025-04-15	Direct booking	Hannes Klemer	1	0		cancellation	94017924	75959694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-04-26
266	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-26	2099-04-27	2025-04-20	Direct booking	Moritz Klemer	6	0		cancellation	94486714	76348079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-04-27
267	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-26	2099-04-27	2025-04-20	Direct booking	Hannes Klemer	1	0		cancellation	94488239	76349349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-04-27
268	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-26	2099-04-27	2025-04-21	Direct booking	Nancy Klemer	1	0		cancellation	94575924	76423139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-04-27
269	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-26	2099-04-27	2025-04-21	Direct booking	Nancy Klemer	1	0		cancellation	94577464	76424574	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-04-27
270	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-28	2099-04-30	2025-04-15	Direct booking	Moritz Klemer	1	0		cancellation	93906089	75867364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	2	bookings_data	2099-04-30
170	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-09-24	2024-09-28	2024-08-05	Airbnb	Tobias Kozlowski	4	2	de	modification of booking	68336256	54808656	\N	+491622310890				\N	\N	\N	\N	\N	880	0	0	132	No	No	No		4	bookings_data	2024-09-28
202	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-05-05	2025-05-14	2025-02-08	Direct booking	Stefan Wengler	2	0		modification of booking	86727123	69890353	stefan.wengler51@gmail.com	0160 519 4655	50931	Köln		\N	\N	\N	\N	\N	1332.96	267	0	\N	Yes	Yes	No	Frangenheimer Str 19	9	bookings_data	2025-05-14
234	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-09-19	2025-09-26	2025-04-09	Booking.com	Eric Kutzer	5	0	de	cancellation	93353327	75406563	ekutze.914840@guest.booking.com	+49 1520 3092422	\N	Schönefeld	\N	\N	\N	\N	\N	\N	1550.25	\N	\N	232.54	No	No	No	Aldebaranstr. 4	7	bookings_data	2025-09-26
271	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-04-29	2099-04-30	2025-04-14	Direct booking	Dirk KLemer	1	0		cancellation	93860669	75828709	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-04-30
272	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-05-12	2099-05-13	2025-05-12	Direct booking	Dirk Klemer	1	0		cancellation	96905548	78333193	dirk.klemer@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-05-13
273	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-05-13	2099-05-14	2025-05-12	Direct booking	Dirk Klemer	1	0		cancellation	96906098	78333698	dirk.klemer@gmail.com	\N				\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No		1	bookings_data	2099-05-14
274	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-05-14	2099-05-15	2025-04-15	Direct booking	Moritz Klemer	1	0		cancellation	94019634	75961194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-05-15
275	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-05-19	2099-05-20	2025-05-19	Direct booking	Dirk Klemer	1	0		cancellation	97717683	78333698	dirk.klemer@gmail.com	\N				\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No		1	bookings_data	2099-05-20
276	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-05-21	2099-05-22	2025-05-21	Direct booking	Dirk Klemer	1	0		cancellation	97959393	78333698	dirk.klemer@gmail.com	\N				\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No		1	bookings_data	2099-05-22
277	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-05-28	2099-05-29	2025-04-21	Direct booking	Nancy Klemer	1	0		cancellation	94574349	76421769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-05-29
278	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-06-02	2099-06-03	2025-04-16	Direct booking	Udo Linderberg	1	0		cancellation	94120804	76044224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-06-03
287	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-11-15	2099-11-16	2025-04-10	Direct booking	Max Mustermann	1	0		cancellation	93408139	75452954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-11-16
288	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-11-16	2099-11-17	2025-04-10	Direct booking	Max Mustermann	1	0		cancellation	93413554	75457314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-11-17
289	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-11-18	2099-11-19	2025-04-10	Direct booking	Max Mustermann	1	0		cancellation	93413814	75457519	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-11-19
290	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-11-19	2099-11-20	2025-04-10	Direct booking	Dirk Klemer	1	0		cancellation	93408744	75453514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-11-20
291	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-11-21	2099-11-22	2025-04-10	Direct booking	Max Mustermann	1	0		cancellation	93407709	75452604	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-11-22
292	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-11-26	2099-11-27	2025-04-10	Direct booking	Dirk Klemer	1	0		cancellation	93409019	75453769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-11-27
293	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-04	2099-12-05	2025-04-10	Direct booking	Max Mustermann	1	0		cancellation	93414249	75457884	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-05
294	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-05	2099-12-06	2025-04-09	Direct booking	Dirk Klemer	1	0		cancellation	93367029	75418314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-06
27	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-03-15	2023-03-16	2023-04-18	Direct booking	Max Mustermann	0	0	de	cancellation	38194555	\N	dirk.klemer@gmail.com	\N				\N	\N	\N	\N	\N	156	66	0	\N	No	No	No		1	bookings_data	2023-03-16
28	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-03-30	2023-04-02	2023-03-30	Direct booking	Tanja Bee-Weinelt	4	0		modification of booking	37235191	32794199	\N	\N				\N	\N	\N	\N	\N	414	0	0	\N	Yes	No	No		1	bookings_data	2023-04-02
29	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-04-04	2023-04-05	2023-03-30	Booking.com	Moritz Franke	1	0		cancellation	37234084	29103832	\N	\N				\N	\N	\N	\N	\N	232	0	0	\N	Yes	Yes	No		1	bookings_data	2023-04-05
30	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-04-11	2023-04-14	2023-05-15	Direct booking	Tester	0	0		cancellation	39601859	39676178	dirk.klemer@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	224.08	0	0	\N	Yes	No	No	\N	3	bookings_data	2023-04-14
31	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-04-17	2023-04-18	2023-04-18	FeWo-direkt / HomeAway	Marco Grundwald	0	0		cancellation	38185423	29885233	\N	\N				\N	\N	\N	\N	\N	18	0	0	\N	Yes	No	No		1	bookings_data	2023-04-18
33	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-04-25	2023-04-26	2023-04-24	FeWo-direkt / HomeAway	Jana	0	0		cancellation	38501632	30298534	jana.schmidt060@gmail.com	+49 1567 8986675			DE	\N	\N	\N	\N	\N	62	0	0	\N	Yes	No	No		1	bookings_data	2023-04-26
34	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-04-28	2023-05-01	2023-03-30	Airbnb	Jessica Groß	5	0	de	modification of booking	37233424	29103292	\N	+34651884826				\N	\N	\N	\N	\N	629	0	0	22.46	Yes	Yes	No		0	bookings_data	2023-05-01
35	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-05-01	2023-05-02	2023-04-29	Ferienhausmiete.de	Ralf Bruchowski	2	1		cancellation	38757757	29903029	rolf.bruchowski@gmail.com	01737077702				\N	\N	\N	\N	\N	0	0	0	\N	No	Yes	No		1	bookings_data	2023-05-02
36	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-05-02	2023-05-05	2023-04-28	HomeToGo	Jana Schmidt	2	0		cancellation	38692420	30298534	jana.schmidt060@gmail.com	+4915678986675			DE	\N	\N	\N	\N	\N	49.29	0	0	10.71	Yes	No	No		3	bookings_data	2023-05-05
37	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-05-02	2023-05-05	2023-12-18	Direct booking	Jana Schmidt	2	0		modification of booking	50697488	30298534	0k9vgeez5n8xgc91w7wrjbsc9kdg@agoda-messaging.com	\N			DE	\N	\N	\N	\N	\N	60	0	0	\N	Yes	No	No		3	bookings_data	2023-05-05
38	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-05-05	2023-05-06	2023-04-28	Airbnb	Simone Jahn	1	0	de	modification of booking	38724106	30324361	\N	+491629096000				\N	\N	\N	\N	\N	46	0	0	8.21	Yes	No	No		1	bookings_data	2023-05-06
39	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-05-06	2023-05-07	2023-05-04	Booking.com	Jaqueline Schmidt	2	0	en	cancellation	39035803	30581482	jschmi.151966@guest.booking.com	+49 15678 986675				\N	\N	\N	\N	\N	54	\N	\N	10.8	No	No	No		1	bookings_data	2023-05-07
283	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-11-08	2099-11-09	2025-04-09	Direct booking	Dirk Klemer	1	0		cancellation	93367719	75418899	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-11-09
284	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-11-13	2099-11-14	2025-04-09	Direct booking	Dirk Klemer	1	0		cancellation	93333239	75389399	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-11-14
285	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-11-14	2099-11-15	2025-04-10	Direct booking	Max Mustermann	1	0		cancellation	93407979	75452824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-11-15
286	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-11-14	2099-11-15	2025-04-16	Direct booking	Max Mutzke	1	0		cancellation	94127464	76049924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-11-15
296	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-11	2099-12-12	2025-04-08	Direct booking	Dirk Klemer	1	0		cancellation	93277063	75342715	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-12
297	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-17	2099-12-18	2025-04-08	Direct booking	Dirk Klemer	1	0		cancellation	93276847	75342515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-18
298	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-18	2099-12-19	2025-04-14	Direct booking	Dirk Klemer	1	0		cancellation	93838974	75810839	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-19
299	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-24	2099-12-25	2025-04-09	Direct booking	Dirk Klemer	1	0		cancellation	93330095	75386891	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-25
300	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-24	2099-12-25	2025-04-10	Direct booking	Dirk Klemer	1	0		cancellation	93414054	75457719	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-25
301	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-27	2099-12-28	2025-05-13	Direct booking	Harald Welke	1	0		cancellation	97033458	78437708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-28
302	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-28	2099-12-29	2025-05-13	Direct booking	Max Mutzke	1	0		cancellation	97031763	76049924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-29
303	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-29	2099-12-30	2025-05-01	Direct booking	ddd	1	0		cancellation	95685163	77337603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-30
304	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2099-12-30	2099-12-31	2025-05-01	Direct booking	dkl	1	0		cancellation	95684773	77337228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	\N	\N	No	No	No	\N	1	bookings_data	2099-12-31
26	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2022-12-27	2023-01-02	2023-05-15	Direct booking	Seidel	0	0		modification of booking	39600347	41743280	johanna.seidel90@gmx.de	\N	72072	Tübingen		\N	\N	\N	\N	\N	1050	0	0	\N	Yes	No	No	Derendinger Straße 27	1	bookings_data	2023-01-02
32	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-04-18	2023-04-19	2023-04-18	FeWo-direkt / HomeAway	Rolf Bruchowski	0	0		cancellation	38185426	29903029	rolf.bruchowski@gmail.com	+491737077702				\N	\N	\N	\N	\N	28	0	0	\N	Yes	No	No		1	bookings_data	2023-04-19
110	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-09-29	2023-10-03	2023-05-05	Traum-Ferienwohnungen	Ulrike Olberg	4	2		modification of booking	39089833	30625258	u.olberg@freenet.de	01726514000				\N	\N	\N	\N	\N	784	156.8	0	\N	Yes	Yes	No		2	bookings_data	2023-10-03
113	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2023-10-13	2023-10-15	2023-05-25	Booking.com	Marcus Wetzel	5	0	de	modification of booking	40114286	31469270	mwetze.408994@guest.booking.com	+49 178 1639167	99086	Nesse-Apfelstädt		\N	\N	\N	\N	\N	784	0	0	117.6	Yes	No	No	Zinzendorfstraße 16	2	bookings_data	2023-10-15
142	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-05-09	2024-05-12	2023-06-03	FeWo-direkt / HomeAway	Kathrin Langelotz	8	0		modification of booking	40536998	31817765	kathrinlangelotz@aol.com	\N				\N	\N	\N	\N	\N	1018	0	0	\N	Yes	No	No		3	bookings_data	2024-05-12
173	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2024-10-05	2024-10-12	2024-01-08	Website	Stephanie Gründel	4	0	de	modification of booking	51690866	41013386	stephanie_gruendel@yahoo.de	034126363114	04159	Leipzig	Deutschland	\N	\N	\N	\N	\N	1184	236.8	0	\N	Yes	Yes	No	Faradaystraße, 28	7	bookings_data	2024-10-12
189	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-02-01	2025-02-08	2024-08-05	Direct booking	Adrian Germanus	2	2		modification of booking	68319001	54792041	adrianotto89@googlemail.com	+49 491 7644266192	14473	Potsdam		\N	\N	\N	\N	\N	947	189.4	0	\N	Yes	Yes	No	Albert-Einstein-Straße 23	7	bookings_data	2025-02-08
206	dirk.klemer@gmail.com	Haus Sansibar auf Poel	2025-05-18	2025-05-25	2024-06-26	Booking.com	Dagmar Habdank	3	0	de	cancellation	64333241	51461051	dhabda.493793@guest.booking.com	+49 5136 895171	31303	Burgdorf	\N	\N	\N	\N	\N	\N	1477.94	\N	\N	221.69	No	No	No	Dierener Straße 32	7	bookings_data	2025-05-25
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") FROM stdin;
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads" ("id", "in_progress_size", "upload_signature", "bucket_id", "key", "version", "owner_id", "created_at", "user_metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads_parts" ("id", "upload_id", "size", "part_number", "bucket_id", "key", "etag", "owner_id", "version", "created_at") FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."bookings_id_seq"', 762, true);


--
-- PostgreSQL database dump complete
--

RESET ALL;
