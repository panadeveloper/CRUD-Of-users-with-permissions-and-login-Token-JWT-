PGDMP                         |            dbprueba_rest    15.4    15.4 a    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    28595    dbprueba_rest    DATABASE     �   CREATE DATABASE dbprueba_rest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE dbprueba_rest;
                postgres    false            �            1259    29134 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    29133    auth_group_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    29142    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    29141    auth_group_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    29128    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    29127    auth_permission_id_seq    SEQUENCE     �   ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    29243    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    29242    django_admin_log_id_seq    SEQUENCE     �   ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            �            1259    29120    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    29119    django_content_type_id_seq    SEQUENCE     �   ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    29112    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    29111    django_migrations_id_seq    SEQUENCE     �   ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    29263    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    29273     token_blacklist_blacklistedtoken    TABLE     �   CREATE TABLE public.token_blacklist_blacklistedtoken (
    id bigint NOT NULL,
    blacklisted_at timestamp with time zone NOT NULL,
    token_id bigint NOT NULL
);
 4   DROP TABLE public.token_blacklist_blacklistedtoken;
       public         heap    postgres    false            �            1259    29272 '   token_blacklist_blacklistedtoken_id_seq    SEQUENCE     �   ALTER TABLE public.token_blacklist_blacklistedtoken ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.token_blacklist_blacklistedtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234            �            1259    29279     token_blacklist_outstandingtoken    TABLE       CREATE TABLE public.token_blacklist_outstandingtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone,
    expires_at timestamp with time zone NOT NULL,
    user_id bigint,
    jti character varying(255) NOT NULL
);
 4   DROP TABLE public.token_blacklist_outstandingtoken;
       public         heap    postgres    false            �            1259    29278 '   token_blacklist_outstandingtoken_id_seq    SEQUENCE     �   ALTER TABLE public.token_blacklist_outstandingtoken ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.token_blacklist_outstandingtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            �            1259    29174 
   users_user    TABLE     �  CREATE TABLE public.users_user (
    id bigint NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(20) NOT NULL,
    password character varying(128) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    jwt_token character varying(255)
);
    DROP TABLE public.users_user;
       public         heap    postgres    false            �            1259    29184    users_user_groups    TABLE     ~   CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);
 %   DROP TABLE public.users_user_groups;
       public         heap    postgres    false            �            1259    29183    users_user_groups_id_seq    SEQUENCE     �   ALTER TABLE public.users_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    29173    users_user_id_seq    SEQUENCE     �   ALTER TABLE public.users_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    29190    users_user_user_permissions    TABLE     �   CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 /   DROP TABLE public.users_user_user_permissions;
       public         heap    postgres    false            �            1259    29189 "   users_user_user_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.users_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            u          0    29134 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    221   b�       w          0    29142    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    223   �       s          0    29128    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    219   ��                 0    29243    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    231   7�       q          0    29120    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    217   T�       o          0    29112    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    215   �       �          0    29263    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    232   �       �          0    29273     token_blacklist_blacklistedtoken 
   TABLE DATA           X   COPY public.token_blacklist_blacklistedtoken (id, blacklisted_at, token_id) FROM stdin;
    public          postgres    false    234   /�       �          0    29279     token_blacklist_outstandingtoken 
   TABLE DATA           k   COPY public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) FROM stdin;
    public          postgres    false    236   L�       y          0    29174 
   users_user 
   TABLE DATA           �   COPY public.users_user (id, last_login, is_superuser, email, first_name, last_name, phone_number, password, is_active, is_staff, jwt_token) FROM stdin;
    public          postgres    false    225   i�       {          0    29184    users_user_groups 
   TABLE DATA           B   COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    227   ��       }          0    29190    users_user_user_permissions 
   TABLE DATA           Q   COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    229   ��       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    220            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    222            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);
          public          postgres    false    218            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 111, true);
          public          postgres    false    230            �           0    0    django_content_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);
          public          postgres    false    216            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 37, true);
          public          postgres    false    214            �           0    0 '   token_blacklist_blacklistedtoken_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_id_seq', 1, true);
          public          postgres    false    233            �           0    0 '   token_blacklist_outstandingtoken_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_id_seq', 91, true);
          public          postgres    false    235            �           0    0    users_user_groups_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);
          public          postgres    false    226            �           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);
          public          postgres    false    224            �           0    0 "   users_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, true);
          public          postgres    false    228            �           2606    29171    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    221            �           2606    29157 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    223    223            �           2606    29146 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    223            �           2606    29138    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    221            �           2606    29148 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    219    219            �           2606    29132 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    219            �           2606    29250 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    231            �           2606    29126 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    217    217            �           2606    29124 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    217            �           2606    29118 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    215            �           2606    29269 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    232            �           2606    29311 F   token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.token_blacklist_blacklistedtoken DROP CONSTRAINT token_blacklist_blacklistedtoken_pkey;
       public            postgres    false    234            �           2606    29332 N   token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_key UNIQUE (token_id);
 x   ALTER TABLE ONLY public.token_blacklist_blacklistedtoken DROP CONSTRAINT token_blacklist_blacklistedtoken_token_id_key;
       public            postgres    false    234            �           2606    29302 W   token_blacklist_outstandingtoken token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq UNIQUE (jti);
 �   ALTER TABLE ONLY public.token_blacklist_outstandingtoken DROP CONSTRAINT token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq;
       public            postgres    false    236            �           2606    29320 F   token_blacklist_outstandingtoken token_blacklist_outstandingtoken_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.token_blacklist_outstandingtoken DROP CONSTRAINT token_blacklist_outstandingtoken_pkey;
       public            postgres    false    236            �           2606    29182    users_user users_user_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_email_key;
       public            postgres    false    225            �           2606    29188 (   users_user_groups users_user_groups_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_pkey;
       public            postgres    false    227            �           2606    29205 B   users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);
 l   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq;
       public            postgres    false    227    227            �           2606    29180    users_user users_user_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_pkey;
       public            postgres    false    225            �           2606    29194 <   users_user_user_permissions users_user_user_permissions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_pkey;
       public            postgres    false    229            �           2606    29219 [   users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq;
       public            postgres    false    229    229            �           1259    29172    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    221            �           1259    29168 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    223            �           1259    29169 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    223            �           1259    29154 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    219            �           1259    29261 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    231            �           1259    29262 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    231            �           1259    29271 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    232            �           1259    29270 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    232            �           1259    29303 6   token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like    INDEX     �   CREATE INDEX token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like ON public.token_blacklist_outstandingtoken USING btree (jti varchar_pattern_ops);
 J   DROP INDEX public.token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like;
       public            postgres    false    236            �           1259    29300 1   token_blacklist_outstandingtoken_user_id_83bc629a    INDEX     �   CREATE INDEX token_blacklist_outstandingtoken_user_id_83bc629a ON public.token_blacklist_outstandingtoken USING btree (user_id);
 E   DROP INDEX public.token_blacklist_outstandingtoken_user_id_83bc629a;
       public            postgres    false    236            �           1259    29203    users_user_email_243f6e77_like    INDEX     j   CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);
 2   DROP INDEX public.users_user_email_243f6e77_like;
       public            postgres    false    225            �           1259    29217 #   users_user_groups_group_id_9afc8d0e    INDEX     e   CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);
 7   DROP INDEX public.users_user_groups_group_id_9afc8d0e;
       public            postgres    false    227            �           1259    29216 "   users_user_groups_user_id_5f6f5a90    INDEX     c   CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);
 6   DROP INDEX public.users_user_groups_user_id_5f6f5a90;
       public            postgres    false    227            �           1259    29231 2   users_user_user_permissions_permission_id_0b93982e    INDEX     �   CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);
 F   DROP INDEX public.users_user_user_permissions_permission_id_0b93982e;
       public            postgres    false    229            �           1259    29230 ,   users_user_user_permissions_user_id_20aca447    INDEX     w   CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);
 @   DROP INDEX public.users_user_user_permissions_user_id_20aca447;
       public            postgres    false    229            �           2606    29163 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    223    219    3238            �           2606    29158 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    223    3243    221            �           2606    29149 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    217    3233    219            �           2606    29251 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3233    231    217            �           2606    29256 C   django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id;
       public          postgres    false    225    231    3254            �           2606    29338 V   token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk FOREIGN KEY (token_id) REFERENCES public.token_blacklist_outstandingtoken(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.token_blacklist_blacklistedtoken DROP CONSTRAINT token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk;
       public          postgres    false    3283    234    236            �           2606    29304 S   token_blacklist_outstandingtoken token_blacklist_outs_user_id_83bc629a_fk_users_use    FK CONSTRAINT     �   ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outs_user_id_83bc629a_fk_users_use FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.token_blacklist_outstandingtoken DROP CONSTRAINT token_blacklist_outs_user_id_83bc629a_fk_users_use;
       public          postgres    false    3254    225    236            �           2606    29211 F   users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id;
       public          postgres    false    3243    227    221            �           2606    29206 E   users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id;
       public          postgres    false    227    225    3254            �           2606    29225 T   users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm;
       public          postgres    false    3238    219    229            �           2606    29220 Y   users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id;
       public          postgres    false    225    3254    229            u      x������ � �      w      x������ � �      s   �  x�m�Mn�0F��)8AC~�=Cw�*
A�vN�ܾd<xf0;{�>鍥Ϩ��u���
���TF����W]�\k�YA����l�`��{:$���i�S%��@�� ю�'�'Xd�	���$�n􏻪@�����^�� ��HI* �\%�ƻ0�]�w�� ���D�=�Y�h%�w[�(�#��h��)YO6����͙���	�pG�Po���V	1��{����O��E�7����ƺ�؊�n�]�J�y��g+K�)j��)Ԯ�]��l���ڊ�vyR4m+���Iֻ�l������z�G]��+zG@4ԋ �>�E|��]���c��C�. A�ȋ�4[�D��S��yvX%>ߴ���4            x������ � �      q   �   x�e�K
�0D��a
��w)���#K^��N[
��y��Đ%[]� ����T�0�&ViO��mEm)��Ϡ��1x���9d秜���(�	��4Ss��AS����0����]��c��/��I;      o      x���{n�8��NO�4I=}�M����#k;3�~%ٱ�VF�X 1���Ǐ�aw��ѷ��q�Î16�a��!C����TE������'�f���M�����Mwl����dDB��]Ʒ��#
�ق/h]=�ޞ}߄a]�w��{��oO�"��f�PbAь�����.1S�Bᷔt��t�q�@h	�jA�[D����)��.�Fb8��~�"c5���~)G��M)�`�*1��P�#�]�n���������z��ap'��`$�G��.��^����e,$�-C�$PZ�(���ͨS�]�b)�1�r��S�����?n丑�If)âe�ۨ^C�hX�Ee��%���8�9�Q��&��uM�Zm0�3ʫ����K:)C� 6A�
���cj��ڝ�����B�#7�������8��n�~������W��5	�dk(Y��.�0��b����c�o���CSVK8���o��TD�i�AT�o�(�"H�1ӌ�%���g�(��bCQʯ���g�>N�@�+cwAFi5��J m�p�S;G܏pJ���벦'�s3�.��y���(�S-M���w}�'������e�3I�JR_FηR�9R&*F��	�i�����<�~����BZ����r��+��y�<�xY�n�t}��6]�� +�+�=�8�� Z�����XDW�J��������%+�5 ���]�OlQq�������d�_���i���h*��(&9a�Q`�����W��%��I�]�f#���x�s��}lm!��ퟞ��F�	F      �   	  x���rC@ ��x��@2�]�p��F��Θ`�����ӷ���Q�2D�X��" :�d]&���X1��>-o�Ѓ�7S%��bm��k��7�s�~�?��K�X�6'��Sb���τ�y���ߧ�Jː�^q���)d�%5S��!��l��rj�§����~ɚ[8�M�����}:�s��-��	���=u�k^�@�Y������2���1�h�n6	��I��֖ꖏv�d�,eu	��@``mE��#���J��?9c]J      �      x������ � �      �      x������ � �      y      x������ � �      {      x������ � �      }      x������ � �     