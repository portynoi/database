PGDMP      )        
    	    |           postgres    17.0    17.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Ukrainian_Ukraine.1251';
    DROP DATABASE postgres;
                     postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    4835            �            1259    24623    order    TABLE     �   CREATE TABLE public."order" (
    order_id integer NOT NULL,
    supplier_id integer NOT NULL,
    sparepart_id integer NOT NULL,
    warehouse_id integer NOT NULL
);
    DROP TABLE public."order";
       public         heap r       postgres    false            �            1259    24576 	   sparepart    TABLE     �   CREATE TABLE public.sparepart (
    sparepart_id integer NOT NULL,
    sparepart_info character varying(50),
    sparepart_name character varying(20) NOT NULL
);
    DROP TABLE public.sparepart;
       public         heap r       postgres    false            �            1259    24603    supplier    TABLE     �   CREATE TABLE public.supplier (
    supplier_id integer NOT NULL,
    available_quantity integer NOT NULL,
    phone_supplier integer,
    supplier_name character varying(25) NOT NULL
);
    DROP TABLE public.supplier;
       public         heap r       postgres    false            �            1259    24608    supplier_sparepart    TABLE     �   CREATE TABLE public.supplier_sparepart (
    sparepart_id integer NOT NULL,
    supplier_id integer NOT NULL,
    sups_id integer NOT NULL,
    "when" timestamp with time zone NOT NULL
);
 &   DROP TABLE public.supplier_sparepart;
       public         heap r       postgres    false            �            1259    24581 	   warehouse    TABLE     �   CREATE TABLE public.warehouse (
    warehouse_id integer NOT NULL,
    warehouse_phone integer,
    available_spareparts integer NOT NULL
);
    DROP TABLE public.warehouse;
       public         heap r       postgres    false            �            1259    24586    warehouse_sparepart    TABLE     �   CREATE TABLE public.warehouse_sparepart (
    sparepart_id integer NOT NULL,
    warehouse_id integer NOT NULL,
    "how long?" daterange NOT NULL,
    wars_id integer NOT NULL
);
 '   DROP TABLE public.warehouse_sparepart;
       public         heap r       postgres    false            �          0    24623    order 
   TABLE DATA           T   COPY public."order" (order_id, supplier_id, sparepart_id, warehouse_id) FROM stdin;
    public               postgres    false    222   $       �          0    24576 	   sparepart 
   TABLE DATA           Q   COPY public.sparepart (sparepart_id, sparepart_info, sparepart_name) FROM stdin;
    public               postgres    false    217   0$       �          0    24603    supplier 
   TABLE DATA           b   COPY public.supplier (supplier_id, available_quantity, phone_supplier, supplier_name) FROM stdin;
    public               postgres    false    220   _$       �          0    24608    supplier_sparepart 
   TABLE DATA           X   COPY public.supplier_sparepart (sparepart_id, supplier_id, sups_id, "when") FROM stdin;
    public               postgres    false    221   �$       �          0    24581 	   warehouse 
   TABLE DATA           X   COPY public.warehouse (warehouse_id, warehouse_phone, available_spareparts) FROM stdin;
    public               postgres    false    218   �$       �          0    24586    warehouse_sparepart 
   TABLE DATA           _   COPY public.warehouse_sparepart (sparepart_id, warehouse_id, "how long?", wars_id) FROM stdin;
    public               postgres    false    219   �$       ?           2606    24627    order order_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public                 postgres    false    222            5           2606    24580    sparepart sparepart_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.sparepart
    ADD CONSTRAINT sparepart_pkey PRIMARY KEY (sparepart_id);
 B   ALTER TABLE ONLY public.sparepart DROP CONSTRAINT sparepart_pkey;
       public                 postgres    false    217            ;           2606    24607    supplier supplier_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public                 postgres    false    220            =           2606    24612 *   supplier_sparepart supplier_sparepart_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.supplier_sparepart
    ADD CONSTRAINT supplier_sparepart_pkey PRIMARY KEY (sups_id);
 T   ALTER TABLE ONLY public.supplier_sparepart DROP CONSTRAINT supplier_sparepart_pkey;
       public                 postgres    false    221            7           2606    24585    warehouse warehouse_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (warehouse_id);
 B   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT warehouse_pkey;
       public                 postgres    false    218            9           2606    24592 ,   warehouse_sparepart warehouse_sparepart_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.warehouse_sparepart
    ADD CONSTRAINT warehouse_sparepart_pkey PRIMARY KEY (wars_id);
 V   ALTER TABLE ONLY public.warehouse_sparepart DROP CONSTRAINT warehouse_sparepart_pkey;
       public                 postgres    false    219            D           2606    24633 	   order s2o    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT s2o FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id) NOT VALID;
 5   ALTER TABLE ONLY public."order" DROP CONSTRAINT s2o;
       public               postgres    false    222    220    4667            B           2606    24618    supplier_sparepart s2sup    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_sparepart
    ADD CONSTRAINT s2sup FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);
 B   ALTER TABLE ONLY public.supplier_sparepart DROP CONSTRAINT s2sup;
       public               postgres    false    220    221    4667            @           2606    24598    warehouse_sparepart s2w    FK CONSTRAINT     �   ALTER TABLE ONLY public.warehouse_sparepart
    ADD CONSTRAINT s2w FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id) NOT VALID;
 A   ALTER TABLE ONLY public.warehouse_sparepart DROP CONSTRAINT s2w;
       public               postgres    false    218    4663    219            E           2606    24638 
   order sp2o    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT sp2o FOREIGN KEY (sparepart_id) REFERENCES public.sparepart(sparepart_id) NOT VALID;
 6   ALTER TABLE ONLY public."order" DROP CONSTRAINT sp2o;
       public               postgres    false    217    222    4661            C           2606    24613    supplier_sparepart sup2s    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier_sparepart
    ADD CONSTRAINT sup2s FOREIGN KEY (sparepart_id) REFERENCES public.sparepart(sparepart_id);
 B   ALTER TABLE ONLY public.supplier_sparepart DROP CONSTRAINT sup2s;
       public               postgres    false    217    221    4661            F           2606    24628 	   order w2o    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT w2o FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id) NOT VALID;
 5   ALTER TABLE ONLY public."order" DROP CONSTRAINT w2o;
       public               postgres    false    218    4663    222            A           2606    24593    warehouse_sparepart w2s    FK CONSTRAINT     �   ALTER TABLE ONLY public.warehouse_sparepart
    ADD CONSTRAINT w2s FOREIGN KEY (sparepart_id) REFERENCES public.sparepart(sparepart_id) NOT VALID;
 A   ALTER TABLE ONLY public.warehouse_sparepart DROP CONSTRAINT w2s;
       public               postgres    false    217    4661    219            �      x�32ᴰ�4207�4����� ��      �      x�3207���tK���/-������� H��      �   !   x����46�43�t�K�I,K������� JT�      �   /   x�3207細�43�4202�5��5�T04�25�20�60����� ���      �      x�3�4�4����� }�      �   (   x�3207�4�6202�50" ����44����� ���     