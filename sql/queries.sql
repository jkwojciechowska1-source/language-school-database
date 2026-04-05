SELECT COUNT(*) AS LiczbaKursantow FROM Kursant;

SELECT k.Imie, k.Nazwisko, c.Nazwa AS Kurs
FROM Kursant k
         JOIN KursantGrupa kg ON k.IdKursant = kg.IdKursant
         JOIN Grupa g ON kg.IdGrupa = g.IdGrupa
         JOIN Kurs c ON g.IdKurs = c.IdKurs;

SELECT k.Imie, k.Nazwisko,
       COUNT(o.Obecny) AS LiczbaZajec,
       SUM(o.Obecny) AS Obecnosci
FROM Kursant k
         JOIN Obecnosc o ON k.IdKursant = o.IdKursant
GROUP BY k.IdKursant, k.Imie, k.Nazwisko;

SELECT l.Imie, l.Nazwisko, c.Nazwa
FROM Lektor l
         JOIN Grupa g ON l.IdLektor = g.IdLektor
         JOIN Kurs c ON g.IdKurs = c.IdKurs;

SELECT k.Imie, k.Nazwisko
FROM Kursant k
         JOIN KursantGrupa kg ON k.IdKursant = kg.IdKursant
WHERE kg.IdGrupa = 1;

SELECT k.Imie, k.Nazwisko, o.Obecny
FROM Obecnosc o
         JOIN Kursant k ON o.IdKursant = k.IdKursant
WHERE o.IdZajecia = 1;

SELECT c.Nazwa
FROM Kurs c
         JOIN Platnosc p ON c.IdKurs = p.IdKurs
WHERE p.IdKursant = 1;

SELECT p.Kwota, p.Status, c.Nazwa
FROM Platnosc p
         JOIN Kurs c ON p.IdKurs = c.IdKurs;

SELECT m.Nazwa, m.Typ
FROM Material m
         JOIN KursMaterial km ON m.IdMaterial = km.IdMaterial
WHERE km.IdKurs = 1;

SELECT l.Imie, l.Nazwisko, g.IdGrupa
FROM Lektor l
         JOIN Grupa g ON l.IdLektor = g.IdLektor;

SELECT k.Imie, k.Nazwisko
FROM Kursant k
         LEFT JOIN Platnosc p ON k.IdKursant = p.IdKursant
WHERE p.Status IS NULL OR p.Status = 'nieoplacone';

SELECT k.Imie, k.Nazwisko,
       ROUND(AVG(o.Obecny) * 100, 2) AS Frekwencja
FROM Kursant k
         JOIN Obecnosc o ON k.IdKursant = o.IdKursant
GROUP BY k.IdKursant, k.Imie, k.Nazwisko
ORDER BY Frekwencja DESC;

SELECT c.Nazwa
FROM Kurs c
         LEFT JOIN KursMaterial km ON c.IdKurs = km.IdKurs
WHERE km.IdMaterial IS NULL;