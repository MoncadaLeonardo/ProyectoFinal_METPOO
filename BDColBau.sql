CREATE DATABASE PersonalColBau
GO
USE PersonalColBau
GO

--Tabla para los cargos o roles dentro de la empresa
CREATE TABLE Cargos(
IdCargo INT PRIMARY KEY IDENTITY,
Cargo VARCHAR (50) NOT NULL,
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditoría
FechaRegistro DATETIME NOT NULL, --Pistas de Auditoría
IdUsuarioActualiza INT NULL, --Pistas de Auditoría
FechaActualizacion DATETIME NULL --Pistas de Auditoría
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
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditoría
FechaRegistro DATETIME NOT NULL, --Pistas de Auditoría
IdUsuarioActualiza INT NULL, --Pistas de Auditoría
FechaActualizacion DATETIME NULL --Pistas de Auditoría
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
AñosRelacion INT NULL,
NombresHijos VARCHAR (100) NULL,
ApellidosHijos VARCHAR (100) NULL,
FechaNacimientoHijos DATETIME NULL,
EdadHijos INT NULL,
IdColaborador INT FOREIGN KEY REFERENCES Colaboradores (IdColaborador),
IdEstadoCivil INT FOREIGN KEY REFERENCES EstadosCiviles (IdEstadoCivil),
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditoría
FechaRegistro DATETIME NOT NULL, --Pistas de Auditoría
IdUsuarioActualiza INT NULL, --Pistas de Auditoría
FechaActualizacion DATETIME NULL --Pistas de Auditoría
);

--Tabla de Datos Académicos
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
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditoría
FechaRegistro DATETIME NOT NULL, --Pistas de Auditoría
IdUsuarioActualiza INT NULL, --Pistas de Auditoría
FechaActualizacion DATETIME NULL --Pistas de Auditoría
);

--Tabla de relación de aspecto con el cargo (En el CBMasaya)
CREATE TABLE RolesInstitucion(
IdRolInstitucion INT PRIMARY KEY IDENTITY,
FechaIngreso DATETIME NOT NULL,
TiempoLaboral INT NOT NULL,
AreaTrabajo VARCHAR (100) NOT NULL,
ResponsableInmediato VARCHAR (100) NOT NULL,
Responsabilidades VARCHAR (300) NOT NULL,
IdColaborador INT FOREIGN KEY REFERENCES Colaboradores (IdColaborador),
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditoría
FechaRegistro DATETIME NOT NULL, --Pistas de Auditoría
IdUsuarioActualiza INT NULL, --Pistas de Auditoría
FechaActualizacion DATETIME NULL --Pistas de Auditoría
);

--Tabla que indica si el colaborador tiene relacion laboral con otra institucion
CREATE TABLE InstitucionesAjenas(
IdInstitucionAjena INT PRIMARY KEY IDENTITY,
NombreInstitucion VARCHAR (100) NULL
);

--Tabla de la relación laboral de un colaborador con alguna otra institución. 
CREATE TABLE RelacionesLaborales(
IdRelacionLaboral INT PRIMARY KEY IDENTITY,
CargoInstitucionAjena VARCHAR (100),
AñosRelacionAjena INT NOT NULL,
IdInstitucionAjena INT FOREIGN KEY REFERENCES InstitucionesAjenas (IdInstitucionAjena),
IdColaborador INT FOREIGN KEY REFERENCES Colaboradores (IdColaborador),
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditoría
FechaRegistro DATETIME NOT NULL, --Pistas de Auditoría
IdUsuarioActualiza INT NULL, --Pistas de Auditoría
FechaActualizacion DATETIME NULL --Pistas de Auditoría
);

--Tabla de Experiencia Laboral (SOLO PARA DOCENCIA)
CREATE TABLE ExperienciasLaborales(
IdExperienciaLaboral INT PRIMARY KEY IDENTITY,
InicioLaborDocente DATETIME NOT NULL,
NombreEmpresa VARCHAR (100) NOT NULL,
PuestoDesempeñado VARCHAR (100) NOT NULL,
TiempoLabor VARCHAR (20) NOT NULL,
MotivoFinLabores VARCHAR (300) NOT NULL,
IdColaborador INT FOREIGN KEY REFERENCES Colaboradores (IdColaborador),
Activo BIT NOT NULL DEFAULT (1), 
IdUsuarioRegistro INT NOT NULL, --Pistas de Auditoría
FechaRegistro DATETIME NOT NULL, --Pistas de Auditoría
IdUsuarioActualiza INT NULL, --Pistas de Auditoría
FechaActualizacion DATETIME NULL --Pistas de Auditoría
);
