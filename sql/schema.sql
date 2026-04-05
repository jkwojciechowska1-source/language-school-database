PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS Obecnosc;
DROP TABLE IF EXISTS KursantGrupa;
DROP TABLE IF EXISTS Platnosc;
DROP TABLE IF EXISTS KursMaterial;
DROP TABLE IF EXISTS Zajecia;
DROP TABLE IF EXISTS Grupa;
DROP TABLE IF EXISTS Kursant;
DROP TABLE IF EXISTS Lektor;
DROP TABLE IF EXISTS Kurs;
DROP TABLE IF EXISTS Material;
DROP TABLE IF EXISTS Sala;

PRAGMA foreign_keys = ON;

CREATE TABLE Kursant (
                         IdKursant INTEGER PRIMARY KEY,
                         Imie VARCHAR(20) NOT NULL,
                         Nazwisko VARCHAR(20) NOT NULL,
                         DataUrodzenia DATE,
                         Email VARCHAR(50) UNIQUE
);

CREATE TABLE Lektor (
                        IdLektor INTEGER PRIMARY KEY,
                        Imie VARCHAR(20) NOT NULL,
                        Nazwisko VARCHAR(20) NOT NULL,
                        Specjalizacja VARCHAR(30),
                        Doswiadczenie INT,
                        DataZatrudnienia DATE,
                        DataZwolnienia DATE,
                        IdPrzelozony INT,
                        FOREIGN KEY (IdPrzelozony) REFERENCES Lektor(IdLektor) ON DELETE SET NULL
);

CREATE TABLE Kurs (
                        IdKurs INTEGER PRIMARY KEY,
                        Nazwa VARCHAR(50) NOT NULL,
                        Poziom VARCHAR(20),
                        Jezyk VARCHAR(20)
);

CREATE TABLE Sala (
                        IdSala INTEGER PRIMARY KEY,
                        Numer INT,
                        MaxKursantow INT
);

CREATE TABLE Material (
                        IdMaterial INTEGER PRIMARY KEY,
                        Nazwa VARCHAR(50),
                        Typ VARCHAR(20),
                        Poziom VARCHAR(20)
);

CREATE TABLE Grupa (
                       IdGrupa INTEGER PRIMARY KEY,
                       IdKurs INT NOT NULL,
                       IdLektor INT NOT NULL,
                       IdSala INT NOT NULL,
                       FOREIGN KEY (IdKurs) REFERENCES Kurs(IdKurs),
                       FOREIGN KEY (IdLektor) REFERENCES Lektor(IdLektor),
                       FOREIGN KEY (IdSala) REFERENCES Sala(IdSala)
);

CREATE TABLE KursantGrupa (
                        IdKursant INT,
                        IdGrupa INT,
                        PRIMARY KEY (IdKursant, IdGrupa),
                        FOREIGN KEY (IdKursant) REFERENCES Kursant(IdKursant) ON DELETE CASCADE,
                        FOREIGN KEY (IdGrupa) REFERENCES Grupa(IdGrupa) ON DELETE CASCADE
);

CREATE TABLE Zajecia (
                        IdZajecia INTEGER PRIMARY KEY,
                        IdGrupa INT NOT NULL,
                        Data DATE,
                        FOREIGN KEY (IdGrupa) REFERENCES Grupa(IdGrupa) ON DELETE CASCADE
);

CREATE TABLE Obecnosc (
                        IdKursant INT,
                        IdZajecia INT,
                        Obecny BOOLEAN,
                        PRIMARY KEY (IdKursant, IdZajecia),
                        FOREIGN KEY (IdKursant) REFERENCES Kursant(IdKursant) ON DELETE CASCADE,
                        FOREIGN KEY (IdZajecia) REFERENCES Zajecia(IdZajecia) ON DELETE CASCADE
);

CREATE TABLE KursMaterial (
                        IdKurs INT,
                        IdMaterial INT,
                        PRIMARY KEY (IdKurs, IdMaterial),
                        FOREIGN KEY (IdKurs) REFERENCES Kurs(IdKurs),
                        FOREIGN KEY (IdMaterial) REFERENCES Material(IdMaterial)
);

CREATE TABLE Platnosc (
                        IdPlatnosc INTEGER PRIMARY KEY,
                        IdKursant INT,
                        IdKurs INT,
                        Kwota DECIMAL(10,2),
                        Data DATE,
                        Status VARCHAR(20),
                        FOREIGN KEY (IdKursant) REFERENCES Kursant(IdKursant),
                        FOREIGN KEY (IdKurs) REFERENCES Kurs(IdKurs)
);