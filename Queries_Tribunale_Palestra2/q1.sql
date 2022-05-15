--ES 1)
--a)

SELECT G1.CodFiscale, Cognome, COUNT(DISTINCT TipologiaCausa) AS NumTipoCausa
FROM GIUDICE G1, CAUSA C1
WHERE G1.CodFiscale = C1.CodFiscale AND
G1.CodFiscale NOT IN (SELECT CodFiscale
                      FROM CAUSA
                      WHERE TipologiaCausa = 'Diffamazione'
                      AND (DATE(DataInizio) <= '2020/12/31'
                      AND (Date(DataFine) >= '2020/01/01'
                      OR DataFine IS NULL)))
GROUP BY G1.CodFiscale, Cognome

--b)

SELECT C1.CodCausa, MAX(Data) AS UltimaUdienza
FROM CAUSA C1, UDIENZA U1
WHERE DataFine IS NULL AND C1.CodCausa = U1.CodCausa
AND CodFiscale IN (SELECT CodFiscale
                   FROM CAUSA C2, UDIENZA U2
                   WHERE C2.CodCausa = U2.CodCausa
                   GROUP BY CodFiscale
                   HAVING COUNT(DISTINCT CodTribunale) >= 3)
GROUP BY C1.CodCausa

--c)

SELECT Nome, Cognome, DataNascita
FROM GIUDICE G1, CAUSA C1, UDIENZA U1
WHERE G1.CodFiscale = C1.CodFiscale AND C1.Codcausa = U1.CodCausa
AND CodTribunale IN (SELECT CodTribunale
                     FROM CAUSA C2, UDIENZA U2
                     WHERE C2.CodCausa = U2.CodCausa
                     AND TipologiaCausa = 'Divorzio'
                     GROUP BY CodTribunale
                     HAVING COUNT(DISTINCT C2.CodCausa) >= 50)
GROUP BY G1.CodFiscale, Nome, Cognome, DataNascita
HAVING COUNT(DISTINCT CodTribunale) =
(SELECT COUNT(DISTINCT CodTribunale)
 FROM CAUSA C3, UDIENZA U3
 WHERE C3.CodCausa = U3.CodCausa
 AND TipologiaCausa = 'Divorzio'
 AND CodTribunale IN (SELECT CodTribunale
                      FROM CAUSA C4, UDIENZA U4
                      WHERE C4.CodCausa = U4.CodCausa
                      AND TipologiaCausa = 'Divorzio'
                      GROUP BY CodTribunale
                      HAVING COUNT(DISTINCT C4.CodCausa) >= 50))

--ES 2)
--a)

SELECT NomeP, COUNT(DISTINCT CodFiscale)
FROM PALESTRA P1, LEZIONE L1
WHERE P1.CodP = L1.CodP  AND P1.Citta = 'Torino'
AND P1.CodP NOT IN (SELECT CodP
                    FROM LEZIONE L2, SPECIALITA S1
                    WHERE L2.CodS = S1.CodS AND NomeS = 'Yoga')
AND P1.CodP IN (SELECT CodP
                FROM LEZIONE L3, SPECIALITA S2
                WHERE L3.CodS = S2.CodS AND NomeS = 'Judo'
                GROUP BY CodP
                HAVING COUNT(DISTINCT CodFiscale) >= 5)
GROUP BY P1.CodP, NomeP

--b)

SELECT CodFiscale, NomeP, Indirizzo, Citta
FROM PALESTRA P1, LEZIONE L1
WHERE P1.CodP = L1.CodP
AND CodFiscale NOT IN (SELECT CodFiscale
                       FROM LEZIONE L2, SPECIALITA S1
                       WHERE L2.CodS = S1.CodS AND NomeS <> 'Yoga')
GROUP BY CodFiscale, P1.CodP, NomeP, Indirizzo, Citta
HAVING COUNT(*) = (SELECT MAX(NumLezioni)
                   FROM (SELECT CodFiscale, COUNT(*) AS NumLezioni
                         FROM PALESTRA P2, LEZIONE L3
                         WHERE P2.CodP = L3.CodP
                         AND CodFiscale NOT IN (SELECT CodFiscale
                                                FROM LEZIONE L4, SPECIALITA S2
                                                WHERE L4.CodS = S2.CodS
                                                AND NomeS <> 'Yoga')
                         GROUP BY CodFiscale, P2.CodP) AS LxP
                   GROUP BY LxP.Codfiscale
                   HAVING L1.CodFiscale = LxP.CodFiscale)

--c)

  SELECT NomeT, Cognome, COUNT(DISTINCT CodS)
  FROM ISTRUTTORE I1, LEZIONE L1, PALESTRA P1
  WHERE I1.CodFiscale = L1.CodFiscale AND P1.CodP = L1.CodP
  AND I1.Citta = P1.Citta
  GROUP BY I1.CodFiscale, NomeT, Cognome, I1.Citta
  HAVING COUNT(DISTINCT P1.CodP) = (SELECT COUNT(DISTINCT CodP)
                                    FROM PALESTRA P2
                                    WHERE P2.Citta = I1.Citta)
