PGDMP         !                t            CreatureCreator    9.3.13    9.3.13 S                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            !           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            "           1262    18386    CreatureCreator    DATABASE     �   CREATE DATABASE "CreatureCreator" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
 !   DROP DATABASE "CreatureCreator";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            #           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            $           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        2615    18387    tes_d20    SCHEMA        CREATE SCHEMA tes_d20;
    DROP SCHEMA tes_d20;
             postgres    false                        3079    11789    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            %           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    18398    atributo    TABLE     |   CREATE TABLE atributo (
    id bigint NOT NULL,
    magicka_id bigint[],
    health_id bigint[],
    stamina_id bigint[]
);
    DROP TABLE tes_d20.atributo;
       tes_d20         postgres    false    8            �            1259    18396    atributos_id_seq    SEQUENCE     r   CREATE SEQUENCE atributos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE tes_d20.atributos_id_seq;
       tes_d20       postgres    false    175    8            &           0    0    atributos_id_seq    SEQUENCE OWNED BY     6   ALTER SEQUENCE atributos_id_seq OWNED BY atributo.id;
            tes_d20       postgres    false    174            �            1259    18408    health    TABLE     k   CREATE TABLE health (
    id bigint NOT NULL,
    inicial integer,
    total integer,
    level integer
);
    DROP TABLE tes_d20.health;
       tes_d20         postgres    false    8            �            1259    18445    health_id_seq    SEQUENCE     o   CREATE SEQUENCE health_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE tes_d20.health_id_seq;
       tes_d20       postgres    false    8    177            '           0    0    health_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE health_id_seq OWNED BY health.id;
            tes_d20       postgres    false    184            �            1259    18441    intelligence    TABLE     G   CREATE TABLE intelligence (
    id bigint NOT NULL,
    type "char"
);
 !   DROP TABLE tes_d20.intelligence;
       tes_d20         postgres    false    8            �            1259    18439    intelligence_id_seq    SEQUENCE     u   CREATE SEQUENCE intelligence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE tes_d20.intelligence_id_seq;
       tes_d20       postgres    false    183    8            (           0    0    intelligence_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE intelligence_id_seq OWNED BY intelligence.id;
            tes_d20       postgres    false    182            �            1259    18405    magicka    TABLE     l   CREATE TABLE magicka (
    id bigint NOT NULL,
    inicial integer,
    total integer,
    level integer
);
    DROP TABLE tes_d20.magicka;
       tes_d20         postgres    false    8            �            1259    18451    magicka_id_seq    SEQUENCE     p   CREATE SEQUENCE magicka_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE tes_d20.magicka_id_seq;
       tes_d20       postgres    false    8    176            )           0    0    magicka_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE magicka_id_seq OWNED BY magicka.id;
            tes_d20       postgres    false    185            �            1259    18390    npc    TABLE       CREATE TABLE npc (
    id bigint NOT NULL,
    atributo_id bigint,
    speed integer,
    level integer,
    intelligence_id bigint,
    role_id bigint,
    dodge integer,
    resistances_id integer,
    damage_reduction integer,
    race_id bigint,
    treino_id bigint
);
    DROP TABLE tes_d20.npc;
       tes_d20         postgres    false    8            �            1259    18417    npc_atributo_seq    SEQUENCE     r   CREATE SEQUENCE npc_atributo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE tes_d20.npc_atributo_seq;
       tes_d20       postgres    false    8    173            *           0    0    npc_atributo_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE npc_atributo_seq OWNED BY npc.atributo_id;
            tes_d20       postgres    false    180            �            1259    18388 
   npc_id_seq    SEQUENCE     l   CREATE SEQUENCE npc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE tes_d20.npc_id_seq;
       tes_d20       postgres    false    8    173            +           0    0 
   npc_id_seq    SEQUENCE OWNED BY     +   ALTER SEQUENCE npc_id_seq OWNED BY npc.id;
            tes_d20       postgres    false    172            �            1259    18414    race    TABLE     h   CREATE TABLE race (
    id bigint NOT NULL,
    nome "char",
    type "char",
    base_speed integer
);
    DROP TABLE tes_d20.race;
       tes_d20         postgres    false    8            �            1259    18433    race_id_seq    SEQUENCE     m   CREATE SEQUENCE race_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE tes_d20.race_id_seq;
       tes_d20       postgres    false    179    8            ,           0    0    race_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE race_id_seq OWNED BY race.id;
            tes_d20       postgres    false    181            �            1259    18484    resistances    TABLE     �   CREATE TABLE resistances (
    id integer NOT NULL,
    poison_resistance integer,
    disease_resistance integer,
    fire_resistance integer,
    magic_resistance integer,
    frost_resistance integer
);
     DROP TABLE tes_d20.resistances;
       tes_d20         postgres    false    8            �            1259    18478    role    TABLE     ?   CREATE TABLE role (
    id bigint NOT NULL,
    nome "char"
);
    DROP TABLE tes_d20.role;
       tes_d20         postgres    false    8            �            1259    18476    role_id_seq    SEQUENCE     m   CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE tes_d20.role_id_seq;
       tes_d20       postgres    false    190    8            -           0    0    role_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE role_id_seq OWNED BY role.id;
            tes_d20       postgres    false    189            �            1259    18411    stamina    TABLE     l   CREATE TABLE stamina (
    id bigint NOT NULL,
    inicial integer,
    level integer,
    total integer
);
    DROP TABLE tes_d20.stamina;
       tes_d20         postgres    false    8            �            1259    18459    stamina_id_seq    SEQUENCE     p   CREATE SEQUENCE stamina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE tes_d20.stamina_id_seq;
       tes_d20       postgres    false    178    8            .           0    0    stamina_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE stamina_id_seq OWNED BY stamina.id;
            tes_d20       postgres    false    186            �            1259    18470    treino    TABLE     A   CREATE TABLE treino (
    id bigint NOT NULL,
    type "char"
);
    DROP TABLE tes_d20.treino;
       tes_d20         postgres    false    8            �            1259    18468    treino_id_seq    SEQUENCE     o   CREATE SEQUENCE treino_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE tes_d20.treino_id_seq;
       tes_d20       postgres    false    188    8            /           0    0    treino_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE treino_id_seq OWNED BY treino.id;
            tes_d20       postgres    false    187                       2604    18401    id    DEFAULT     ]   ALTER TABLE ONLY atributo ALTER COLUMN id SET DEFAULT nextval('atributos_id_seq'::regclass);
 ;   ALTER TABLE tes_d20.atributo ALTER COLUMN id DROP DEFAULT;
       tes_d20       postgres    false    174    175    175            �           2604    18447    id    DEFAULT     X   ALTER TABLE ONLY health ALTER COLUMN id SET DEFAULT nextval('health_id_seq'::regclass);
 9   ALTER TABLE tes_d20.health ALTER COLUMN id DROP DEFAULT;
       tes_d20       postgres    false    184    177            �           2604    18444    id    DEFAULT     d   ALTER TABLE ONLY intelligence ALTER COLUMN id SET DEFAULT nextval('intelligence_id_seq'::regclass);
 ?   ALTER TABLE tes_d20.intelligence ALTER COLUMN id DROP DEFAULT;
       tes_d20       postgres    false    183    182    183            �           2604    18453    id    DEFAULT     Z   ALTER TABLE ONLY magicka ALTER COLUMN id SET DEFAULT nextval('magicka_id_seq'::regclass);
 :   ALTER TABLE tes_d20.magicka ALTER COLUMN id DROP DEFAULT;
       tes_d20       postgres    false    185    176            ~           2604    18393    id    DEFAULT     R   ALTER TABLE ONLY npc ALTER COLUMN id SET DEFAULT nextval('npc_id_seq'::regclass);
 6   ALTER TABLE tes_d20.npc ALTER COLUMN id DROP DEFAULT;
       tes_d20       postgres    false    172    173    173            �           2604    18435    id    DEFAULT     T   ALTER TABLE ONLY race ALTER COLUMN id SET DEFAULT nextval('race_id_seq'::regclass);
 7   ALTER TABLE tes_d20.race ALTER COLUMN id DROP DEFAULT;
       tes_d20       postgres    false    181    179            �           2604    18481    id    DEFAULT     T   ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);
 7   ALTER TABLE tes_d20.role ALTER COLUMN id DROP DEFAULT;
       tes_d20       postgres    false    189    190    190            �           2604    18461    id    DEFAULT     Z   ALTER TABLE ONLY stamina ALTER COLUMN id SET DEFAULT nextval('stamina_id_seq'::regclass);
 :   ALTER TABLE tes_d20.stamina ALTER COLUMN id DROP DEFAULT;
       tes_d20       postgres    false    186    178            �           2604    18473    id    DEFAULT     X   ALTER TABLE ONLY treino ALTER COLUMN id SET DEFAULT nextval('treino_id_seq'::regclass);
 9   ALTER TABLE tes_d20.treino ALTER COLUMN id DROP DEFAULT;
       tes_d20       postgres    false    187    188    188                      0    18398    atributo 
   TABLE DATA               B   COPY atributo (id, magicka_id, health_id, stamina_id) FROM stdin;
    tes_d20       postgres    false    175   `P       0           0    0    atributos_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('atributos_id_seq', 1, false);
            tes_d20       postgres    false    174                      0    18408    health 
   TABLE DATA               4   COPY health (id, inicial, total, level) FROM stdin;
    tes_d20       postgres    false    177   }P       1           0    0    health_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('health_id_seq', 1, false);
            tes_d20       postgres    false    184                      0    18441    intelligence 
   TABLE DATA               )   COPY intelligence (id, type) FROM stdin;
    tes_d20       postgres    false    183   �P       2           0    0    intelligence_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('intelligence_id_seq', 1, false);
            tes_d20       postgres    false    182                      0    18405    magicka 
   TABLE DATA               5   COPY magicka (id, inicial, total, level) FROM stdin;
    tes_d20       postgres    false    176   �P       3           0    0    magicka_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('magicka_id_seq', 1, false);
            tes_d20       postgres    false    185                      0    18390    npc 
   TABLE DATA               �   COPY npc (id, atributo_id, speed, level, intelligence_id, role_id, dodge, resistances_id, damage_reduction, race_id, treino_id) FROM stdin;
    tes_d20       postgres    false    173   �P       4           0    0    npc_atributo_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('npc_atributo_seq', 1, false);
            tes_d20       postgres    false    180            5           0    0 
   npc_id_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('npc_id_seq', 1, false);
            tes_d20       postgres    false    172                      0    18414    race 
   TABLE DATA               3   COPY race (id, nome, type, base_speed) FROM stdin;
    tes_d20       postgres    false    179   �P       6           0    0    race_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('race_id_seq', 1, false);
            tes_d20       postgres    false    181                      0    18484    resistances 
   TABLE DATA               ~   COPY resistances (id, poison_resistance, disease_resistance, fire_resistance, magic_resistance, frost_resistance) FROM stdin;
    tes_d20       postgres    false    191   Q                 0    18478    role 
   TABLE DATA               !   COPY role (id, nome) FROM stdin;
    tes_d20       postgres    false    190   +Q       7           0    0    role_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('role_id_seq', 1, false);
            tes_d20       postgres    false    189                      0    18411    stamina 
   TABLE DATA               5   COPY stamina (id, inicial, level, total) FROM stdin;
    tes_d20       postgres    false    178   HQ       8           0    0    stamina_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('stamina_id_seq', 1, false);
            tes_d20       postgres    false    186                      0    18470    treino 
   TABLE DATA               #   COPY treino (id, type) FROM stdin;
    tes_d20       postgres    false    188   eQ       9           0    0    treino_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('treino_id_seq', 1, false);
            tes_d20       postgres    false    187            �           2606    18490    atributo-pk 
   CONSTRAINT     M   ALTER TABLE ONLY atributo
    ADD CONSTRAINT "atributo-pk" PRIMARY KEY (id);
 A   ALTER TABLE ONLY tes_d20.atributo DROP CONSTRAINT "atributo-pk";
       tes_d20         postgres    false    175    175            �           2606    18502    intelligence_id 
   CONSTRAINT     S   ALTER TABLE ONLY intelligence
    ADD CONSTRAINT intelligence_id PRIMARY KEY (id);
 G   ALTER TABLE ONLY tes_d20.intelligence DROP CONSTRAINT intelligence_id;
       tes_d20         postgres    false    183    183            �           2606    18458 
   magicka_pk 
   CONSTRAINT     I   ALTER TABLE ONLY magicka
    ADD CONSTRAINT magicka_pk PRIMARY KEY (id);
 =   ALTER TABLE ONLY tes_d20.magicka DROP CONSTRAINT magicka_pk;
       tes_d20         postgres    false    176    176            �           2606    18395    pk 
   CONSTRAINT     =   ALTER TABLE ONLY npc
    ADD CONSTRAINT pk PRIMARY KEY (id);
 1   ALTER TABLE ONLY tes_d20.npc DROP CONSTRAINT pk;
       tes_d20         postgres    false    173    173            �           2606    18514    race_pk 
   CONSTRAINT     C   ALTER TABLE ONLY race
    ADD CONSTRAINT race_pk PRIMARY KEY (id);
 7   ALTER TABLE ONLY tes_d20.race DROP CONSTRAINT race_pk;
       tes_d20         postgres    false    179    179            �           2606    18488    resistance-pk 
   CONSTRAINT     R   ALTER TABLE ONLY resistances
    ADD CONSTRAINT "resistance-pk" PRIMARY KEY (id);
 F   ALTER TABLE ONLY tes_d20.resistances DROP CONSTRAINT "resistance-pk";
       tes_d20         postgres    false    191    191            �           2606    18483    role_id 
   CONSTRAINT     C   ALTER TABLE ONLY role
    ADD CONSTRAINT role_id PRIMARY KEY (id);
 7   ALTER TABLE ONLY tes_d20.role DROP CONSTRAINT role_id;
       tes_d20         postgres    false    190    190            �           2606    18466 
   stamina_pk 
   CONSTRAINT     I   ALTER TABLE ONLY stamina
    ADD CONSTRAINT stamina_pk PRIMARY KEY (id);
 =   ALTER TABLE ONLY tes_d20.stamina DROP CONSTRAINT stamina_pk;
       tes_d20         postgres    false    178    178            �           2606    18475 	   treino_id 
   CONSTRAINT     G   ALTER TABLE ONLY treino
    ADD CONSTRAINT treino_id PRIMARY KEY (id);
 ;   ALTER TABLE ONLY tes_d20.treino DROP CONSTRAINT treino_id;
       tes_d20         postgres    false    188    188            �           2606    18491    atributo_id    FK CONSTRAINT     g   ALTER TABLE ONLY npc
    ADD CONSTRAINT atributo_id FOREIGN KEY (atributo_id) REFERENCES atributo(id);
 :   ALTER TABLE ONLY tes_d20.npc DROP CONSTRAINT atributo_id;
       tes_d20       postgres    false    173    175    1930            �           2606    18535    intelligence_id    FK CONSTRAINT     s   ALTER TABLE ONLY npc
    ADD CONSTRAINT intelligence_id FOREIGN KEY (intelligence_id) REFERENCES intelligence(id);
 >   ALTER TABLE ONLY tes_d20.npc DROP CONSTRAINT intelligence_id;
       tes_d20       postgres    false    173    183    1938            �           2606    18540    race_id    FK CONSTRAINT     [   ALTER TABLE ONLY npc
    ADD CONSTRAINT race_id FOREIGN KEY (race_id) REFERENCES race(id);
 6   ALTER TABLE ONLY tes_d20.npc DROP CONSTRAINT race_id;
       tes_d20       postgres    false    173    179    1936            �           2606    18545    resistance_id    FK CONSTRAINT     o   ALTER TABLE ONLY npc
    ADD CONSTRAINT resistance_id FOREIGN KEY (resistances_id) REFERENCES resistances(id);
 <   ALTER TABLE ONLY tes_d20.npc DROP CONSTRAINT resistance_id;
       tes_d20       postgres    false    173    1944    191            �           2606    18530    role_id    FK CONSTRAINT     [   ALTER TABLE ONLY npc
    ADD CONSTRAINT role_id FOREIGN KEY (role_id) REFERENCES role(id);
 6   ALTER TABLE ONLY tes_d20.npc DROP CONSTRAINT role_id;
       tes_d20       postgres    false    173    190    1942            �           2606    18550 	   treino_id    FK CONSTRAINT     a   ALTER TABLE ONLY npc
    ADD CONSTRAINT treino_id FOREIGN KEY (treino_id) REFERENCES treino(id);
 8   ALTER TABLE ONLY tes_d20.npc DROP CONSTRAINT treino_id;
       tes_d20       postgres    false    173    188    1940                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     