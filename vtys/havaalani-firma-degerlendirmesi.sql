PGDMP         %    	            {            havaalani_firma_degerlendirmesi    14.5    14.5 F    \           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ]           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ^           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            _           1262    24586    havaalani_firma_degerlendirmesi    DATABASE     |   CREATE DATABASE havaalani_firma_degerlendirmesi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
 /   DROP DATABASE havaalani_firma_degerlendirmesi;
                postgres    false            �            1255    24753    bilet_sayisi()    FUNCTION     �   CREATE FUNCTION public.bilet_sayisi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
Begin
Update "kampanya" set bilet_sayisi= bilet_sayisi+20;
Return new;
End;
$$;
 %   DROP FUNCTION public.bilet_sayisi();
       public          postgres    false            �            1255    24786 "   get_ulasim_count(integer, integer)    FUNCTION     6  CREATE FUNCTION public.get_ulasim_count(otobus_from integer, otobus_to integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
   ulasim_count integer;
begin
   select count(*) 
   into ulasim_count
   from ulasim
   where length between otobus_from and otobus_to;
   
   return ulasim_count;
end;
$$;
 O   DROP FUNCTION public.get_ulasim_count(otobus_from integer, otobus_to integer);
       public          postgres    false            �            1255    24792    yolcubilgisi(character varying)    FUNCTION     A  CREATE FUNCTION public.yolcubilgisi(prmt character varying) RETURNS TABLE("yolcu_adisütun" character varying, "tcsütun" bigint, "emailsütun" character varying)
    LANGUAGE plpgsql
    AS $$
begin
	
	RETURN QUERY
	select 
		yolcu_adi,
		tc_kimlik_numarasi,
		email
from  
	yolcu
where 
	yolcu_adi like prmt;

end;
$$;
 ;   DROP FUNCTION public.yolcubilgisi(prmt character varying);
       public          postgres    false            �            1259    24736    anket_yapar_ozellik    TABLE     �   CREATE TABLE public.anket_yapar_ozellik (
    tarih date NOT NULL,
    guvenlik character varying(30) NOT NULL,
    soru_sayisi integer NOT NULL,
    firma integer NOT NULL,
    memnuniyet integer NOT NULL
);
 '   DROP TABLE public.anket_yapar_ozellik;
       public         heap    postgres    false            �            1259    24709    calisir    TABLE     �   CREATE TABLE public.calisir (
    baslama_tarihi date NOT NULL,
    calisma_saati integer NOT NULL,
    firma integer NOT NULL,
    personel bigint NOT NULL
);
    DROP TABLE public.calisir;
       public         heap    postgres    false            �            1259    24610    firma    TABLE     �   CREATE TABLE public.firma (
    firma_id integer NOT NULL,
    firma_logosu character varying(25) NOT NULL,
    ucus_sayisi integer NOT NULL,
    anket_sonucu integer NOT NULL
);
    DROP TABLE public.firma;
       public         heap    postgres    false            �            1259    24595    sube    TABLE     �   CREATE TABLE public.sube (
    sube_adi character varying(30) NOT NULL,
    sube_id integer NOT NULL,
    yonetici_adi character varying(30) NOT NULL,
    konum character varying(50) NOT NULL,
    firma_subesi integer NOT NULL
);
    DROP TABLE public.sube;
       public         heap    postgres    false            �            1259    24793    firma_subeleri    VIEW     �   CREATE VIEW public.firma_subeleri AS
 SELECT sube.sube_id,
    sube.sube_adi,
    sube.konum,
    firma.firma_id,
    firma.firma_logosu
   FROM (public.sube
     JOIN public.firma ON ((sube.firma_subesi = firma.firma_id)))
  ORDER BY sube.sube_adi;
 !   DROP VIEW public.firma_subeleri;
       public          postgres    false    210    210    213    213    210    210            �            1259    24600    kampanya    TABLE     �   CREATE TABLE public.kampanya (
    yolcu character varying(30) NOT NULL,
    bilet_sayisi integer NOT NULL,
    firma_kampanya integer NOT NULL,
    baslangic_tarihi date NOT NULL,
    bitis_tarihi date NOT NULL
);
    DROP TABLE public.kampanya;
       public         heap    postgres    false            �            1259    24605 
   memnuniyet    TABLE     �   CREATE TABLE public.memnuniyet (
    memnuniyet_id integer NOT NULL,
    puan integer NOT NULL,
    katilim integer NOT NULL,
    firma_memnuniyet integer NOT NULL,
    firma_anket integer NOT NULL
);
    DROP TABLE public.memnuniyet;
       public         heap    postgres    false            �            1259    24640    pegasus    TABLE     �   CREATE TABLE public.pegasus (
    ucus_kodu integer NOT NULL,
    ucus_ayagi character varying(50) NOT NULL,
    sehir character varying(20) NOT NULL,
    yemek_servis_ucreti integer NOT NULL,
    firma_isim integer NOT NULL
);
    DROP TABLE public.pegasus;
       public         heap    postgres    false            �            1259    24587    personel    TABLE       CREATE TABLE public.personel (
    "tc_kimlik _numarasi" bigint NOT NULL,
    personel_adi character varying(40) NOT NULL,
    telefon_numarasi bigint NOT NULL,
    adres_bilgisi character varying(60) NOT NULL,
    gorev character varying(50) NOT NULL,
    maas integer NOT NULL
);
    DROP TABLE public.personel;
       public         heap    postgres    false            �            1259    24635    thy    TABLE     �   CREATE TABLE public.thy (
    ucus_id integer NOT NULL,
    ucus_ayagi character varying(50) NOT NULL,
    ucak_kiralama integer NOT NULL,
    ulke character varying(30) NOT NULL,
    firma_isim2 integer NOT NULL
);
    DROP TABLE public.thy;
       public         heap    postgres    false            �            1259    24615    ucus_hizmeti    TABLE     �   CREATE TABLE public.ucus_hizmeti (
    ucus_hizmeti_id integer NOT NULL,
    temizlik integer NOT NULL,
    ucak_ici_ikram integer NOT NULL,
    konfor integer NOT NULL,
    iletisim integer NOT NULL,
    firma_ucus_hizmeti integer NOT NULL
);
     DROP TABLE public.ucus_hizmeti;
       public         heap    postgres    false            �            1259    24625    ulasim    TABLE     �   CREATE TABLE public.ulasim (
    ulasim_id integer NOT NULL,
    otobus integer NOT NULL,
    ozel_arac integer NOT NULL,
    firma_ulasim integer NOT NULL
);
    DROP TABLE public.ulasim;
       public         heap    postgres    false            �            1259    24620    yer_hizmeti    TABLE     �   CREATE TABLE public.yer_hizmeti (
    yer_hizmeti_id integer NOT NULL,
    bagaj integer NOT NULL,
    otel integer NOT NULL,
    ikram integer NOT NULL,
    firma_yer_hizmeti integer NOT NULL
);
    DROP TABLE public.yer_hizmeti;
       public         heap    postgres    false            �            1259    24630    yolcu    TABLE     �   CREATE TABLE public.yolcu (
    yolcu_adi character varying(30) NOT NULL,
    tc_kimlik_numarasi bigint NOT NULL,
    telefon_numarasi bigint NOT NULL,
    email character varying(35) NOT NULL,
    firma_yolcu integer NOT NULL
);
    DROP TABLE public.yolcu;
       public         heap    postgres    false            Y          0    24736    anket_yapar_ozellik 
   TABLE DATA           ^   COPY public.anket_yapar_ozellik (tarih, guvenlik, soru_sayisi, firma, memnuniyet) FROM stdin;
    public          postgres    false    221   1V       X          0    24709    calisir 
   TABLE DATA           Q   COPY public.calisir (baslama_tarihi, calisma_saati, firma, personel) FROM stdin;
    public          postgres    false    220   NV       Q          0    24610    firma 
   TABLE DATA           R   COPY public.firma (firma_id, firma_logosu, ucus_sayisi, anket_sonucu) FROM stdin;
    public          postgres    false    213   kV       O          0    24600    kampanya 
   TABLE DATA           g   COPY public.kampanya (yolcu, bilet_sayisi, firma_kampanya, baslangic_tarihi, bitis_tarihi) FROM stdin;
    public          postgres    false    211   W       P          0    24605 
   memnuniyet 
   TABLE DATA           a   COPY public.memnuniyet (memnuniyet_id, puan, katilim, firma_memnuniyet, firma_anket) FROM stdin;
    public          postgres    false    212   �W       W          0    24640    pegasus 
   TABLE DATA           `   COPY public.pegasus (ucus_kodu, ucus_ayagi, sehir, yemek_servis_ucreti, firma_isim) FROM stdin;
    public          postgres    false    219   @X       M          0    24587    personel 
   TABLE DATA           u   COPY public.personel ("tc_kimlik _numarasi", personel_adi, telefon_numarasi, adres_bilgisi, gorev, maas) FROM stdin;
    public          postgres    false    209   �X       N          0    24595    sube 
   TABLE DATA           T   COPY public.sube (sube_adi, sube_id, yonetici_adi, konum, firma_subesi) FROM stdin;
    public          postgres    false    210   #Z       V          0    24635    thy 
   TABLE DATA           T   COPY public.thy (ucus_id, ucus_ayagi, ucak_kiralama, ulke, firma_isim2) FROM stdin;
    public          postgres    false    218   �Z       R          0    24615    ucus_hizmeti 
   TABLE DATA           w   COPY public.ucus_hizmeti (ucus_hizmeti_id, temizlik, ucak_ici_ikram, konfor, iletisim, firma_ucus_hizmeti) FROM stdin;
    public          postgres    false    214   �[       T          0    24625    ulasim 
   TABLE DATA           L   COPY public.ulasim (ulasim_id, otobus, ozel_arac, firma_ulasim) FROM stdin;
    public          postgres    false    216   �[       S          0    24620    yer_hizmeti 
   TABLE DATA           \   COPY public.yer_hizmeti (yer_hizmeti_id, bagaj, otel, ikram, firma_yer_hizmeti) FROM stdin;
    public          postgres    false    215   C\       U          0    24630    yolcu 
   TABLE DATA           d   COPY public.yolcu (yolcu_adi, tc_kimlik_numarasi, telefon_numarasi, email, firma_yolcu) FROM stdin;
    public          postgres    false    217   �\       �           2606    24614    firma firma_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.firma
    ADD CONSTRAINT firma_pkey PRIMARY KEY (firma_id);
 :   ALTER TABLE ONLY public.firma DROP CONSTRAINT firma_pkey;
       public            postgres    false    213            �           2606    24604    kampanya kampanya_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.kampanya
    ADD CONSTRAINT kampanya_pkey PRIMARY KEY (yolcu);
 @   ALTER TABLE ONLY public.kampanya DROP CONSTRAINT kampanya_pkey;
       public            postgres    false    211            �           2606    24609    memnuniyet memnuniyet_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.memnuniyet
    ADD CONSTRAINT memnuniyet_pkey PRIMARY KEY (memnuniyet_id);
 D   ALTER TABLE ONLY public.memnuniyet DROP CONSTRAINT memnuniyet_pkey;
       public            postgres    false    212            �           2606    24644    pegasus pegasus_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.pegasus
    ADD CONSTRAINT pegasus_pkey PRIMARY KEY (ucus_kodu);
 >   ALTER TABLE ONLY public.pegasus DROP CONSTRAINT pegasus_pkey;
       public            postgres    false    219            �           2606    24646    personel personel_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.personel
    ADD CONSTRAINT personel_pkey PRIMARY KEY ("tc_kimlik _numarasi");
 @   ALTER TABLE ONLY public.personel DROP CONSTRAINT personel_pkey;
       public            postgres    false    209            �           2606    24599    sube subee_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sube
    ADD CONSTRAINT subee_pkey PRIMARY KEY (sube_adi);
 9   ALTER TABLE ONLY public.sube DROP CONSTRAINT subee_pkey;
       public            postgres    false    210            �           2606    24639    thy thy_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.thy
    ADD CONSTRAINT thy_pkey PRIMARY KEY (ucus_id);
 6   ALTER TABLE ONLY public.thy DROP CONSTRAINT thy_pkey;
       public            postgres    false    218            �           2606    24619    ucus_hizmeti ucus_hizmeti_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.ucus_hizmeti
    ADD CONSTRAINT ucus_hizmeti_pkey PRIMARY KEY (ucus_hizmeti_id);
 H   ALTER TABLE ONLY public.ucus_hizmeti DROP CONSTRAINT ucus_hizmeti_pkey;
       public            postgres    false    214            �           2606    24629    ulasim ulasim_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.ulasim
    ADD CONSTRAINT ulasim_pkey PRIMARY KEY (ulasim_id);
 <   ALTER TABLE ONLY public.ulasim DROP CONSTRAINT ulasim_pkey;
       public            postgres    false    216            �           2606    24624    yer_hizmeti yer_hizmeti_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.yer_hizmeti
    ADD CONSTRAINT yer_hizmeti_pkey PRIMARY KEY (yer_hizmeti_id);
 F   ALTER TABLE ONLY public.yer_hizmeti DROP CONSTRAINT yer_hizmeti_pkey;
       public            postgres    false    215            �           2606    24634    yolcu yolcu_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.yolcu
    ADD CONSTRAINT yolcu_pkey PRIMARY KEY (yolcu_adi);
 :   ALTER TABLE ONLY public.yolcu DROP CONSTRAINT yolcu_pkey;
       public            postgres    false    217            �           1259    24708 	   fki_anket    INDEX     G   CREATE INDEX fki_anket ON public.memnuniyet USING btree (firma_anket);
    DROP INDEX public.fki_anket;
       public            postgres    false    212            �           1259    24682    fki_anket_yapar    INDEX     R   CREATE INDEX fki_anket_yapar ON public.memnuniyet USING btree (firma_memnuniyet);
 #   DROP INDEX public.fki_anket_yapar;
       public            postgres    false    212            �           1259    24690    fki_degerlendirir    INDEX     J   CREATE INDEX fki_degerlendirir ON public.yolcu USING btree (firma_yolcu);
 %   DROP INDEX public.fki_degerlendirir;
       public            postgres    false    217            �           1259    24723    fki_firma_calisir    INDEX     I   CREATE INDEX fki_firma_calisir ON public.calisir USING btree (personel);
 %   DROP INDEX public.fki_firma_calisir;
       public            postgres    false    220            �           1259    24670    fki_firma_verir_yer_hizmeti    INDEX     `   CREATE INDEX fki_firma_verir_yer_hizmeti ON public.yer_hizmeti USING btree (firma_yer_hizmeti);
 /   DROP INDEX public.fki_firma_verir_yer_hizmeti;
       public            postgres    false    215            �           1259    24729    fki_pegasuss    INDEX     F   CREATE INDEX fki_pegasuss ON public.pegasus USING btree (firma_isim);
     DROP INDEX public.fki_pegasuss;
       public            postgres    false    219            �           1259    24717    fki_personel_calisir    INDEX     I   CREATE INDEX fki_personel_calisir ON public.calisir USING btree (firma);
 (   DROP INDEX public.fki_personel_calisir;
       public            postgres    false    220            �           1259    24735    fki_thyy    INDEX     ?   CREATE INDEX fki_thyy ON public.thy USING btree (firma_isim2);
    DROP INDEX public.fki_thyy;
       public            postgres    false    218            �           1259    24702    fki_ucus_hizmeti_saglar    INDEX     ^   CREATE INDEX fki_ucus_hizmeti_saglar ON public.ucus_hizmeti USING btree (firma_ucus_hizmeti);
 +   DROP INDEX public.fki_ucus_hizmeti_saglar;
       public            postgres    false    214            �           1259    24676    fki_ulasim_imkani_sunar    INDEX     R   CREATE INDEX fki_ulasim_imkani_sunar ON public.ulasim USING btree (firma_ulasim);
 +   DROP INDEX public.fki_ulasim_imkani_sunar;
       public            postgres    false    216            �           1259    24664    fki_v    INDEX     >   CREATE INDEX fki_v ON public.sube USING btree (firma_subesi);
    DROP INDEX public.fki_v;
       public            postgres    false    210            �           1259    24696 	   fki_yapar    INDEX     H   CREATE INDEX fki_yapar ON public.kampanya USING btree (firma_kampanya);
    DROP INDEX public.fki_yapar;
       public            postgres    false    211            �           2620    24754    firma firmatrig    TRIGGER     k   CREATE TRIGGER firmatrig AFTER INSERT ON public.firma FOR EACH ROW EXECUTE FUNCTION public.bilet_sayisi();
 (   DROP TRIGGER firmatrig ON public.firma;
       public          postgres    false    213    223            �           2606    24703    memnuniyet anket    FK CONSTRAINT     �   ALTER TABLE ONLY public.memnuniyet
    ADD CONSTRAINT anket FOREIGN KEY (firma_anket) REFERENCES public.firma(firma_id) NOT VALID;
 :   ALTER TABLE ONLY public.memnuniyet DROP CONSTRAINT anket;
       public          postgres    false    3231    213    212            �           2606    24677    memnuniyet anket_yapar    FK CONSTRAINT     �   ALTER TABLE ONLY public.memnuniyet
    ADD CONSTRAINT anket_yapar FOREIGN KEY (firma_memnuniyet) REFERENCES public.firma(firma_id) NOT VALID;
 @   ALTER TABLE ONLY public.memnuniyet DROP CONSTRAINT anket_yapar;
       public          postgres    false    212    3231    213            �           2606    24685    yolcu degerlendirir    FK CONSTRAINT     �   ALTER TABLE ONLY public.yolcu
    ADD CONSTRAINT degerlendirir FOREIGN KEY (firma_yolcu) REFERENCES public.memnuniyet(memnuniyet_id) NOT VALID;
 =   ALTER TABLE ONLY public.yolcu DROP CONSTRAINT degerlendirir;
       public          postgres    false    212    217    3229            �           2606    24718    calisir firma_calisir    FK CONSTRAINT     �   ALTER TABLE ONLY public.calisir
    ADD CONSTRAINT firma_calisir FOREIGN KEY (personel) REFERENCES public.personel("tc_kimlik _numarasi") NOT VALID;
 ?   ALTER TABLE ONLY public.calisir DROP CONSTRAINT firma_calisir;
       public          postgres    false    209    220    3219            �           2606    24770    sube firma_subesi_vardir    FK CONSTRAINT     �   ALTER TABLE ONLY public.sube
    ADD CONSTRAINT firma_subesi_vardir FOREIGN KEY (firma_subesi) REFERENCES public.firma(firma_id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.sube DROP CONSTRAINT firma_subesi_vardir;
       public          postgres    false    3231    213    210            �           2606    24665 #   yer_hizmeti firma_verir_yer_hizmeti    FK CONSTRAINT     �   ALTER TABLE ONLY public.yer_hizmeti
    ADD CONSTRAINT firma_verir_yer_hizmeti FOREIGN KEY (firma_yer_hizmeti) REFERENCES public.yer_hizmeti(yer_hizmeti_id) NOT VALID;
 M   ALTER TABLE ONLY public.yer_hizmeti DROP CONSTRAINT firma_verir_yer_hizmeti;
       public          postgres    false    215    215    3237            �           2606    24724    pegasus pegasuss    FK CONSTRAINT     �   ALTER TABLE ONLY public.pegasus
    ADD CONSTRAINT pegasuss FOREIGN KEY (firma_isim) REFERENCES public.firma(firma_id) NOT VALID;
 :   ALTER TABLE ONLY public.pegasus DROP CONSTRAINT pegasuss;
       public          postgres    false    219    3231    213            �           2606    24712    calisir personel_calisir    FK CONSTRAINT     �   ALTER TABLE ONLY public.calisir
    ADD CONSTRAINT personel_calisir FOREIGN KEY (firma) REFERENCES public.firma(firma_id) NOT VALID;
 B   ALTER TABLE ONLY public.calisir DROP CONSTRAINT personel_calisir;
       public          postgres    false    213    220    3231            �           2606    24730    thy thyy    FK CONSTRAINT     {   ALTER TABLE ONLY public.thy
    ADD CONSTRAINT thyy FOREIGN KEY (firma_isim2) REFERENCES public.firma(firma_id) NOT VALID;
 2   ALTER TABLE ONLY public.thy DROP CONSTRAINT thyy;
       public          postgres    false    218    3231    213            �           2606    24697     ucus_hizmeti ucus_hizmeti_saglar    FK CONSTRAINT     �   ALTER TABLE ONLY public.ucus_hizmeti
    ADD CONSTRAINT ucus_hizmeti_saglar FOREIGN KEY (firma_ucus_hizmeti) REFERENCES public.firma(firma_id) NOT VALID;
 J   ALTER TABLE ONLY public.ucus_hizmeti DROP CONSTRAINT ucus_hizmeti_saglar;
       public          postgres    false    214    213    3231            �           2606    24671    ulasim ulasim_imkani_sunar    FK CONSTRAINT     �   ALTER TABLE ONLY public.ulasim
    ADD CONSTRAINT ulasim_imkani_sunar FOREIGN KEY (firma_ulasim) REFERENCES public.yer_hizmeti(yer_hizmeti_id) NOT VALID;
 D   ALTER TABLE ONLY public.ulasim DROP CONSTRAINT ulasim_imkani_sunar;
       public          postgres    false    215    216    3237            �           2606    24691    kampanya yapar    FK CONSTRAINT     �   ALTER TABLE ONLY public.kampanya
    ADD CONSTRAINT yapar FOREIGN KEY (firma_kampanya) REFERENCES public.firma(firma_id) NOT VALID;
 8   ALTER TABLE ONLY public.kampanya DROP CONSTRAINT yapar;
       public          postgres    false    211    3231    213            Y      x������ � �      X      x������ � �      Q   �   x�U�K�0���0�K�K7��)��@�޾���oƶ�2���S�K�F��Ǹ`d���.�=_Z#��zSb�}N�eM�r-,������1�>�4�鷣EC%�UEq��紏i�~���[����*�&��i��!����+���r�}��=t      O   �   x�e��
�0���S�*����c�Aq\�-]��8�gpwk|/b�}����m]�/�|݋ZXV��)[AH�(L��*"캳�\/7.�Ux��
^sJ�i�ϒb��o��nCl(b�63�)��P'3��pc7\]-��'d����>���y�O�AX�9(��,8� �/z=4      P   Z   x�m�1Ak��h�6��K�����R\B�a��j��Z�R*�1+Z'�����T�ׂn�YG��Wҥ1���a�L�~4�_�k��      W   �   x�M�1�0���)����FL�q3N.��k!m�2^A���lLח�<�+�Y��{zf�lz�����+H�Ti��R%�q@������ь�#Ή5+�F
͆~K���q�4W��՜'�|Z����,��̶��s�1/�.k!�/;�      M   &  x�M�1j�0���:����$�[B�������њX��c
�A��
���ν*�%tB����h�&3s�`�9�,^�>���fF������b�_\q#��ʅFr�X��\<��<�ϲ	�i���9k�H�������e �]RIü�˩�|;���綾��܌���$%ce�E�0|7��Ǩu3E���sH�d*$s�,���� �D�7Z���^r�+1?����cH�
�c��X0�,��l��M���:����)^�Ŵl���a��!��[�Pvb�]�����,�~�}z�      N   �   x�E�1�0����������51�g��3�@(�)e�q�+��F��H����W�3�հ��\�'����B|4��5 �qIq05���+�&���C�q�=�3�%G̵���}�ې���B���h�?>]e&*R�tQk�|+�[����<�h�=�V���`��D��dJ�H'�!��I      V   �   x�M�;�0���9E/ ���c�@uF���m�p��������h}��,��M0v}k	���hs�mG0͒C)�������ɴ���8e���
0Bb�$��Q�+r|߳����+n���5"�vK��e� �8�+>�=��H	�����OKI�.���{|�!�:@�      R   B   x�M���@��a��� a��?Gy��p,E�_���&	�B謁*R��Ͻ:)�����ef��0      T   9   x�ɹ  �X*��'��8���($����L�	���;���yJ��"���      S   :   x����@���0��6�.�?w�˲m|�.lu3��nUa��4C/	3��M���8�	      U     x�m�1N�@Ek�9�J�؞���(�A���efW��E����钃��-~����퇘���r8��,�[`�-���ޠ�1w�ڴ���e���K׎�|��S�����Ad`$!��7�xI���T�P>��.�/@&b�Y�`���!�	�/�/@��P�?s����б%�B`��V*C�7�#�[��m�5t�u����^*�zY�j8a�����t��1�S��L�Y�~�2����F ��;Fq�65m��[Iﻢ(~ ؑy�     