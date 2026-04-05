INSERT INTO Kursant (IdKursant, Imie, Nazwisko, DataUrodzenia, Email)
VALUES (1, 'Tomasz', 'Zieliński', '2008-05-15', 't.zielinski@mail.com');

INSERT INTO Kursant (IdKursant, Imie, Nazwisko, DataUrodzenia, Email)
VALUES (2, 'Adam', 'Nowak', '2007-01-25', 'a.nowak@mail.com');

INSERT INTO Kursant (IdKursant, Imie, Nazwisko, DataUrodzenia, Email)
VALUES (3, 'Anna', 'Kowalska', '2007-08-30', 'a.kowalska@mail.com');

INSERT INTO Kursant (IdKursant, Imie, Nazwisko, DataUrodzenia, Email)
VALUES (4, 'Zuzanna', 'Lew', '2008-12-02', 'z.lew@mail.com');

INSERT INTO Kursant (IdKursant, Imie, Nazwisko, DataUrodzenia, Email)
VALUES (5, 'Ewelina', 'Skrzypecka', '2006-03-17', 'e.skrzypecka@mail.com');

INSERT INTO Lektor (IdLektor, Imie, Nazwisko, Specjalizacja, Doswiadczenie, DataZatrudnienia, DataZwolnienia, IdPrzelozony)
VALUES (1, 'Karolina', 'Wójcik', 'angielski', 5, '2024-09-01', NULL, NULL);

INSERT INTO Lektor (IdLektor, Imie, Nazwisko, Specjalizacja, Doswiadczenie, DataZatrudnienia, DataZwolnienia, IdPrzelozony)
VALUES (2, 'Michał', 'Banaś', 'hiszpański', 9, '2019-09-01', NULL, 1);

INSERT INTO Lektor (IdLektor, Imie, Nazwisko, Specjalizacja, Doswiadczenie, DataZatrudnienia, DataZwolnienia, IdPrzelozony)
VALUES (3, 'Aleksandra', 'Wierzbicka', 'niemiecki', 2, '2024-09-01', NULL, 1);

INSERT INTO Kurs (IdKurs, Nazwa, Poziom, Jezyk)
VALUES (1, 'Angielski C1', 'C1', 'angielski');

INSERT INTO Sala (IdSala, Numer, MaxKursantow)
VALUES (1, 201, 15);

INSERT INTO Material (IdMaterial, Nazwa, Typ, Poziom)
VALUES (1, 'Gramatyka w pigułce', 'prezentacja', 'C1');

INSERT INTO Material (IdMaterial, Nazwa, Typ, Poziom)
VALUES (2, 'Dialogi audio', 'nagranie audio', 'C1');

INSERT INTO Grupa (IdGrupa, IdKurs, IdLektor, IdSala)
VALUES (1, 1, 1, 1);

INSERT INTO Zajecia (IdZajecia, IdGrupa, Data)
VALUES (1, 1, '2026-04-01');

INSERT INTO KursantGrupa (IdKursant, IdGrupa)
VALUES (1, 1);

INSERT INTO KursantGrupa (IdKursant, IdGrupa)
VALUES (2, 1);

INSERT INTO KursantGrupa (IdKursant, IdGrupa)
VALUES (3, 1);

INSERT INTO KursantGrupa (IdKursant, IdGrupa)
VALUES (4, 1);

INSERT INTO KursantGrupa (IdKursant, IdGrupa)
VALUES (5, 1);

INSERT INTO Obecnosc (IdKursant, IdZajecia, Obecny)
VALUES (1, 1, 1);

INSERT INTO Obecnosc (IdKursant, IdZajecia, Obecny)
VALUES (2, 1, 0);

INSERT INTO Obecnosc (IdKursant, IdZajecia, Obecny)
VALUES (3, 1, 1);

INSERT INTO Obecnosc (IdKursant, IdZajecia, Obecny)
VALUES (4, 1, 1);

INSERT INTO Obecnosc (IdKursant, IdZajecia, Obecny)
VALUES (5, 1, 0);

INSERT INTO KursMaterial (IdKurs, IdMaterial)
VALUES (1, 1);

INSERT INTO KursMaterial (IdKurs, IdMaterial)
VALUES (1, 2);

INSERT INTO Platnosc (IdPlatnosc, IdKursant, IdKurs, Kwota, Data, Status)
VALUES (1, 1, 1, 500, '2026-04-01', 'oplacone');

INSERT INTO Platnosc (IdPlatnosc, IdKursant, IdKurs, Kwota, Data, Status)
VALUES (2, 2, 1, 500, '2026-04-01', 'nieoplacone');
