SET storage_engine=InnoDB;
SET FOREIGN_KEY_CHECKS=1;

INSERT INTO ISTRUTTORE
VALUES('I1', 'Salvo', 'Brembi', 'Torino');
INSERT INTO ISTRUTTORE
VALUES('I2', 'Brunone', 'Canegallo', 'Napoli');
INSERT INTO ISTRUTTORE
VALUES('I3', 'Marciliano', 'Brindelli', 'Torino');
INSERT INTO ISTRUTTORE
VALUES('I4', 'Novella', 'Botticchio', 'Arezzo');
INSERT INTO ISTRUTTORE
VALUES('I5', 'Manrico', 'Castagnini', 'Milano');

INSERT INTO PALESTRA
VALUES('P1', 'P_Uno', 'Indirizzo1', 'Torino');
INSERT INTO PALESTRA
VALUES('P2', 'P_Due', 'Indirizzo2', 'Milano');
INSERT INTO PALESTRA
VALUES('P3', 'P_Tre', 'Indirizzo3', 'Napoli');
INSERT INTO PALESTRA
VALUES('P4', 'P_Quattro', 'Indirizzo4', 'Arezzo');
INSERT INTO PALESTRA
VALUES('P5', 'P_Cinque', 'Indirizzo5', 'Milano');
INSERT INTO PALESTRA
VALUES('P6', 'P_Sei', 'Indirizzo6', 'Torino');
INSERT INTO PALESTRA
VALUES('P7', 'P_Sette', 'Indirizzo7', 'Napoli');
INSERT INTO PALESTRA
VALUES('P8', 'P_Otto', 'Indirizzo8', 'Torino');

INSERT INTO SPECIALITA
VALUES('S1', 'Yoga', 'Descrizione1');
INSERT INTO SPECIALITA
VALUES('S2', 'Judo', 'Descrizione2');
INSERT INTO SPECIALITA
VALUES('S3', 'Karate', 'Descrizione3');

INSERT INTO LEZIONE
VALUES('I1', 'P1', '2022/12/10', 'S1', '21');
INSERT INTO LEZIONE
VALUES('I1', 'P6', '2022/05/05', 'S1', '22');
INSERT INTO LEZIONE
VALUES('I1', 'P8', '2022/10/23', 'S1', '32');
INSERT INTO LEZIONE
VALUES('I2', 'P2', '2022/10/15', 'S3', '12');
INSERT INTO LEZIONE
VALUES('I2', 'P4', '2022/11/11', 'S1', '33');
INSERT INTO LEZIONE
VALUES('I3', 'P5', '2022/12/13', 'S1', '29');
INSERT INTO LEZIONE
VALUES('I4', 'P7', '2022/10/10', 'S1', '30');
INSERT INTO LEZIONE
VALUES('I5', 'P3', '2022/10/14', 'S1', '21');
INSERT INTO LEZIONE
VALUES('I5', 'P3', '2022/09/08', 'S2', '14');
INSERT INTO LEZIONE
VALUES('I2', 'P1', '2022/04/04', 'S2', '24');
INSERT INTO LEZIONE
VALUES('I4', 'P8', '2022/12/24', 'S2', '30');
INSERT INTO LEZIONE
VALUES('I5', 'P8', '2022/10/22', 'S2', '30');
INSERT INTO LEZIONE
VALUES('I3', 'P8', '2022/06/07', 'S2', '28');
INSERT INTO LEZIONE
VALUES('I1', 'P1', '2022/07/07', 'S1', '23');
INSERT INTO LEZIONE
VALUES('I3', 'P1', '2022/01/01', 'S1', '10');
INSERT INTO LEZIONE
VALUES('I3', 'P6', '2022/02/02', 'S1', '10');
