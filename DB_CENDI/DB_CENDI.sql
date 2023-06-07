--USE MASTER;
--DROP DATABASE BDCENDI;
CREATE DATABASE BDCENDI;
GO
USE BDCENDI;
GO

CREATE TABLE TBL_TEMAS(
INT_COD_TEMA INT NOT NULL PRIMARY KEY,
STR_NOMBRE_TEMA VARCHAR(40) NOT NULL,
STR_CONTENIDO_TEMA VARCHAR(60) NOT NULL,
);
GO

CREATE TABLE TBL_CURSOS(
INT_COD_CURSO INT NOT NULL PRIMARY KEY,
STR_TITULO VARCHAR(30) NOT NULL,
INT_NUMERO_HORAS INT NOT NULL
);
GO

CREATE TABLE TBL_CURSOS_TEMAS(
INT_COD_CURSO INT NOT NULL FOREIGN KEY REFERENCES TBL_CURSOS(INT_COD_CURSO),
INT_COD_TEMA INT NOT NULL FOREIGN KEY REFERENCES TBL_TEMAS(INT_COD_TEMA),
CONSTRAINT PK_TBL_CURSOS_TEMAS PRIMARY KEY (INT_COD_CURSO, INT_COD_TEMA)
);
GO

CREATE TABLE TBL_TIPO_DOC(
INT_COD_DOCUMENTO INT NOT NULL PRIMARY KEY,
STR_TIPO_DOC VARCHAR(2)
);
GO

CREATE TABLE TBL_EMPLEADOS(
INT_ID_EMPLEADO INT NOT NULL PRIMARY KEY,
INT_COD_EMPLEADO INT FOREIGN KEY REFERENCES TBL_EMPLEADOS(INT_ID_EMPLEADO),
INT_COD_TIPO_DOC INT FOREIGN KEY REFERENCES TBL_TIPO_DOC(INT_COD_DOCUMENTO),
STR_NOMBRE VARCHAR(30) NOT NULL,
INT_CEDULA BIGINT NOT NULL,
DTE_FECHA_NACIMIENTO DATETIME NOT NULL
);
GO

CREATE TABLE TBL_USUARIO(
INT_COD_EMPLEADO INT NOT NULL PRIMARY KEY,
INT_ID_EMPLEADO INT FOREIGN KEY REFERENCES TBL_EMPLEADOS(INT_ID_EMPLEADO),
INT_CLAVE_ACCESO INT NOT NULL,
STR_NOMBRE VARCHAR(40) NOT NULL,
INT_NUMERO_DOCUMENTO INT NOT NULL
);
GO

CREATE TABLE TBL_CIUDADES (
INT_COD_CIUDAD INT NOT NULL PRIMARY KEY,
STR_CIUDAD VARCHAR(30)
);
GO

CREATE TABLE TBL_DIRECCIONES(
INT_COD_DIRECCION INT NOT NULL PRIMARY KEY,
STR_DIRECCION VARCHAR(50),
INT_CIUDAD INT fOREIGN KEY REFERENCES TBL_CIUDADES(INT_COD_CIUDAD)
);
GO

CREATE TABLE TBL_TIPO_TELEFONO (
INT_COD_TELEFONO INT NOT NULL PRIMARY KEY,
STR_TIPO_TELEFONO VARCHAR(30)
);
GO

CREATE TABLE TBL_TELEFONOS(
INT_COD_TELEFONO INT NOT NULL PRIMARY KEY,
INT_NUMERO_TELEFONO INT,
INT_TIPO_TELEFONO INT fOREIGN KEY REFERENCES TBL_TIPO_TELEFONO(INT_COD_TELEFONO)
);
GO

CREATE TABLE TBL_PROFESORES(
INT_ID_PROFESOR INT NOT NULL PRIMARY KEY,
INT_COD_EMPLEADO INT FOREIGN KEY REFERENCES TBL_EMPLEADOS(INT_ID_EMPLEADO),
INT_COD_TIPO_DOC INT FOREIGN KEY REFERENCES TBL_TIPO_DOC(INT_COD_DOCUMENTO),
INT_COD_TELEFONO INT  FOREIGN KEY REFERENCES TBL_TELEFONOS(INT_COD_TELEFONO),
INT_COD_CIUDAD INT FOREIGN KEY REFERENCES TBL_DIRECCIONES(INT_COD_DIRECCION),
DTE_FECHA_INGRESO DATETIME NOT NULL
);
GO

CREATE TABLE TBL_TITULO_ACADEMICO(
INT_COD_TITULO INT NOT NULL PRIMARY KEY,
STR_NOMBRE VARCHAR(50) NOT NULL,
STR_DESCRIPCION VARCHAR(100)
);
GO

CREATE TABLE TBL_PROFESOR_TITULO(
INT_COD_PROFESOR INT NOT NULL FOREIGN KEY REFERENCES TBL_PROFESORES(INT_ID_PROFESOR),
INT_COD_TITULO INT NOT NULL FOREIGN KEY REFERENCES TBL_TITULO_ACADEMICO(INT_COD_TITULO),
PRIMARY KEY (INT_COD_PROFESOR, INT_COD_TITULO)
);
GO

CREATE TABLE TBL_ESTUDIANTES(
INT_ID_ESTUDIANTE INT NOT NULL PRIMARY KEY,
INT_ID_EMPLEADO INT FOREIGN KEY REFERENCES TBL_EMPLEADOS(INT_ID_EMPLEADO),
INT_COD_TIPO_DOC INT FOREIGN KEY REFERENCES TBL_TIPO_DOC(INT_COD_DOCUMENTO),
INT_COD_TELEFONO INT FOREIGN KEY REFERENCES TBL_TELEFONOS(INT_COD_TELEFONO),
INT_COD_CIUDAD INT FOREIGN KEY REFERENCES TBL_DIRECCIONES(INT_COD_DIRECCION),
STR_NOMBRE VARCHAR(40) NOT NULL,
INT_NUMERO_DOCUMENTO BIGINT NOT NULL
);
GO

CREATE TABLE TBL_FORMA_PAGO(
INT_COD_FORMA_PAGO INT NOT NULL PRIMARY KEY,
INT_ID_EMPLEADO INT FOREIGN KEY REFERENCES TBL_EMPLEADOS(INT_ID_EMPLEADO),
STR_DESCRIPCION VARCHAR(40) NOT NULL,
BOL_ACTIVO BIT NOT NULL
);
GO

CREATE TABLE TBL_INSCRIPCIONES(
INT_COD_INSCRIPCION INT NOT NULL PRIMARY KEY,
INT_ID_EMPLEADO INT FOREIGN KEY REFERENCES TBL_EMPLEADOS(INT_ID_EMPLEADO),
INT_ID_ESTUDIANTE INT NOT NULL FOREIGN KEY REFERENCES TBL_ESTUDIANTES(INT_ID_ESTUDIANTE),
INT_COD_EDICION INT,
FLT_VALOR_PAGO MONEY NOT NULL,
INT_CANTIDAD INT
);
GO

CREATE TABLE TBL_INSCRIPCION_FORMA_PAGO(
INT_COD_INSCRIPCION INT NOT NULL FOREIGN KEY REFERENCES TBL_INSCRIPCIONES(INT_COD_INSCRIPCION),
INT_COD_FORMA_PAGO INT NOT NULL FOREIGN KEY REFERENCES TBL_FORMA_PAGO(INT_COD_FORMA_PAGO),
CONSTRAINT PK_TBL_INSCRIPCION_FORMA_PAGO PRIMARY KEY (INT_COD_INSCRIPCION, INT_COD_FORMA_PAGO)
);
GO

CREATE TABLE TBL_DETALLE_INSCRIPCION(
INT_COD_DETALLE_INSCRIPCION INT NOT NULL PRIMARY KEY,
INT_COD_INSCRIPCION INT FOREIGN KEY REFERENCES TBL_INSCRIPCIONES(INT_COD_INSCRIPCION),
FLT_VALOR MONEY NOT NULL,
INT_CANTIDAD INT
);
GO

CREATE TABLE TBL_HORARIOS(
INT_COD_HORARIO INT NOT NULL PRIMARY KEY,
DTE_HORA_INICIO TIME NOT NULL,
DTE_HORA_FIN TIME NOT NULL
);
GO

CREATE TABLE TBL_DIAS(
INT_COD_DIA INT NOT NULL PRIMARY KEY,
STR_DIA VARCHAR(12) NOT NULL
);
GO

CREATE TABLE TBL_EDICION_CURSOS(
INT_COD_EDICION INT NOT NULL PRIMARY KEY,
INT_COD_CURSO INT FOREIGN KEY REFERENCES TBL_CURSOS(INT_COD_CURSO),
INT_COD_DETALLE_INSCRIPCION INT FOREIGN KEY REFERENCES TBL_DETALLE_INSCRIPCION(INT_COD_DETALLE_INSCRIPCION),
INT_ID_PROFESOR INT FOREIGN KEY REFERENCES TBL_PROFESORES(INT_ID_PROFESOR),
INT_ID_EMPLEADO INT FOREIGN KEY REFERENCES TBL_EMPLEADOS(INT_ID_EMPLEADO),
INT_COD_HORARIO INT FOREIGN KEY REFERENCES TBL_HORARIOS(INT_COD_HORARIO),
INT_COD_DIA INT FOREIGN KEY REFERENCES TBL_DIAS(INT_COD_DIA),
DTE_FECHA_INICIO DATETIME NOT NULL,
DTE_FECHA_FINAL DATETIME NOT NULL,
FLT_VALOR MONEY NOT NULL
);
GO

ALTER TABLE TBL_INSCRIPCIONES ADD FOREIGN KEY (INT_COD_EDICION) REFERENCES TBL_EDICION_CURSOS(INT_COD_EDICION);
GO

--//////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO TBL_CIUDADES (INT_COD_CIUDAD, STR_CIUDAD)
VALUES
    (1, 'Bogotá'),
    (2, 'Medellín'),
    (3, 'Cali'),
    (4, 'Barranquilla'),
    (5, 'Cartagena'),
    (6, 'Bucaramanga'),
    (7, 'Santa Marta'),
    (8, 'Ibagué'),
    (9, 'Pereira'),
    (10, 'Manizales'),
    (11, 'Cúcuta'),
    (12, 'Villavicencio'),
    (13, 'Pasto'),
    (14, 'Neiva'),
    (15, 'Armenia'),
    (16, 'Valledupar'),
    (17, 'Montería'),
    (18, 'Popayán'),
    (19, 'Sincelejo'),
    (20, 'Tunja'),
    (21, 'Riohacha'),
    (22, 'Florencia'),
    (23, 'Quibdó'),
    (24, 'Yopal'),
    (25, 'Mocoa'),
    (26, 'San Andrés'),
    (27, 'Puerto Carreño'),
    (28, 'Mitú'),
    (29, 'Leticia'),
    (30, 'Inírida'),
    (31, 'San José del Guaviare'),
    (32, 'Mitu'),
    (33, 'Quibdo'),
    (34, 'Buenaventura'),
    (35, 'Tumaco'),
    (36, 'Cienaga'),
    (37, 'Girardot'),
    (38, 'La Dorada'),
    (39, 'Arauca'),
    (40, 'Mompox'),
    (41, 'Tolú'),
    (42, 'Since'),
    (43, 'Yumbo'),
    (44, 'Ciénaga'),
    (45, 'Jamundí'),
    (46, 'La Ceja'),
    (47, 'Rionegro'),
    (48, 'Chinchiná'),
    (49, 'La Unión'),
    (50, 'Puerto Tejada');
GO
SELECT * FROM TBL_CIUDADES;

INSERT INTO TBL_DIAS (INT_COD_DIA, STR_DIA)
VALUES
    (1,'Lunes'),
    (2,'Martes'),
    (3,'Miércoles'),
    (4,'Jueves'),
    (5,'Viernes'),
    (6,'Sábado'),
    (7,'Domingo');
GO
SELECT * FROM TBL_DIAS;

INSERT INTO TBL_TIPO_DOC (INT_COD_DOCUMENTO,STR_TIPO_DOC)
VALUES
    (1,'CC'),
    (2,'TI'),
    (3,'CE'),
    (4,'NI'),
    (5,'RC'),
    (6,'PA'),
    (7,'PE');
GO
SELECT * FROM TBL_TIPO_DOC;

INSERT INTO TBL_TIPO_TELEFONO (INT_ID_TELEFONO,STR_TIPO_TELEFONO)
VALUES
    (1,'Casa'),
    (2,'Móvil'),
    (3,'Trabajo'),
    (4,'Personal'),
    (5,'Principal'),
    (6,'Fax'),
    (7,'Otro');
GO
SELECT * FROM TBL_TIPO_TELEFONO;

INSERT INTO TBL_CURSOS (INT_COD_CURSO, STR_TITULO, INT_NUMERO_HORAS)
VALUES (1, 'Desarrollo Web', 120),
	(2, 'Programaci�n Java', 150),
	(3, 'Dise�o Gr�fico', 90),
	(4, 'Marketing Digital', 80),
	(5, 'Gesti�n de Proyectos', 100),
	(6, 'Redes y Comunicaciones', 110),
	(7, 'Seguridad Inform�tica', 130),
	(8, 'Administraci�n de Empresas', 90),
	(9, 'Ingl�s para Negocios', 60),
	(10, 'Contabilidad Financiera', 80),
	(11, 'Recursos Humanos', 70),
	(12, 'Ventas y Negociaci�n', 100),
	(13, 'Desarrollo de Apps M�viles', 120),
	(14, 'Gesti�n de Calidad', 80),
	(15, 'Marketing Digital Avanzado', 110),
	(16, 'Dise�o de Interiores', 90),
	(17, 'Programaci�n Python', 130),
	(18, 'Finanzas Corporativas', 100),
	(19, 'Marketing en Redes Sociales', 80);
GO
SELECT * FROM TBL_CURSOS;

INSERT INTO TBL_TEMAS (INT_COD_TEMA, STR_NOMBRE_TEMA, STR_CONTENIDO_TEMA)
VALUES (1, 'Introducci�n al Desarrollo Web', 'Contenido del tema de introducci�n al desarrollo web'),
        (2, 'HTML y CSS', 'Contenido del tema de HTML y CSS'),
        (3, 'JavaScript', 'Contenido del tema de JavaScript'),
        (4, 'Frameworks de Desarrollo Web', 'Contenido del tema de frameworks de desarrollo web'),
        (5, 'Introducci�n a la Programaci�n Java', 'Contenido del tema de introducci�n a la programaci�n Java'),
        (6, 'Programaci�n Orientada a Objetos', 'Contenido del tema de programaci�n orientada a objetos'),
        (7, 'APIs y Librer�as en Java', 'Contenido del tema de APIs y librer�as en Java'),
        (8, 'Dise�o Gr�fico B�sico', 'Contenido del tema de dise�o gr�fico b�sico'),
        (9, 'Herramientas de Dise�o Gr�fico', 'Contenido del tema de herramientas de dise�o gr�fico'),
        (10, 'Dise�o de Logos', 'Contenido del tema de dise�o de logos'),
        (11, 'Introducci�n al Marketing Digital', 'Contenido del tema de introducci�n al marketing digital'),
        (12, 'Estrategias de Marketing en Redes', 'Contenido del tema de estrategias de marketing en redes'),
        (13, 'Gesti�n de Proyectos de Marketing', 'Contenido del tema de gesti�n de proyectos de marketing'),
        (14, 'Principios de Networking', 'Contenido del tema de principios de networking');
GO
SELECT * FROM TBL_TEMAS;

INSERT INTO TBL_CURSOS_TEMAS (INT_COD_CURSO, INT_COD_TEMA)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 5),
       (2, 6),
       (2, 7),
       (3, 8),
       (3, 9),
       (3, 10),
       (4, 11),
       (4, 13),
       (5, 14),
       (5, 6),
       (6, 1),
       (6, 3),
       (7, 7),
       (8, 4),
       (8, 5),
       (9, 9),
       (9, 11),
       (10, 13),
       (10, 14);
GO
SELECT * FROM TBL_CURSOS_TEMAS;

INSERT INTO TBL_HORARIOS (INT_COD_HORARIO, DTE_HORA_INICIO, DTE_HORA_FIN)
VALUES (1, '06:00', '08:00'),
       (2, '08:00', '10:00'),
       (3, '10:00', '12:00'),
       (4, '12:00', '14:00'),
       (5, '14:00', '16:00'),
       (6, '16:00', '18:00'),
       (7, '18:00', '20:00');
GO
SELECT * FROM TBL_HORARIOS;

INSERT INTO TBL_TITULO_ACADEMICO (INT_COD_TITULO, STR_NOMBRE, STR_DESCRIPCION)
VALUES (1, 'Licenciatura en Administraci�n de Empresas', 'T�tulo universitario en el campo de la administraci�n de empresas.'),
       (2, 'Ingenier�a Inform�tica', 'T�tulo universitario en el campo de la ingenier�a de software y sistemas inform�ticos.'),
       (3, 'T�cnico en Contabilidad', 'T�tulo t�cnico en el �rea de la contabilidad y finanzas.'),
       (4, 'Maestr�a en Marketing', 'T�tulo de posgrado en el campo del marketing y la gesti�n comercial.'),
       (5, 'T�cnico en Dise�o Gr�fico', 'T�tulo t�cnico en el �rea del dise�o gr�fico y la comunicaci�n visual.'),
       (6, 'Licenciatura en Derecho', 'T�tulo universitario en el campo del derecho y la legislaci�n.'),
       (7, 'Ingenier�a Civil', 'T�tulo universitario en el campo de la ingenier�a civil y la construcci�n.'),
       (8, 'T�cnico en Enfermer�a', 'T�tulo t�cnico en el �rea de la enfermer�a y cuidado de pacientes.'),
       (9, 'Maestr�a en Finanzas', 'T�tulo de posgrado en el campo de las finanzas y la gesti�n econ�mica.'),
       (10, 'T�cnico en Electricidad', 'T�tulo t�cnico en el �rea de la electricidad y los sistemas el�ctricos.'),
       (11, 'Licenciatura en Psicolog�a', 'T�tulo universitario en el campo de la psicolog�a y el estudio del comportamiento humano.'),
       (12, 'Ingenier�a Industrial', 'T�tulo universitario en el campo de la ingenier�a industrial y la optimizaci�n de procesos.'),
       (13, 'T�cnico en Mec�nica Automotriz', 'T�tulo t�cnico en el �rea de la mec�nica de veh�culos y reparaci�n automotriz.'),
       (14, 'Maestr�a en Recursos Humanos', 'T�tulo de posgrado en el campo de la gesti�n de recursos humanos y el talento empresarial.'),
       (15, 'T�cnico en Gastronom�a', 'T�tulo t�cnico en el �rea de la gastronom�a y las t�cnicas culinarias.'),
       (16, 'Licenciatura en Arquitectura', 'T�tulo universitario en el campo de la arquitectura y el dise�o de edificaciones.'),
       (17, 'Ingenier�a Qu�mica', 'T�tulo universitario en el campo de la ingenier�a qu�mica y los procesos industriales.'),
       (18, 'T�cnico en Programaci�n de Software', 'T�tulo t�cnico en el �rea de la programaci�n y el desarrollo de software.'),
       (19, 'Maestr�a en Administraci�n de Proyectos', 'T�tulo de posgrado en el campo de la gesti�n de proyectos y la planificaci�n estrat�gica.'),
       (20, 'T�cnico en Marketing Digital', 'T�tulo t�cnico en el �rea del marketing digital y las estrategias de publicidad en l�nea.');
GO
SELECT * FROM TBL_TITULO_ACADEMICO;

INSERT INTO TBL_PROFESORES (INT_ID_PROFESOR, DTE_FECHA_INGRESO)
VALUES (1, '2022-01-05'),
       (2, '2021-09-15'),
       (3, '2022-03-10'),
       (4, '2022-05-20'),
       (5, '2021-11-30'),
       (6, '2022-02-08'),
       (7, '2022-04-25'),
       (8, '2021-10-12'),
       (9, '2022-03-01'),
       (10, '2022-06-18'),
       (11, '2021-12-08'),
       (12, '2022-02-22'),
       (13, '2022-05-03'),
       (14, '2022-01-15'),
       (15, '2021-10-25'),
       (16, '2022-03-18'),
       (17, '2022-05-08'),
       (18, '2021-11-18'),
       (19, '2022-02-28'),
       (20, '2022-06-10'),
       (21, '2021-12-30'),
       (22, '2022-03-08'),
       (23, '2022-05-15'),
       (24, '2022-01-25'),
       (25, '2021-10-05'),
       (26, '2022-02-15'),
       (27, '2022-04-30'),
       (28, '2021-11-10'),
       (29, '2022-03-25'),
       (30, '2022-06-05');
GO
SELECT * FROM TBL_PROFESORES;

INSERT INTO TBL_PROFESOR_TITULO (INT_COD_PROFESOR, INT_COD_TITULO)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10),
       (11, 11),
       (12, 12),
       (13, 13),
       (14, 14),
       (15, 15),
       (16, 16),
       (17, 17),
       (18, 18),
       (19, 19),
       (20, 20),
       (21, 11),
       (22, 12),
       (23, 13),
       (24, 14),
       (25, 15),
       (26, 16),
       (27, 17),
       (28, 18),
       (29, 19),
       (30, 10);
GO
SELECT * FROM TBL_PROFESOR_TITULO;

INSERT INTO TBL_EMPLEADOS (INT_ID_EMPLEADO, STR_NOMBRE, INT_CEDULA, DTE_FECHA_NACIMIENTO)
VALUES (1, 'Juan P�rez', 1234567890, '1990-01-15'),
(2, 'Mar�a L�pez', 2345678901, '1985-05-20'),
(3, 'Pedro G�mez', 3456789012, '1992-11-10'),
(4, 'Ana Rodr�guez', 4567890123, '1988-07-03'),
(5, 'Luisa Mart�nez', 5678901234, '1995-03-28'),
(6, 'Carlos Herrera', 6789012345, '1991-09-12'),
(7, 'Laura Torres', 7890123456, '1987-04-25'),
(8, 'Mario S�nchez', 8901234567, '1993-12-18'),
(9, 'Sof�a Jim�nez', 9012345678, '1989-08-07'),
(10, 'Andr�s Castro', 1234509876, '1994-02-22');
SELECT * FROM TBL_EMPLEADOS;
GO

INSERT INTO TBL_ESTUDIANTES (INT_ID_ESTUDIANTE, STR_NOMBRE, INT_NUMERO_DOCUMENTO)
VALUES (1, 'Ana Garc�a', 9876543210),
(2, 'Luis Gonz�lez', 8765432109),
(3, 'Mar�a Torres', 7654321098),
(4, 'Juan L�pez', 6543210987),
(5, 'Pedro Mart�nez', 5432109876),
(6, 'Laura S�nchez', 4321098765),
(7, 'Carlos Rodr�guez', 3210987654),
(8, 'Sof�a Herrera', 2109876543),
(9, 'Mario Castro', 1098765432),
(10, 'Andrea Jim�nez', 0987654321),
(11, 'Fernando P�rez', 9876543210),
(12, 'Julia Gonz�lez', 8765432109),
(13, 'Gabriel Torres', 7654321098),
(14, 'Mariana L�pez', 6543210987),
(15, 'Alejandro Mart�nez', 5432109876),
(16, 'Valentina S�nchez', 4321098765),
(17, 'Diego Rodr�guez', 3210987654),
(18, 'Camila Herrera', 2109876543),
(19, 'Lucas Castro', 1098765432),
(20, 'Isabella Jim�nez', 0987654321),
(21, 'Emilio P�rez', 9876543210),
(22, 'Renata Gonz�lez', 8765432109),
(23, 'Maximiliano Torres', 7654321098),
(24, 'Valeria L�pez', 6543210987),
(25, 'Thiago Mart�nez', 5432109876),
(26, 'Emma S�nchez', 4321098765),
(27, 'Joaqu�n Rodr�guez', 3210987654),
(28, 'Catalina Herrera', 2109876543),
(29, 'Nicol�s Castro', 1098765432),
(30, 'Valentina G�mez', 0987654321),
(31, 'Santiago Vargas', 9876543210),
(32, 'Martina Silva', 8765432109),
(33, 'Benjam�n Molina', 7654321098),
(34, 'Luc�a Torres', 6543210987),
(35, 'Mateo Gonz�lez', 5432109876),
(36, 'Emilia L�pez', 4321098765),
(37, 'Sebasti�n Ram�rez', 3210987654),
(38, 'Isabella Castro', 2109876543),
(39, 'Dylan Morales', 1098765432),
(40, 'Valentina Hern�ndez', 0987654321),
(41, 'Sebasti�n Vargas', 9876543210),
(42, 'Emma Silva', 8765432109),
(43, 'Joaqu�n Molina', 7654321098),
(44, 'Isabella Torres', 6543210987),
(45, 'Gabriel Gonz�lez', 5432109876),
(46, 'Valentina L�pez', 4321098765),
(47, 'Thiago Ram�rez', 3210987654),
(48, 'Sof�a Castro', 2109876543),
(49, 'Lucas Morales', 1098765432),
(50, 'M�a Hern�ndez', 0987654321);
SELECT * FROM TBL_ESTUDIANTES;
GO

INSERT INTO TBL_FORMA_PAGO(INT_COD_FORMA_PAGO, STR_DESCRIPCION, BOL_ACTIVO)
VALUES
    (1, 'Tarjeta de crédito', 1),
    (2, 'Transferencia bancaria', 1),
    (3, 'Efectivo', 1),
    (4, 'Cheque', 1),
    (5, 'PayPal', 1),
    (6, 'Tarjeta de débito', 1),
    (7, 'Pago móvil', 1),
    (8, 'Depósito bancario', 1),
    (9, 'Transferencia electrónica', 1);
GO
SELECT * FROM TBL_FORMA_PAGO;
--=================Relacionada con: TBL_CURSOS=================

CREATE PROCEDURE sp_BuscarTodasInscripciones
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si existen inscripciones
    IF NOT EXISTS (SELECT 1 FROM TBL_INSCRIPCIONES)
    BEGIN
        RAISERROR('No se encontraron inscripciones.', 16, 1);
        RETURN;
    END

    -- Obtener todas las inscripciones
    SELECT INT_COD_INSCRIPCION, INT_ID_EMPLEADO, INT_ID_ESTUDIANTE, INT_COD_EDICION, FLT_VALOR_PAGO, INT_CANTIDAD
    FROM TBL_INSCRIPCIONES;
END
GO
--EXEC sp_BuscarTodasInscripciones;

CREATE PROCEDURE sp_BuscarCursoPorCodigo
(
    @COD_CURSO INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM TBL_CURSOS
    WHERE INT_COD_CURSO = @COD_CURSO;
END
GO
--EXEC sp_BuscarCursoPorCodigo @COD_CURSO = 1;

CREATE PROCEDURE sp_BuscarTodosLosCursos
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM TBL_CURSOS;
END
GO
--EXEC sp_BuscarTodosLosCursos;

CREATE PROCEDURE sp_InsertarNuevoCurso
(
    @INT_COD_CURSO INT,
    @STR_TITULO VARCHAR(30),
    @INT_NUMERO_HORAS INT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si el curso ya existe
        IF EXISTS (SELECT 1 FROM TBL_CURSOS WHERE INT_COD_CURSO = @INT_COD_CURSO)
        BEGIN
            RAISERROR('El curso con el c�digo %d ya existe.', 16, 1, @INT_COD_CURSO);
            ROLLBACK;
            RETURN;
        END

        -- Insertar el nuevo curso
        INSERT INTO TBL_CURSOS (INT_COD_CURSO, STR_TITULO, INT_NUMERO_HORAS)
        VALUES (@INT_COD_CURSO, @STR_TITULO, @INT_NUMERO_HORAS);

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH;
END
GO
--EXEC sp_InsertarNuevoCurso @INT_COD_CURSO = 20, @STR_TITULO = 'Nuevo Curso', @INT_NUMERO_HORAS = 10;

CREATE PROCEDURE sp_ModificarCurso
(
    @INT_COD_CURSO INT,
    @STR_TITULO VARCHAR(30),
    @INT_NUMERO_HORAS INT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si el curso existe
        IF NOT EXISTS (SELECT 1 FROM TBL_CURSOS WHERE INT_COD_CURSO = @INT_COD_CURSO)
        BEGIN
            RAISERROR('El curso con el c�digo %d no existe.', 16, 1, @INT_COD_CURSO);
            ROLLBACK;
            RETURN;
        END

        -- Modificar el curso
        UPDATE TBL_CURSOS
        SET STR_TITULO = @STR_TITULO,
            INT_NUMERO_HORAS = @INT_NUMERO_HORAS
        WHERE INT_COD_CURSO = @INT_COD_CURSO;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH;
END
GO

--EXEC sp_ModificarCurso @INT_COD_CURSO = 20, @STR_TITULO = 'Nuevo T�tulo', @INT_NUMERO_HORAS = 20;

CREATE PROCEDURE sp_EliminarCurso
(
    @INT_COD_CURSO INT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si el curso existe
        IF NOT EXISTS (SELECT 1 FROM TBL_CURSOS WHERE INT_COD_CURSO = @INT_COD_CURSO)
        BEGIN
            RAISERROR('El curso con el c�digo %d no existe.', 16, 1, @INT_COD_CURSO);
            ROLLBACK;
            RETURN;
        END

        -- Eliminar el curso
        DELETE FROM TBL_CURSOS WHERE INT_COD_CURSO = @INT_COD_CURSO;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH;
END
GO
--EXEC sp_EliminarCurso @INT_COD_CURSO = 20;

--=================Relacionada con: TBL_INSCRIPCIONES=================

CREATE PROCEDURE sp_BuscarInscripcion
(
    @INT_COD_INSCRIPCION INT
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si la inscripci�n existe
    IF NOT EXISTS (SELECT 1 FROM TBL_INSCRIPCIONES WHERE INT_COD_INSCRIPCION = @INT_COD_INSCRIPCION)
    BEGIN
        RAISERROR('La inscripci�n con el c�digo %d no existe.', 16, 1, @INT_COD_INSCRIPCION);
        RETURN;
    END

    -- Obtener los datos de la inscripci�n
    SELECT INT_COD_INSCRIPCION, INT_ID_EMPLEADO, INT_ID_ESTUDIANTE, INT_COD_EDICION, FLT_VALOR_PAGO, INT_CANTIDAD
    FROM TBL_INSCRIPCIONES
    WHERE INT_COD_INSCRIPCION = @INT_COD_INSCRIPCION;
END
GO
--EXEC sp_BuscarInscripcion @INT_COD_INSCRIPCION = 1;


CREATE PROCEDURE sp_InsertarInscripcion
(
    @INT_ID_EMPLEADO INT,
    @INT_ID_ESTUDIANTE INT,
    @INT_COD_EDICION INT,
    @FLT_VALOR_PAGO MONEY,
    @INT_CANTIDAD INT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si el empleado existe
        IF NOT EXISTS (SELECT 1 FROM TBL_EMPLEADOS WHERE INT_ID_EMPLEADO = @INT_ID_EMPLEADO)
        BEGIN
            RAISERROR('El empleado con el ID %d no existe.', 16, 1, @INT_ID_EMPLEADO);
            ROLLBACK;
            RETURN;
        END

        -- Verificar si el estudiante existe
        IF NOT EXISTS (SELECT 1 FROM TBL_ESTUDIANTES WHERE INT_ID_ESTUDIANTE = @INT_ID_ESTUDIANTE)
        BEGIN
            RAISERROR('El estudiante con el ID %d no existe.', 16, 1, @INT_ID_ESTUDIANTE);
            ROLLBACK;
            RETURN;
        END

        -- Verificar si la edici�n del curso existe
        IF NOT EXISTS (SELECT 1 FROM TBL_EDICION_CURSOS WHERE INT_COD_EDICION = @INT_COD_EDICION)
        BEGIN
            RAISERROR('La edici�n del curso con el c�digo %d no existe.', 16, 1, @INT_COD_EDICION);
            ROLLBACK;
            RETURN;
        END

        -- Insertar la nueva inscripci�n
        INSERT INTO TBL_INSCRIPCIONES (INT_ID_EMPLEADO, INT_ID_ESTUDIANTE, INT_COD_EDICION, FLT_VALOR_PAGO, INT_CANTIDAD)
        VALUES (@INT_ID_EMPLEADO, @INT_ID_ESTUDIANTE, @INT_COD_EDICION, @FLT_VALOR_PAGO, @INT_CANTIDAD);

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH;
END
GO
--EXEC sp_InsertarInscripcion @INT_ID_EMPLEADO = 1, @INT_ID_ESTUDIANTE = 1, @INT_COD_EDICION = 1, @FLT_VALOR_PAGO = 200.00, @INT_CANTIDAD = 1;

CREATE PROCEDURE sp_ModificarInscripcion
(
    @INT_COD_INSCRIPCION INT,
    @FLT_VALOR_PAGO MONEY,
    @INT_CANTIDAD INT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si la inscripci�n existe
        IF NOT EXISTS (SELECT 1 FROM TBL_INSCRIPCIONES WHERE INT_COD_INSCRIPCION = @INT_COD_INSCRIPCION)
        BEGIN
            RAISERROR('La inscripci�n con el c�digo %d no existe.', 16, 1, @INT_COD_INSCRIPCION);
            ROLLBACK;
            RETURN;
        END

        -- Modificar la inscripci�n
        UPDATE TBL_INSCRIPCIONES
        SET FLT_VALOR_PAGO = @FLT_VALOR_PAGO,
            INT_CANTIDAD = @INT_CANTIDAD
        WHERE INT_COD_INSCRIPCION = @INT_COD_INSCRIPCION;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH;
END
GO
--EXEC sp_ModificarInscripcion @INT_COD_INSCRIPCION = 1, @FLT_VALOR_PAGO = 150.00, @INT_CANTIDAD = 2;

CREATE PROCEDURE sp_EliminarInscripcion
(
    @INT_COD_INSCRIPCION INT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si la inscripci�n existe
        IF NOT EXISTS (SELECT 1 FROM TBL_INSCRIPCIONES WHERE INT_COD_INSCRIPCION = @INT_COD_INSCRIPCION)
        BEGIN
            RAISERROR('La inscripci�n con el c�digo %d no existe.', 16, 1, @INT_COD_INSCRIPCION);
            ROLLBACK;
            RETURN;
        END

        -- Eliminar la inscripci�n
        DELETE FROM TBL_INSCRIPCIONES WHERE INT_COD_INSCRIPCION = @INT_COD_INSCRIPCION;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH;
END
GO
--EXEC sp_EliminarInscripcion @INT_COD_INSCRIPCION = 1;

--=================Relacionada con: TBL_DETALLE_INSCRIPCION=================

CREATE PROCEDURE sp_BuscarDetalleInscripcion
    @INT_COD_DETALLE_INSCRIPCION INT,
    @FLT_VALOR MONEY OUTPUT,
    @INT_CANTIDAD INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Inicializar las variables de salida
    SET @FLT_VALOR = NULL;
    SET @INT_CANTIDAD = NULL;

    BEGIN TRY
        -- Verificar si el detalle de inscripci�n existe
        IF NOT EXISTS (SELECT 1 FROM TBL_DETALLE_INSCRIPCION WHERE INT_COD_DETALLE_INSCRIPCION = @INT_COD_DETALLE_INSCRIPCION)
        BEGIN
            THROW 50001, 'El detalle de inscripci�n no existe.', 1;
        END

        -- Obtener los datos del detalle de inscripci�n
        SELECT @FLT_VALOR = FLT_VALOR, @INT_CANTIDAD = INT_CANTIDAD
        FROM TBL_DETALLE_INSCRIPCION
        WHERE INT_COD_DETALLE_INSCRIPCION = @INT_COD_DETALLE_INSCRIPCION;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH;
END
GO
--DECLARE @FLT_VALOR_BUSCADO MONEY;
--DECLARE @INT_CANTIDAD_BUSCADA INT;

--EXEC sp_BuscarDetalleInscripcion @INT_COD_DETALLE_INSCRIPCION = 1, @FLT_VALOR = @FLT_VALOR_BUSCADO OUTPUT, @INT_CANTIDAD = @INT_CANTIDAD_BUSCADA OUTPUT;

--SELECT @FLT_VALOR_BUSCADO AS FLT_VALOR, @INT_CANTIDAD_BUSCADA AS INT_CANTIDAD;

CREATE PROCEDURE sp_BuscarTodosDetallesInscripcion
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Verificar si existen detalles de inscripci�n
        IF NOT EXISTS (SELECT 1 FROM TBL_DETALLE_INSCRIPCION)
        BEGIN
            THROW 50001, 'No existen detalles de inscripci�n.', 1;
        END

        -- Obtener todos los detalles de inscripci�n
        SELECT INT_COD_DETALLE_INSCRIPCION, FLT_VALOR, INT_CANTIDAD
        FROM TBL_DETALLE_INSCRIPCION;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH;
END
GO
--EXEC sp_BuscarTodosDetallesInscripcion;


CREATE PROCEDURE sp_InsertarDetalleInscripcion
    @INT_COD_DETALLE_INSCRIPCION INT,
    @FLT_VALOR MONEY,
    @INT_CANTIDAD INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si el detalle de inscripci�n ya existe
        IF EXISTS (SELECT 1 FROM TBL_DETALLE_INSCRIPCION WHERE INT_COD_DETALLE_INSCRIPCION = @INT_COD_DETALLE_INSCRIPCION)
        BEGIN
            THROW 50001, 'El detalle de inscripci�n ya existe.', 1;
        END

        -- Insertar el nuevo detalle de inscripci�n
        INSERT INTO TBL_DETALLE_INSCRIPCION (INT_COD_DETALLE_INSCRIPCION, FLT_VALOR, INT_CANTIDAD)
        VALUES (@INT_COD_DETALLE_INSCRIPCION, @FLT_VALOR, @INT_CANTIDAD);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END
GO
--EXEC sp_InsertarDetalleInscripcion @INT_COD_DETALLE_INSCRIPCION = 1, @FLT_VALOR = 100.00, @INT_CANTIDAD = 2;

CREATE PROCEDURE sp_ModificarDetalleInscripcion
    @INT_COD_DETALLE_INSCRIPCION INT,
    @FLT_VALOR MONEY,
    @INT_CANTIDAD INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si el detalle de inscripci�n existe
        IF NOT EXISTS (SELECT 1 FROM TBL_DETALLE_INSCRIPCION WHERE INT_COD_DETALLE_INSCRIPCION = @INT_COD_DETALLE_INSCRIPCION)
        BEGIN
            THROW 50001, 'El detalle de inscripci�n no existe.', 1;
        END

        -- Modificar el detalle de inscripci�n
        UPDATE TBL_DETALLE_INSCRIPCION
        SET FLT_VALOR = @FLT_VALOR,
            INT_CANTIDAD = @INT_CANTIDAD
        WHERE INT_COD_DETALLE_INSCRIPCION = @INT_COD_DETALLE_INSCRIPCION;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END
GO
--EXEC sp_ModificarDetalleInscripcion @INT_COD_DETALLE_INSCRIPCION = 1, @FLT_VALOR = 150.00, @INT_CANTIDAD = 3;

CREATE PROCEDURE sp_EliminarDetalleInscripcion
    @INT_COD_DETALLE_INSCRIPCION INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar si el detalle de inscripci�n existe
        IF NOT EXISTS (SELECT 1 FROM TBL_DETALLE_INSCRIPCION WHERE INT_COD_DETALLE_INSCRIPCION = @INT_COD_DETALLE_INSCRIPCION)
        BEGIN
            THROW 50001, 'El detalle de inscripci�n no existe.', 1;
        END

        -- Eliminar el detalle de inscripci�n
        DELETE FROM TBL_DETALLE_INSCRIPCION WHERE INT_COD_DETALLE_INSCRIPCION = @INT_COD_DETALLE_INSCRIPCION;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END
GO
--EXEC sp_EliminarDetalleInscripcion @INT_COD_DETALLE_INSCRIPCION = 1;
