CREATE TABLE Empresas (
    id NUMERIC PRIMARY KEY,
    endereco VARCHAR(255),
    num_alunos INT,
    area VARCHAR(50)
);

CREATE TABLE Tecnologia (
    nome VARCHAR,
    ID NUMERIC PRIMARY KEY UNIQUE
);

CREATE TABLE Controle (
    Data DATE,
    fk_Empresas_ID NUMERIC,
    fk_Tecnologia_ID NUMERIC
);
 
ALTER TABLE Controle ADD CONSTRAINT FK_Controle_1
    FOREIGN KEY (fk_Empresas_ID)
    REFERENCES Empresas (ID);
 
ALTER TABLE Controle ADD CONSTRAINT FK_Controle_2
    FOREIGN KEY (fk_Tecnologia_ID)
    REFERENCES Tecnologia (ID);

ALTER TABLE Controle
ADD semestre VARCHAR(10);

UPDATE Controle
SET semestre = '1ºSemestre'
WHERE Data BETWEEN '2023-01-01' AND '2023-06-30';

UPDATE Controle
SET semestre = '2ºSemestre'
WHERE Data BETWEEN '2023-07-01' AND '2023-12-31';

INSERT INTO Empresas (id, endereco, num_alunos, area)
VALUES (1, 'Rua A, 123', 50, 'Tecnologia da Informação');
INSERT INTO Empresas (id, endereco, num_alunos, area)
VALUES (2, 'Rua B, 456', 30, 'Engenharia de Produção');

INSERT INTO Tecnologia (nome, id)
VALUES ('Python', 1 );
INSERT INTO Tecnologia (nome, id)
VALUES ('C++', 2 );
INSERT INTO Tecnologia (nome, id)
VALUES ('Java', 3 );

INSERT INTO Controle (Data, fk_Empresas_ID, fk_Tecnologia_ID)
VALUES ('2023/02/27',1, 3);
INSERT INTO Controle (Data, fk_Empresas_ID, fk_Tecnologia_ID)
VALUES ('2023/01/28',2, 2);
INSERT INTO Controle (Data, fk_Empresas_ID, fk_Tecnologia_ID)
VALUES ('2023/03/29',2, 1);

SELECT * FROM Empresas;
SELECT * FROM Tecnologia;
SELECT * FROM Controle;

SELECT fk_Empresas_ID, COUNT(DISTINCT fk_Tecnologia_ID) as num_tecnologias
FROM Controle
WHERE semestre = '1ºSemestre'
GROUP BY fk_Empresas_ID
ORDER BY num_tecnologias ASC
LIMIT 1;

SELECT fk_Empresas_ID, COUNT(DISTINCT fk_Tecnologia_ID) as num_tecnologias
FROM Controle
WHERE semestre = '1ºSemestre'
GROUP BY fk_Empresas_ID
ORDER BY num_tecnologias DESC
LIMIT 1;

SELECT COUNT(*) as num_empresas
FROM Empresas
WHERE EXISTS (
    SELECT 1
    FROM Controle
    JOIN Tecnologia ON Controle.fk_Tecnologia_ID = Tecnologia.ID
    WHERE Controle.fk_Empresas_ID = Empresas.id AND Empresas.area = 'Tecnologia da Informação' AND Controle.semestre = '1ºSemestre'
);

SELECT COUNT(*) as num_empresas
FROM Empresas
WHERE NOT EXISTS (
    SELECT 1
    FROM Controle
    JOIN Tecnologia ON Controle.fk_Tecnologia_ID = Tecnologia.ID
    WHERE Controle.fk_Empresas_ID = Empresas.id AND Empresas.area = 'Tecnologia da Informação' AND Controle.semestre = '1ºSemestre'
);

