CREATE TABLE Emp_Par (
    ID NUMERIC PRIMARY KEY UNIQUE,
    Nome VARCHAR,
	Endereco VARCHAR,
	Num_alunos NUMERIC,
	Tecnologia VARCHAR
);

CREATE TABLE Cursos (
    ID NUMERIC PRIMARY KEY UNIQUE,
    Tech VARCHAR,
    Duração DATE
);

CREATE TABLE Cursar (
    fk_Emp_Par_ID NUMERIC,
    fk_Cursos_ID NUMERIC
);
 
ALTER TABLE Cursar ADD CONSTRAINT FK_Cursar_1
    FOREIGN KEY (fk_Emp_Par_ID)
    REFERENCES Emp_Par (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Cursar ADD CONSTRAINT FK_Cursar_2
    FOREIGN KEY (fk_Cursos_ID)
    REFERENCES Cursos (ID)
    ON DELETE SET NULL;
	
INSERT INTO Emp_Par (ID, Nome, Endereco, Num_alunos)
VALUES (1, 'Empresa 1', 'Rua Amaral, 313', 50);
INSERT INTO Emp_Par (ID, Nome, Endereco, Num_alunos)
VALUES (2, 'Empresa 2', 'Rua Blasfemia, 656', 30);
INSERT INTO Emp_Par (ID, Nome, Endereco, Num_alunos)
VALUES (3, 'Empresa 3', 'Rua Dellphino, 128', 64);

WHERE ID INSERT INTO Emp_Par ()

INSERT INTO Emp_Par (ID, Nome, Endereco, Num_alunos)
VALUES (1, 'Empresa 1', 'Rua Amaral, 313', 50, );
INSERT INTO Emp_Par (ID, Nome, Endereco, Num_alunos)
VALUES (2, 'Empresa 2', 'Rua Blasfemia, 656', 30);
INSERT INTO Emp_Par (ID, Nome, Endereco, Num_alunos)
VALUES (3, 'Empresa 3', 'Rua Dellphino, 128', 64);

INSERT INTO Cursos (ID, Tech)
VALUES (2, 'C++');
INSERT INTO Cursos (ID, Tech)
VALUES (3, 'Python');

SELECT * FROM Emp_Par