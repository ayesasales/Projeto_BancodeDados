PGDMP                      |            postgres    17.0    17.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE postgres;
                     postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    4883                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16389    cliente    TABLE       CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nome_cliente character varying(100),
    email_cliente character varying(100),
    endereco_cliente character varying(100),
    telefone_cliente character varying(20),
    cpf_cliente character(14)
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false    4            �            1259    16402 
   fornecedor    TABLE       CREATE TABLE public.fornecedor (
    id_fornecedor integer NOT NULL,
    nome_fornecedor character varying(100),
    endereco_fornecedor character varying(100),
    telefone_fornecedor character varying(20),
    empresa_fornecedor character varying(100)
);
    DROP TABLE public.fornecedor;
       public         heap r       postgres    false    4            �            1259    16426 
   item_venda    TABLE     �   CREATE TABLE public.item_venda (
    id_item integer NOT NULL,
    venda_id integer,
    produto_id integer,
    quantidade_item integer,
    preco_item character varying(20)
);
    DROP TABLE public.item_venda;
       public         heap r       postgres    false    4            �            1259    16414 	   pagamento    TABLE     �   CREATE TABLE public.pagamento (
    id_pagamento integer NOT NULL,
    venda_id integer,
    forma_pagamento character varying(100),
    valor_pago character varying(20),
    data_pagamento date
);
    DROP TABLE public.pagamento;
       public         heap r       postgres    false    4            �            1259    16395    produto    TABLE       CREATE TABLE public.produto (
    id_produto integer NOT NULL,
    nome_produto character varying(100),
    marca_produto character varying(100),
    tamanho_produto integer,
    cor_produto character varying(50),
    preco_produto character varying(20),
    estoque_produto integer
);
    DROP TABLE public.produto;
       public         heap r       postgres    false    4            �            1259    16407    venda    TABLE     �   CREATE TABLE public.venda (
    id_venda integer NOT NULL,
    data_venda date,
    id_cliente integer,
    total_venda character varying(20)
);
    DROP TABLE public.venda;
       public         heap r       postgres    false    4                      0    16389    cliente 
   TABLE DATA           {   COPY public.cliente (id_cliente, nome_cliente, email_cliente, endereco_cliente, telefone_cliente, cpf_cliente) FROM stdin;
    public               postgres    false    217   �       
          0    16402 
   fornecedor 
   TABLE DATA           �   COPY public.fornecedor (id_fornecedor, nome_fornecedor, endereco_fornecedor, telefone_fornecedor, empresa_fornecedor) FROM stdin;
    public               postgres    false    219   �                  0    16426 
   item_venda 
   TABLE DATA           `   COPY public.item_venda (id_item, venda_id, produto_id, quantidade_item, preco_item) FROM stdin;
    public               postgres    false    222   !                 0    16414 	   pagamento 
   TABLE DATA           h   COPY public.pagamento (id_pagamento, venda_id, forma_pagamento, valor_pago, data_pagamento) FROM stdin;
    public               postgres    false    221   K!       	          0    16395    produto 
   TABLE DATA           �   COPY public.produto (id_produto, nome_produto, marca_produto, tamanho_produto, cor_produto, preco_produto, estoque_produto) FROM stdin;
    public               postgres    false    218   �!                 0    16407    venda 
   TABLE DATA           N   COPY public.venda (id_venda, data_venda, id_cliente, total_venda) FROM stdin;
    public               postgres    false    220   "       k           2606    16393    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    217            o           2606    16406    fornecedor fornecedor_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (id_fornecedor);
 D   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT fornecedor_pkey;
       public                 postgres    false    219            s           2606    16420    pagamento pagamento_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (id_pagamento);
 B   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT pagamento_pkey;
       public                 postgres    false    221            m           2606    16401    produto produto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id_produto);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public                 postgres    false    218            q           2606    16413    venda venda_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (id_venda);
 :   ALTER TABLE ONLY public.venda DROP CONSTRAINT venda_pkey;
       public                 postgres    false    220            u           2606    16436 %   item_venda item_venda_produto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT item_venda_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produto(id_produto);
 O   ALTER TABLE ONLY public.item_venda DROP CONSTRAINT item_venda_produto_id_fkey;
       public               postgres    false    218    4717    222            v           2606    16431 #   item_venda item_venda_venda_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT item_venda_venda_id_fkey FOREIGN KEY (venda_id) REFERENCES public.venda(id_venda);
 M   ALTER TABLE ONLY public.item_venda DROP CONSTRAINT item_venda_venda_id_fkey;
       public               postgres    false    220    222    4721            t           2606    16421 !   pagamento pagamento_venda_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_venda_id_fkey FOREIGN KEY (venda_id) REFERENCES public.venda(id_venda);
 K   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT pagamento_venda_id_fkey;
       public               postgres    false    221    4721    220               �   x�M�A
�0EדSd�І�dj���D�n�6�֔�
���p��}><m���H�F��@�c��c"U&h?��=�Z���a��8����9�u��pΩLYUB#\�p�$�L��m�ů+�y���R~;BQc�#b�`�`�U�T�+!���5      
   v   x���
AD��+R��	nػ��VP� �ঈr�d���9�<�7��G�tSWs�
}�րFU�)��)%
�%�<���j/� 8����X��U:1��&��B��4�8U��D��y$         -   x�3111�41bNCNc.S���)P�"���� ��Y         P   x�3656�415�LN,*9�8_!%U!���ʔ̒|NN##c]CC]#S.cSc3�rS΂�
Nc��	Xژ+F��� ���      	   X   x�31����NUp�,38�M9����9�T��t8M�LM9S2S��s��Ncs�b���\��Ģ��\�>�>c�=... i7�         2   x�315�4202�54�52�46�460�10�215CH�r�r�@$b���� �	     