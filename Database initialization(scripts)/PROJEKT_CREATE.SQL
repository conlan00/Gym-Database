

CREATE TABLE pro_klient (
    nr_klienta NUMBER(5) NOT NULL,
    plec       CHAR(1) NOT NULL,
    imie       VARCHAR2(20 CHAR) NOT NULL,
    nazwisko   VARCHAR2(20 CHAR) NOT NULL,
    nr_trenera NUMBER(2)
);

ALTER TABLE pro_klient ADD CONSTRAINT pr_klient PRIMARY KEY ( nr_klienta );

CREATE TABLE pro_obiekt (
    nr_obiektu   NUMBER(3) NOT NULL,
    nazwa_obiekt VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE pro_obiekt ADD CONSTRAINT pr_obiekt PRIMARY KEY ( nr_obiektu );

CREATE TABLE pro_trener (
    nr_trenera NUMBER(2) NOT NULL,
    imie       VARCHAR2(20 CHAR) NOT NULL,
    nazwisko   VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE pro_trener ADD CONSTRAINT pr_trener PRIMARY KEY ( nr_trenera );

CREATE TABLE pro_trening (
    id_zajec   NUMBER(3) NOT NULL,
    nr_klienta NUMBER(5) NOT NULL
);

ALTER TABLE pro_trening ADD CONSTRAINT pk PRIMARY KEY ( id_zajec,
                                                        nr_klienta );

CREATE TABLE pro_zajecia (
    id_zajec    NUMBER(3) NOT NULL,
    nazwa_zajec VARCHAR2(20 CHAR) NOT NULL,
    data_zajec  DATE NOT NULL,
    cena        NUMBER(10, 2) NOT NULL,
    nr_obiektu  NUMBER(3) NOT NULL
);

ALTER TABLE pro_zajecia ADD CONSTRAINT pr_zajecia PRIMARY KEY ( id_zajec );

ALTER TABLE pro_zajecia
    ADD CONSTRAINT fk_o FOREIGN KEY ( nr_obiektu )
        REFERENCES pro_obiekt ( nr_obiektu );

ALTER TABLE pro_klient
    ADD CONSTRAINT fk_t FOREIGN KEY ( nr_trenera )
        REFERENCES pro_trener ( nr_trenera );

ALTER TABLE pro_trening
    ADD CONSTRAINT pr_klient_fk FOREIGN KEY ( nr_klienta )
        REFERENCES pro_klient ( nr_klienta );

ALTER TABLE pro_trening
    ADD CONSTRAINT pr_zajecia_fk FOREIGN KEY ( id_zajec )
        REFERENCES pro_zajecia ( id_zajec );




