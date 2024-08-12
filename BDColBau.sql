CREATE DATABASE PersonalColBau
GO
USE PersonalColBau
GO

--Tabla para los cargos o roles dentro de la empresa
CREATE TABLE Cargos(
IdCargo INT PRIMARY KEY IDENTITY,
Cargo VARCHAR (50) NOT NULL,
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditor�a
FechaRegistro DATETIME NOT NULL, --Pistas de Auditor�a
IdUsuarioActualiza INT NULL, --Pistas de Auditor�a
FechaActualizacion DATETIME NULL --Pistas de Auditor�a
);

--Tabla de registro de cada colaborador.
CREATE TABLE Colaboradores(
IdColaborador INT PRIMARY KEY IDENTITY,
Nombres VARCHAR (100) NOT NULL,
Apellidos VARCHAR (100) NOT NULL,
DepartamentoResidencia VARCHAR (50) NOT NULL,
MunicipioRecide VARCHAR (50) NOT NULL,
FechaNacimiento DATETIME NOT NULL,
Edad INT NOT NULL,
CedulaIdentidad VARCHAR (20) NOT NULL,
NumeroSeguroSocial VARCHAR (20) NOT NULL,
TelefonoMovil VARCHAR (15) NULL,
TelefonoConvencional VARCHAR (20) NULL,
CorreoElectronico VARCHAR (50) NULL,
DireccionDomiciliarActual VARCHAR (250) NOT NULL,
Religion VARCHAR (50) NULL,
Iglesia VARCHAR (100) NULL,
IdCargo INT FOREIGN KEY REFERENCES Cargos (IdCargo),
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditor�a
FechaRegistro DATETIME NOT NULL, --Pistas de Auditor�a
IdUsuarioActualiza INT NULL, --Pistas de Auditor�a
FechaActualizacion DATETIME NULL --Pistas de Auditor�a
);

-- Tabla de Estado civil colaboradores.
CREATE TABLE EstadosCiviles(
IdEstadoCivil INT PRIMARY KEY IDENTITY,
EstadoCivil VARCHAR (50) NOT NULL
);

--Tabla de registro de parejas e hijos de colaboradores.
CREATE TABLE Anexos(
IdAnexo INT PRIMARY KEY IDENTITY,
NombresConyuge VARCHAR (100) NULL,
ApellidosConyuge VARCHAR (100) NULL,
A�osRelacion INT NULL,
NombresHijos VARCHAR (100) NULL,
ApellidosHijos VARCHAR (100) NULL,
FechaNacimientoHijos DATETIME NULL,
EdadHijos INT NULL,
IdColaborador INT FOREIGN KEY REFERENCES Colaboradores (IdColaborador),
IdEstadoCivil INT FOREIGN KEY REFERENCES EstadosCiviles (IdEstadoCivil),
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditor�a
FechaRegistro DATETIME NOT NULL, --Pistas de Auditor�a
IdUsuarioActualiza INT NULL, --Pistas de Auditor�a
FechaActualizacion DATETIME NULL --Pistas de Auditor�a
);

--Tabla de Datos Acad�micos
CREATE TABLE DatosAcademicos(
IdDatoAcademico INT PRIMARY KEY IDENTITY,
Primaria VARCHAR (250) NULL,
Secundaria VARCHAR (250) NULL,
Universidad VARCHAR (250) NULL,
Tecnico VARCHAR (250) NULL,
OtrosEstudios VARCHAR (250) NULL,
EstudioActualizacion VARCHAR (250) NULL,
IdColaborador INT FOREIGN KEY REFERENCES Colaboradores (IdColaborador),
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditor�a
FechaRegistro DATETIME NOT NULL, --Pistas de Auditor�a
IdUsuarioActualiza INT NULL, --Pistas de Auditor�a
FechaActualizacion DATETIME NULL --Pistas de Auditor�a
);

--Tabla de relaci�n de aspecto con el cargo (En el CBMasaya)
CREATE TABLE RolesInstitucion(
IdRolInstitucion INT PRIMARY KEY IDENTITY,
FechaIngreso DATETIME NOT NULL,
TiempoLaboral INT NOT NULL,
AreaTrabajo VARCHAR (100) NOT NULL,
ResponsableInmediato VARCHAR (100) NOT NULL,
Responsabilidades VARCHAR (300) NOT NULL,
IdColaborador INT FOREIGN KEY REFERENCES Colaboradores (IdColaborador),
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditor�a
FechaRegistro DATETIME NOT NULL, --Pistas de Auditor�a
IdUsuarioActualiza INT NULL, --Pistas de Auditor�a
FechaActualizacion DATETIME NULL --Pistas de Auditor�a
);

--Tabla que indica si el colaborador tiene relacion laboral con otra institucion
CREATE TABLE InstitucionesAjenas(
IdInstitucionAjena INT PRIMARY KEY IDENTITY,
NombreInstitucion VARCHAR (100) NULL
);

--Tabla de la relaci�n laboral de un colaborador con alguna otra instituci�n. 
CREATE TABLE RelacionesLaborales(
IdRelacionLaboral INT PRIMARY KEY IDENTITY,
CargoInstitucionAjena VARCHAR (100),
A�osRelacionAjena INT NOT NULL,
IdInstitucionAjena INT FOREIGN KEY REFERENCES InstitucionesAjenas (IdInstitucionAjena),
IdColaborador INT FOREIGN KEY REFERENCES Colaboradores (IdColaborador),
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditor�a
FechaRegistro DATETIME NOT NULL, --Pistas de Auditor�a
IdUsuarioActualiza INT NULL, --Pistas de Auditor�a
FechaActualizacion DATETIME NULL --Pistas de Auditor�a
);

--Tabla de Experiencia Laboral (SOLO PARA DOCENCIA)
CREATE TABLE ExperienciasLaborales(
IdExperienciaLaboral INT PRIMARY KEY IDENTITY,
InicioLaborDocente DATETIME NOT NULL,
NombreEmpresa VARCHAR (100) NOT NULL,
PuestoDesempe�ado VARCHAR (100) NOT NULL,
TiempoLabor VARCHAR (20) NOT NULL,
MotivoFinLabores VARCHAR (300) NOT NULL,
IdColaborador INT FOREIGN KEY REFERENCES Colaboradores (IdColaborador),
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditor�a
FechaRegistro DATETIME NOT NULL, --Pistas de Auditor�a
IdUsuarioActualiza INT NULL, --Pistas de Auditor�a
FechaActualizacion DATETIME NULL --Pistas de Auditor�a
);
