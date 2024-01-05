USE [Hube_PRE]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActividadesColores]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadesColores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codActividad] [nvarchar](50) NULL,
	[color] [nvarchar](10) NULL,
 CONSTRAINT [PK_ActividadesColores] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActividadesSemanal]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadesSemanal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idCuadrilla] [int] NULL,
	[semana] [int] NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[tipo] [char](1) NOT NULL,
	[idCNC] [int] NULL,
	[unidadMedida] [nvarchar](10) NULL,
	[cantidadTotal] [decimal](14, 4) NULL,
	[rendimiento] [numeric](12, 6) NULL,
	[recursos] [int] NULL,
	[horasJornada] [int] NULL,
	[duracionTeorica] [numeric](12, 2) NULL,
	[observaciones] [nvarchar](500) NULL,
	[L] [decimal](14, 4) NOT NULL,
	[M] [numeric](12, 2) NOT NULL,
	[X] [numeric](12, 2) NOT NULL,
	[J] [numeric](12, 2) NOT NULL,
	[V] [numeric](12, 2) NOT NULL,
	[S] [numeric](12, 2) NOT NULL,
	[D] [numeric](12, 2) NOT NULL,
	[usuarioCreacion] [nvarchar](50) NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
	[recurrente] [bit] NULL,
 CONSTRAINT [PK_ActividadesSemanal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Unique_ActSem] UNIQUE NONCLUSTERED 
(
	[idCuadrilla] ASC,
	[semana] ASC,
	[codActividad] ASC,
	[codZonaControl] ASC,
	[tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActividadesSemanalNC]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadesSemanalNC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idActividadSemanal] [int] NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[unidadMedida] [nvarchar](10) NULL,
	[cantidadTotal] [decimal](14, 4) NOT NULL,
	[rendimiento] [numeric](12, 2) NULL,
	[duracionTeorica] [numeric](12, 2) NULL,
	[costeUnitario] [numeric](12, 2) NULL,
 CONSTRAINT [PK_ActividadesSemanalNC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActividadesSemanalObjetos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadesSemanalObjetos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idActividadSemanal] [int] NOT NULL,
	[idObjeto] [uniqueidentifier] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_ActividadesSemanalObjetos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idActividadSemanal] ASC,
	[idObjeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActividadesSemanalObjetosPercentages]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadesSemanalObjetosPercentages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idActividadSemanalObjeto] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[porcentaje] [decimal](12, 4) NOT NULL,
 CONSTRAINT [PK_ActSemObjPerc_Id] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_codes] UNIQUE NONCLUSTERED 
(
	[idActividadSemanalObjeto] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActividadesSemanalOperarios]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadesSemanalOperarios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idCuadrilla] [int] NOT NULL,
	[dia] [datetime] NOT NULL,
	[operarios] [int] NOT NULL,
	[jornada] [decimal](12, 1) NOT NULL,
 CONSTRAINT [PK_ActividadesSemanalOperarios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ActividadesSemanalOperarios_UQ] UNIQUE NONCLUSTERED 
(
	[idCuadrilla] ASC,
	[dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbaranesCAB]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbaranesCAB](
	[idObra] [varchar](50) NOT NULL,
	[idProveedor] [varchar](20) NOT NULL,
	[idAlbaran] [int] IDENTITY(56294,1) NOT NULL,
	[numAlbaran] [varchar](20) NOT NULL,
	[Contrato] [varchar](20) NOT NULL,
	[Fecha] [int] NOT NULL,
	[Presto] [varchar](1) NOT NULL,
 CONSTRAINT [AlbaranesCAB_PK] PRIMARY KEY CLUSTERED 
(
	[idAlbaran] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbaranesLIN]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbaranesLIN](
	[idAlbaran] [int] NOT NULL,
	[idLinea] [int] IDENTITY(69720,1) NOT NULL,
	[Orden] [int] NOT NULL,
	[Capitulo] [varchar](20) NULL,
	[Partida] [varchar](20) NULL,
	[Unitario] [varchar](20) NULL,
	[Concepto] [varchar](1000) NULL,
	[Unidades] [decimal](18, 3) NOT NULL,
	[Precio] [decimal](18, 4) NOT NULL,
	[Importe] [decimal](18, 3) NOT NULL,
	[ProductoQuimico] [varchar](20) NULL,
	[Trazabilidad] [varchar](20) NULL,
	[NumeroSerie] [varchar](20) NULL,
	[Responsable] [varchar](50) NULL,
	[Maquinaria] [bit] NULL,
	[Tipo] [char](2) NULL,
	[GUID] [varchar](50) NULL,
	[HoraFabricacion] [time](7) NULL,
	[HoraVertido] [time](7) NULL,
	[Ensayo] [bit] NULL,
	[Rotura7] [decimal](18, 2) NULL,
	[Rotura28] [decimal](18, 2) NULL,
	[Comentarios] [varchar](max) NULL,
	[codRecurso] [varchar](50) NULL,
	[codActividad] [varchar](50) NULL,
	[codZonaControl] [varchar](50) NULL,
	[idAlmacen] [int] NULL,
	[codNotaClave] [varchar](50) NULL,
	[incidencia] [bit] NOT NULL,
	[CantidadNc] [numeric](18, 4) NULL,
	[idCategoria] [int] NULL,
	[Observaciones] [nvarchar](500) NULL,
 CONSTRAINT [PK_AlbaranesLIN] PRIMARY KEY CLUSTERED 
(
	[idLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Almacenes]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacenes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
	[activo] [bit] NOT NULL,
	[fechaUltimoReparto] [datetime] NULL,
 CONSTRAINT [PK_Almacenes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlmacenesSemanal]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlmacenesSemanal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idAlmacen] [int] NOT NULL,
	[semana] [int] NOT NULL,
	[cerrado] [bit] NOT NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_AlmacenesSemanal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlmacenesSemanalConsumos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlmacenesSemanalConsumos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idAlmacen] [int] NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[unidades] [numeric](18, 3) NULL,
	[temporal] [bit] NOT NULL,
	[CodProveedor] [varchar](20) NOT NULL,
	[Precio] [numeric](18, 4) NOT NULL,
	[fecha] [date] NOT NULL,
	[incidencia] [bit] NOT NULL,
 CONSTRAINT [PK_AlmacenesSemanalConsumos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlmacenesSemanalRecursos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlmacenesSemanalRecursos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idAlmacen] [int] NOT NULL,
	[semana] [int] NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[idResourceGroup] [int] NOT NULL,
	[cantidad] [numeric](14, 2) NOT NULL,
	[unidades] [numeric](14, 2) NOT NULL,
	[repartido] [bit] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
	[Incidencia] [bit] NOT NULL,
 CONSTRAINT [PK_AlmacenesSemanalRecursos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlmacenesSemanalRecZonaControl]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlmacenesSemanalRecZonaControl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idAlmacenSemanalRec] [int] NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[unidades] [numeric](14, 2) NOT NULL,
 CONSTRAINT [PK_AlmacenesSemanalRecZonaControl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnexosContratos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnexosContratos](
	[NumAnexo] [int] NOT NULL,
	[NumContrato] [varchar](50) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[Importe] [decimal](10, 2) NOT NULL,
	[Estado] [varchar](250) NULL,
	[Comentarios] [varchar](250) NULL,
	[FechaEnvio] [date] NULL,
	[CondicionesEnvio] [varchar](250) NULL,
 CONSTRAINT [PK_Anexos] PRIMARY KEY CLUSTERED 
(
	[NumAnexo] ASC,
	[NumContrato] ASC,
	[idObra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppSyncVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppSyncVersion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[syncname] [varchar](50) NOT NULL,
	[version] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditorias]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditorias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[usuarioCreacion] [nvarchar](100) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaEnvioPresto] [datetime] NULL,
	[observaciones] [nvarchar](4000) NULL,
	[codAreaProduccion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Auditorias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditoriasModulosControl]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriasModulosControl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idAuditoria] [int] NOT NULL,
	[ZonaControl] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[textoNotaClave] [nvarchar](100) NULL,
	[cantidad] [numeric](14, 2) NULL,
	[idObjeto] [uniqueidentifier] NOT NULL,
	[Auditado] [bit] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_AuditoriasModulosControl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CausasNoCumplimiento]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CausasNoCumplimiento](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_CausasNoCumplimiento] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClasesHora]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClasesHora](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](250) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_ClaseHora] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodNotaClaveN1_temp]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodNotaClaveN1_temp](
	[CodNotaClave] [varchar](50) NOT NULL,
	[CodN1] [varchar](10) NOT NULL,
 CONSTRAINT [PK_CodNotaClaveN1_temp] PRIMARY KEY CLUSTERED 
(
	[CodNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contratos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contratos](
	[NombreEmpresaNAV] [varchar](50) NOT NULL,
	[No_] [varchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
	[NombreEstado] [varchar](150) NULL,
	[Vendor No_] [varchar](50) NULL,
	[Job No_] [varchar](50) NOT NULL,
	[Objeto del Contrato] [varchar](250) NULL,
 CONSTRAINT [PK_Contratos] PRIMARY KEY CLUSTERED 
(
	[NombreEmpresaNAV] ASC,
	[No_] ASC,
	[Job No_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControlAccesosObra]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControlAccesosObra](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [nvarchar](50) NULL,
	[DNI] [nvarchar](20) NULL,
	[fechaInicio] [datetime] NULL,
	[fechaFin] [datetime] NULL,
	[usuarioCreacion] [nvarchar](50) NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
	[causaNoAcceso] [int] NULL,
 CONSTRAINT [PK_ControlAccesosObra] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuadrillas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuadrillas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
	[activo] [bit] NOT NULL,
	[codProveedor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cuadrillas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuadrillasSemanal]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuadrillasSemanal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idCuadrilla] [int] NOT NULL,
	[semana] [int] NOT NULL,
	[L] [int] NULL,
	[M] [int] NULL,
	[X] [int] NULL,
	[J] [int] NULL,
	[V] [int] NULL,
	[S] [int] NULL,
	[D] [int] NULL,
	[horasJornadaLV] [numeric](12, 2) NULL,
	[horasJornadaSD] [numeric](12, 2) NULL,
	[observaciones] [nvarchar](200) NULL,
	[cerrada] [tinyint] NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_CuadrillasSemanal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuadrillasSemanalTrabajador]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuadrillasSemanalTrabajador](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idCuadrillaSemanal] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[DNI] [varchar](50) NOT NULL,
	[idEmpresa] [varchar](50) NOT NULL,
	[empresa] [nvarchar](250) NOT NULL,
	[idTipoTrabajador] [int] NULL,
	[idRangoTrabajador] [int] NULL,
 CONSTRAINT [PK_CuadrillasSemanalTrabajador] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuadrillasSemanalTrabajadorTemp176f71ef]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuadrillasSemanalTrabajadorTemp176f71ef](
	[ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuadrillasTrabajador]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuadrillasTrabajador](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idCuadrilla] [int] NULL,
	[DNI] [nvarchar](50) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_CuadrillasTrabajador] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosContrato]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosContrato](
	[idEstado] [int] NOT NULL,
	[Estado] [nvarchar](150) NULL,
 CONSTRAINT [PK_EstadosContrato] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExcepcionesMedicion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExcepcionesMedicion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[categoria] [varchar](50) NULL,
	[propiedad] [varchar](50) NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_ExcepcionesMedicion] PRIMARY KEY NONCLUSTERED 
(
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[No_] [varchar](50) NOT NULL,
	[Pre-Assigned No_] [varchar](50) NOT NULL,
	[Job No_] [varchar](50) NOT NULL,
	[Order Date] [datetime] NOT NULL,
	[Buy-from Vendor No_] [varchar](50) NOT NULL,
	[Shipment Method Code] [varchar](50) NOT NULL,
	[Doc_ Escaneo] [varchar](350) NOT NULL,
	[Autorización Reg_] [bit] NULL,
	[Vendor Cr_ Memo No_] [varchar](50) NULL,
	[Vendor Invoice No_] [varchar](50) NULL,
	[Importe Autorizado] [numeric](38, 20) NOT NULL,
	[IsAbono] [tinyint] NOT NULL,
	[IsProvisional] [tinyint] NOT NULL,
	[ID Autorización] [nvarchar](50) NULL,
	[Fecha Autorización] [datetime] NULL,
 CONSTRAINT [PK_Facturas_1] PRIMARY KEY CLUSTERED 
(
	[No_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturasProformaAlbaranesLIN]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturasProformaAlbaranesLIN](
	[idFacturaProformaAlbaranLin] [int] IDENTITY(1,1) NOT NULL,
	[idFacturaProformaLin] [int] NOT NULL,
	[idLinea] [int] NOT NULL,
 CONSTRAINT [PK_FacturasProformaAlbaranes] PRIMARY KEY CLUSTERED 
(
	[idFacturaProformaLin] ASC,
	[idLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturasProformaCAB]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturasProformaCAB](
	[idFacturaProforma] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](20) NOT NULL,
	[idProveedor] [varchar](20) NOT NULL,
	[numFacturaProforma] [varchar](50) NOT NULL,
	[Contrato] [varchar](50) NOT NULL,
	[Fecha] [int] NULL,
	[enviado] [bit] NULL,
	[recibido] [bit] NULL,
	[idAlbaran] [varchar](20) NULL,
	[tipoProforma] [int] NULL,
	[isAlquiler] [bit] NOT NULL,
	[fechaProforma] [date] NOT NULL,
	[fechaFactura] [date] NULL,
 CONSTRAINT [FacturasProformaCAB_PK] PRIMARY KEY CLUSTERED 
(
	[idFacturaProforma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturasProformaLIN]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturasProformaLIN](
	[idFacturaProformaLin] [int] IDENTITY(1,1) NOT NULL,
	[idFacturaProforma] [int] NOT NULL,
	[Concepto] [varchar](1000) NULL,
	[Unidades] [decimal](18, 4) NOT NULL,
	[Precio] [decimal](13, 4) NOT NULL,
	[Importe] [decimal](18, 4) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NULL,
	[codZonaControl] [varchar](50) NULL,
	[activo] [bit] NOT NULL,
	[manual] [bit] NULL,
	[fechaGen] [date] NOT NULL,
	[idFactura] [varchar](20) NULL,
 CONSTRAINT [PK_FacturasProformaLIN] PRIMARY KEY CLUSTERED 
(
	[idFacturaProformaLin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturasTemp40b13fe1]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturasTemp40b13fe1](
	[No_] [varchar](50) NOT NULL,
	[Autorización Reg_] [tinyint] NOT NULL,
	[Buy-from Vendor No_] [varchar](50) NOT NULL,
	[Shipment Method Code] [varchar](50) NOT NULL,
	[Order Date] [datetime] NOT NULL,
	[Pre-Assigned No_] [varchar](50) NOT NULL,
	[Job No_] [varchar](50) NOT NULL,
	[Importe Autorizado] [numeric](38, 20) NOT NULL,
	[IsAbono] [tinyint] NOT NULL,
	[IsProvisional] [tinyint] NOT NULL,
	[Vendor Cr_ Memo No_] [varchar](50) NULL,
	[Vendor Invoice No_] [varchar](50) NULL,
	[Doc_ Escaneo] [varchar](350) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturasTempb1db0337]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturasTempb1db0337](
	[No_] [varchar](50) NOT NULL,
	[Autorización Reg_] [tinyint] NOT NULL,
	[Buy-from Vendor No_] [varchar](50) NOT NULL,
	[Shipment Method Code] [varchar](50) NOT NULL,
	[Order Date] [datetime] NOT NULL,
	[Pre-Assigned No_] [varchar](50) NOT NULL,
	[Job No_] [varchar](50) NOT NULL,
	[Importe Autorizado] [numeric](38, 20) NOT NULL,
	[IsAbono] [tinyint] NOT NULL,
	[IsProvisional] [tinyint] NOT NULL,
	[Vendor Cr_ Memo No_] [varchar](50) NULL,
	[Vendor Invoice No_] [varchar](50) NULL,
	[Doc_ Escaneo] [varchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturasTempea644c6e]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturasTempea644c6e](
	[No_] [varchar](50) NOT NULL,
	[Autorización Reg_] [tinyint] NOT NULL,
	[Buy-from Vendor No_] [varchar](50) NOT NULL,
	[Shipment Method Code] [varchar](50) NOT NULL,
	[Order Date] [datetime] NOT NULL,
	[Pre-Assigned No_] [varchar](50) NOT NULL,
	[Job No_] [varchar](50) NOT NULL,
	[Importe Autorizado] [numeric](38, 20) NOT NULL,
	[IsAbono] [tinyint] NOT NULL,
	[IsProvisional] [tinyint] NOT NULL,
	[Vendor Cr_ Memo No_] [varchar](50) NULL,
	[Vendor Invoice No_] [varchar](50) NULL,
	[Doc_ Escaneo] [varchar](350) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Festivos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Festivos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [nvarchar](50) NOT NULL,
	[fechaFestivo] [date] NOT NULL,
	[motivo] [varchar](100) NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Festivos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalCapitulos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalCapitulos](
	[idCapitulo] [int] IDENTITY(1,1) NOT NULL,
	[codCapitulo] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[orden] [int] NULL,
	[oculto] [bit] NOT NULL,
 CONSTRAINT [PK_GlobalCapitulos] PRIMARY KEY CLUSTERED 
(
	[codCapitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalDesviaciones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalDesviaciones](
	[tipoDesviacion] [int] IDENTITY(1,1) NOT NULL,
	[desviacion] [numeric](12, 2) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](500) NULL,
 CONSTRAINT [PK_GlobalDesviaciones] PRIMARY KEY CLUSTERED 
(
	[tipoDesviacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalGruposSTMethods]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalGruposSTMethods](
	[idGrupo] [int] IDENTITY(1,1) NOT NULL,
	[codGrupo] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[idTipoGrupo] [int] NOT NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_GlobalGruposSTMethods] PRIMARY KEY CLUSTERED 
(
	[codGrupo] ASC,
	[idTipoGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalMethods]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalMethods](
	[idMethod] [int] IDENTITY(1,1) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[descripcion] [nvarchar](4000) NULL,
	[descripcionComercial] [nvarchar](4000) NULL,
	[nombreContrata] [varchar](255) NULL,
	[descripcionContrata] [varchar](4000) NULL,
 CONSTRAINT [PK_GlobalMethods] PRIMARY KEY CLUSTERED 
(
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalMethodsChanges]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalMethodsChanges](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodNotaClave] [varchar](50) NOT NULL,
	[DescripcionTecnica] [varchar](4000) NOT NULL,
	[DescripcionComercial] [varchar](4000) NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Synced] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalNaturalezas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalNaturalezas](
	[idNaturaleza] [int] NOT NULL,
	[codNaturaleza] [varchar](10) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK_GlobalNaturalezas] PRIMARY KEY CLUSTERED 
(
	[idNaturaleza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalPerfilEmpresas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalPerfilEmpresas](
	[idPerfilEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[codPerfil] [varchar](50) NOT NULL,
	[nombre] [varchar](100) NULL,
	[horasJornada] [numeric](12, 2) NOT NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_GlobalPerfilEmpresas] PRIMARY KEY CLUSTERED 
(
	[codPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalRelCapitulos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalRelCapitulos](
	[idRelCapitulo] [int] IDENTITY(1,1) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GlobalRelCapitulos] PRIMARY KEY CLUSTERED 
(
	[codInf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalRelGruposSTMethods]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalRelGruposSTMethods](
	[idRelacion] [int] IDENTITY(1,1) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[notas] [varchar](1000) NULL,
	[idTipoGrupo] [int] NOT NULL,
 CONSTRAINT [PK_GlobalGruposRelSTMethods] PRIMARY KEY CLUSTERED 
(
	[codInf] ASC,
	[idTipoGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalRelMethods]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalRelMethods](
	[idRelMethod] [int] IDENTITY(1,1) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[rendimiento] [numeric](12, 4) NOT NULL,
	[tipo] [int] NOT NULL,
 CONSTRAINT [PK_GlobalRelMethod] PRIMARY KEY CLUSTERED 
(
	[codSup] ASC,
	[codInf] ASC,
	[tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalRelMethodsResources]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalRelMethodsResources](
	[idRelMethodResource] [int] IDENTITY(1,1) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[rendConsumo] [numeric](16, 8) NULL,
	[rendDesglosado] [numeric](12, 4) NOT NULL,
	[notas] [varchar](1000) NULL,
	[capacidadProduccion] [numeric](14, 4) NULL,
	[rendPlan] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_GlobalRelMethodResource] PRIMARY KEY CLUSTERED 
(
	[codNotaClave] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalRelResources]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalRelResources](
	[idRelResource] [int] IDENTITY(1,1) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[cantidad] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_GlobalRelResources] PRIMARY KEY CLUSTERED 
(
	[codSup] ASC,
	[codInf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalRelSTMethodsResources]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalRelSTMethodsResources](
	[idRelSTMethodResource] [int] IDENTITY(1,1) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[porcentaje] [numeric](8, 4) NOT NULL,
	[porcentajeRecup] [numeric](8, 4) NOT NULL,
 CONSTRAINT [PK_GlobalRelSTMethodsResources] PRIMARY KEY CLUSTERED 
(
	[codActividad] ASC,
	[codNotaClave] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalRelTipologiaPerfil]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalRelTipologiaPerfil](
	[idTipologia] [int] NOT NULL,
	[codPerfil] [varchar](50) NOT NULL,
	[numOperarios] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipologia] ASC,
	[codPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalRelVagonesScheduleTasks]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalRelVagonesScheduleTasks](
	[idRelVagonST] [int] IDENTITY(1,1) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[orden] [int] NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_GlobalRelVagonesScheduleTasks] PRIMARY KEY CLUSTERED 
(
	[codVagon] ASC,
	[codActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalRelVagonesZonificacionNs]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalRelVagonesZonificacionNs](
	[idRelVagonZonificacionN] [int] IDENTITY(1,1) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codN1] [varchar](10) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_GlobalRelVagonesZonificacionNs] PRIMARY KEY CLUSTERED 
(
	[codVagon] ASC,
	[codN1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalResources]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalResources](
	[idResource] [int] IDENTITY(1,1) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[costeTeorico] [numeric](12, 4) NOT NULL,
	[idNaturaleza] [int] NOT NULL,
	[tipoPeriodo] [tinyint] NULL,
	[minPeriodo] [int] NULL,
	[noContratable] [bit] NULL,
	[descripcion] [varchar](4000) NULL,
	[codPerfil] [varchar](50) NULL,
	[cantidadPaquete] [decimal](12, 4) NULL,
	[costeUnitarioPeriodo] [numeric](12, 4) NULL,
	[codProyectoArea] [varchar](50) NULL,
	[comercial] [bit] NOT NULL,
	[periodo] [numeric](12, 4) NULL,
 CONSTRAINT [PK_GlobalResource] PRIMARY KEY CLUSTERED 
(
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalScheduleTasks]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalScheduleTasks](
	[idScheduleTask] [int] IDENTITY(1,1) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[visibleFinal] [bit] NULL,
	[codPerfil] [varchar](50) NULL,
 CONSTRAINT [PK_GlobalScheduleTasks] PRIMARY KEY CLUSTERED 
(
	[codActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalSTPerfiles]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalSTPerfiles](
	[idSTPerfil] [int] IDENTITY(1,1) NOT NULL,
	[codPerfil] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[coeficienteHorasTrabajadas] [numeric](6, 4) NOT NULL,
 CONSTRAINT [PK_GlobalSTPerfiles] PRIMARY KEY CLUSTERED 
(
	[codActividad] ASC,
	[codPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalSTQuantities]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalSTQuantities](
	[idSTQuantity] [int] IDENTITY(1,1) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[rendProduccion] [numeric](12, 4) NOT NULL,
	[computable] [bit] NOT NULL,
	[rendComputable] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_GlobalSTQuantities] PRIMARY KEY CLUSTERED 
(
	[codActividad] ASC,
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalTipologiasObra]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalTipologiasObra](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalTipologiasVentasObra]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalTipologiasVentasObra](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalTiposGrupo]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalTiposGrupo](
	[idTipoGrupo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GlobalTipoGrupi] PRIMARY KEY CLUSTERED 
(
	[idTipoGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalTrenes]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalTrenes](
	[idTren] [int] IDENTITY(1,1) NOT NULL,
	[codTren] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[codLP] [varchar](50) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_GlobalTrenes] PRIMARY KEY CLUSTERED 
(
	[codTren] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalUnidadesMedida]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalUnidadesMedida](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codUnidad] [varchar](10) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GlobalUnidadesMedida] PRIMARY KEY CLUSTERED 
(
	[codUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalVagones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalVagones](
	[idVagon] [int] IDENTITY(1,1) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[hasAllNsRelated] [bit] NOT NULL,
	[codTren] [varchar](50) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_GlobalVagones] PRIMARY KEY CLUSTERED 
(
	[codVagon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalVentasExcepciones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalVentasExcepciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombreExcepcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalVentasExcepcionesNotasClave]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalVentasExcepcionesNotasClave](
	[idAgrupacion] [int] NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalVentasSecciones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalVentasSecciones](
	[idSeccion] [int] IDENTITY(1,1) NOT NULL,
	[seccion] [varchar](250) NOT NULL,
	[ordenSeccion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalVentasSuperficies]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalVentasSuperficies](
	[idVersionSuperficie] [int] IDENTITY(1,1) NOT NULL,
	[idSeccion] [int] NOT NULL,
	[isSobreRasante] [bit] NULL,
	[nombre] [varchar](250) NOT NULL,
	[isComputable] [bit] NOT NULL,
	[orden] [int] NOT NULL,
	[codNotaClave] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idVersionSuperficie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalVentasViviendasTipologias]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalVentasViviendasTipologias](
	[idVersionVivienda] [int] IDENTITY(1,1) NOT NULL,
	[idTipologia] [int] NOT NULL,
	[orden] [int] NOT NULL,
	[nombre] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idVersionVivienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalZonificacionNs]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalZonificacionNs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codN] [varchar](10) NOT NULL,
	[nivel] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[orden] [int] NULL,
	[isVisibleMatriz] [bit] NOT NULL,
 CONSTRAINT [PK_GlobalZonificacionNs] PRIMARY KEY CLUSTERED 
(
	[codN] ASC,
	[nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HorasTrabajadas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorasTrabajadas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [nvarchar](20) NULL,
	[idObra] [nvarchar](50) NULL,
	[idCuadrilla] [int] NULL,
	[idTipoHora] [int] NULL,
	[fecha] [datetime] NOT NULL,
	[horas] [numeric](6, 2) NULL,
	[codActividad] [varchar](50) NULL,
	[codZonaControl] [varchar](50) NULL,
	[observaciones] [varchar](250) NULL,
	[usuarioCreacion] [varchar](50) NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_HorasTrabajadas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HorasTrabajadasiPadRepartidas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorasTrabajadasiPadRepartidas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [nvarchar](20) NULL,
	[idObra] [nvarchar](50) NULL,
	[idCuadrilla] [int] NULL,
	[idTipoHora] [int] NULL,
	[fecha] [date] NULL,
	[horas] [numeric](6, 2) NULL,
	[codActividad] [varchar](50) NULL,
	[codZonaControl] [varchar](50) NULL,
	[observaciones] [varchar](250) NULL,
	[usuarioCreacion] [varchar](50) NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_HorasTrabajadasiPadRepartidas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HubeVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HubeVersion](
	[Version] [int] NOT NULL,
	[Environment] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [pk_HubeVersion] PRIMARY KEY CLUSTERED 
(
	[Version] DESC,
	[Environment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incidencias]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidencias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[idSubCategoria] [int] NOT NULL,
	[codFase] [varchar](50) NOT NULL,
	[idRespIncidencia] [int] NOT NULL,
	[idRespSeguimiento] [int] NOT NULL,
	[descripcion] [varchar](1000) NULL,
	[captura] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncidenciasCategorias]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidenciasCategorias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_IncidenciasCategorias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lobe$Installment]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lobe$Installment](
	[Payment Terms Code] [varchar](10) NOT NULL,
	[% of Total] [decimal](38, 20) NOT NULL,
 CONSTRAINT [PK_Lobe$Installment] PRIMARY KEY CLUSTERED 
(
	[Payment Terms Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lobe$Job Ledger Entry]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lobe$Job Ledger Entry](
	[Entry No_] [int] NOT NULL,
	[Job No_] [varchar](20) NOT NULL,
	[Posting Date] [datetime] NOT NULL,
	[Total Cost (LCY)] [decimal](38, 20) NOT NULL,
	[Document No_] [varchar](20) NOT NULL,
	[Job Task No_] [varchar](20) NOT NULL,
	[Nº Preasignado Factura_Abono] [varchar](20) NOT NULL,
	[Nº Proveedor] [varchar](20) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[External Document No_] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Lobe$Job Ledger Entry] PRIMARY KEY CLUSTERED 
(
	[Entry No_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiniProfilerClientTimings]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiniProfilerClientTimings](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[MiniProfilerId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Start] [decimal](9, 3) NOT NULL,
	[Duration] [decimal](9, 3) NOT NULL,
 CONSTRAINT [PK_MiniProfilerClientTimings] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiniProfilers]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiniProfilers](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[RootTimingId] [uniqueidentifier] NULL,
	[Name] [nvarchar](200) NULL,
	[Started] [datetime] NOT NULL,
	[DurationMilliseconds] [decimal](15, 1) NOT NULL,
	[User] [nvarchar](100) NULL,
	[HasUserViewed] [bit] NOT NULL,
	[MachineName] [nvarchar](100) NULL,
	[CustomLinksJson] [nvarchar](max) NULL,
	[ClientTimingsRedirectCount] [int] NULL,
 CONSTRAINT [PK_MiniProfilers] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiniProfilerTimings]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiniProfilerTimings](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[MiniProfilerId] [uniqueidentifier] NOT NULL,
	[ParentTimingId] [uniqueidentifier] NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DurationMilliseconds] [decimal](15, 3) NOT NULL,
	[StartMilliseconds] [decimal](15, 3) NOT NULL,
	[IsRoot] [bit] NOT NULL,
	[Depth] [smallint] NOT NULL,
	[CustomTimingsJson] [nvarchar](max) NULL,
 CONSTRAINT [PK_MiniProfilerTimings] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOV_PeticionesSincronizacion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOV_PeticionesSincronizacion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](250) NOT NULL,
	[FechaPeticion] [datetime] NOT NULL,
 CONSTRAINT [PK_MOV_PeticionesSincronizacion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOV_RespuestasSincronizacion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOV_RespuestasSincronizacion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](250) NOT NULL,
	[Lastcheck] [varchar](50) NOT NULL,
	[IdRecibido] [int] NOT NULL,
 CONSTRAINT [PK_MOV_RespuestasSincronizacion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOV_Transacciones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOV_Transacciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tabla] [varchar](50) NOT NULL,
	[TablaMOV] [varchar](50) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[ClaveMOV] [varchar](50) NOT NULL,
	[Obra] [varchar](25) NOT NULL,
	[Valor] [varchar](25) NOT NULL,
	[Accion] [char](1) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[Procesado] [bit] NOT NULL,
 CONSTRAINT [PK_MOV_Transacciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[CodMunicipio] [varchar](50) NOT NULL,
	[Nombre] [varchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificacionesCambiosImportes]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificacionesCambiosImportes](
	[Usuario] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_NotificacionesCambiosImportes] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obras]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obras](
	[idObra] [varchar](50) NOT NULL,
	[nombreComercial] [varchar](200) NULL,
	[nombreProyecto] [varchar](200) NULL,
	[rendimientoComercial] [numeric](8, 4) NOT NULL,
	[fechaInicioPrev] [datetime] NULL,
	[fechaFinPrev] [datetime] NULL,
	[isPromocion] [bit] NOT NULL,
	[isOficinaTecnica] [bit] NOT NULL,
	[isController] [bit] NOT NULL,
	[isProduccion] [bit] NOT NULL,
	[generateProformas] [bit] NOT NULL,
	[modelURN] [varchar](200) NULL,
	[provincia] [varchar](50) NULL,
	[idTipologiaObra] [int] NULL,
	[municipio] [varchar](250) NULL,
 CONSTRAINT [PK_Obras] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasCapitulos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasCapitulos](
	[idCapitulo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codCapitulo] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NULL,
	[orden] [int] NULL,
	[oculto] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasCapitulos] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codCapitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasCapitulosDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasCapitulosDinamica](
	[idCapitulo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codCapitulo] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NULL,
	[orden] [int] NULL,
	[oculto] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasCapitulosDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codCapitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasCapitulosPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasCapitulosPromocion](
	[idCapitulo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codCapitulo] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NULL,
	[orden] [int] NULL,
	[promType] [tinyint] NOT NULL,
	[oculto] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasCapitulosPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codCapitulo] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasCapitulosVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasCapitulosVersion](
	[idCapitulo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codCapitulo] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NULL,
	[orden] [int] NULL,
	[oculto] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasCapitulosVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codCapitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasCerradas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasCerradas](
	[idObra] [varchar](50) NOT NULL,
	[usuarioCierre] [varchar](50) NOT NULL,
	[fechaCierre] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idObra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasComparadorImportesPrePro]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasComparadorImportesPrePro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime2](7) NOT NULL,
	[promocionImpProm] [numeric](14, 2) NOT NULL,
	[oficinaTecnicaImpProm] [numeric](14, 2) NOT NULL,
	[oficinaTecnicaImpProyProm] [numeric](14, 2) NOT NULL,
	[oficinaTecnicaImpProy] [numeric](14, 2) NOT NULL,
	[lineaBaseImpProyecto] [numeric](14, 2) NOT NULL,
	[controllerImpPlanPro] [numeric](14, 2) NOT NULL,
	[controllerImpConPro] [numeric](14, 2) NOT NULL,
	[controllerImpPlanPend] [numeric](14, 2) NOT NULL,
	[controllerPorcentajePend] [numeric](14, 2) NOT NULL,
	[controllerImpConCon] [numeric](14, 2) NOT NULL,
	[controllerImpDesvCon] [numeric](14, 2) NOT NULL,
	[controllerPorcentajeDesv] [numeric](14, 2) NOT NULL,
	[produccionCapitulosImpContratado] [numeric](14, 2) NOT NULL,
	[produccionCapitulosImpProduccion] [numeric](14, 2) NOT NULL,
	[produccionCapitulosImpEjecutado] [numeric](14, 2) NOT NULL,
	[produccionCapitulosImpReal] [numeric](14, 2) NOT NULL,
	[produccionProveedorImpProduccion] [numeric](14, 2) NOT NULL,
	[produccionProveedorImpContratado] [numeric](14, 2) NOT NULL,
	[produccionProveedorImpEjecutado] [numeric](14, 2) NOT NULL,
	[produccionProveedorImpSuministrado] [numeric](14, 2) NOT NULL,
	[produccionProveedorImpAcopiado] [numeric](14, 2) NOT NULL,
	[produccionProveedorImpConsumido] [numeric](14, 2) NOT NULL,
	[produccionProveedorDesviacion] [numeric](14, 2) NOT NULL,
	[produccionProveedorImpFacturado] [numeric](14, 2) NOT NULL,
	[isPRE] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasGruposSTMethods]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasGruposSTMethods](
	[idGrupo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codGrupo] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[idTipoGrupo] [int] NOT NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_ObrasGruposSTMethods] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codGrupo] ASC,
	[idTipoGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasGruposSTMethodsDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasGruposSTMethodsDinamica](
	[idGrupo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codGrupo] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[idTipoGrupo] [int] NOT NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_ObrasGruposSTMethodsDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codGrupo] ASC,
	[idTipoGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasGruposSTMethodsPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasGruposSTMethodsPromocion](
	[idGrupo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codGrupo] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[idTipoGrupo] [int] NOT NULL,
	[orden] [int] NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasGruposSTMethodsPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codGrupo] ASC,
	[idTipoGrupo] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasGruposSTMethodsVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasGruposSTMethodsVersion](
	[idGrupo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codGrupo] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[idTipoGrupo] [int] NOT NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_ObrasGruposSTMethodsVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codGrupo] ASC,
	[idTipoGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasIncidencias]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasIncidencias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codProveedor] [varchar](50) NOT NULL,
	[nombreRecurso] [varchar](255) NOT NULL,
	[nombreNotaClave] [varchar](255) NOT NULL,
	[udRec] [varchar](5) NOT NULL,
	[udNC] [varchar](5) NOT NULL,
	[idOferta] [int] NULL,
	[canOrig] [numeric](14, 4) NOT NULL,
	[precOrig] [numeric](14, 4) NOT NULL,
	[fecha] [datetime2](7) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NULL,
	[nombreActividad] [varchar](255) NULL,
	[nombreProveedor] [varchar](255) NOT NULL,
	[codZonaControl] [varchar](50) NULL,
	[idAlbaran] [int] NULL,
	[idLinea] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasIncidenciasCantidadesPrevistas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasIncidenciasCantidadesPrevistas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdObra] [varchar](50) NOT NULL,
	[CodRecurso] [varchar](50) NOT NULL,
	[CodProveedor] [varchar](20) NOT NULL,
	[CantidadPrevista] [numeric](18, 4) NOT NULL,
 CONSTRAINT [PK_ObrasIncidenciasCantidadesPrevistas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ObrasIncidenciasCantidadesPrevistas] UNIQUE NONCLUSTERED 
(
	[IdObra] ASC,
	[CodProveedor] ASC,
	[CodRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasLPs]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasLPs](
	[idObra] [varchar](50) NOT NULL,
	[codLP] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
 CONSTRAINT [PK_ObrasLPs] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codLP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasMaterializacionHoras]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasMaterializacionHoras](
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[semana] [varchar](50) NOT NULL,
	[idCuadrilla] [int] NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NULL,
	[codTren] [varchar](50) NULL,
	[codLP] [varchar](50) NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[N1] [varchar](10) NULL,
	[N2] [varchar](10) NULL,
	[N3] [varchar](10) NULL,
	[N4] [varchar](10) NULL,
	[N5] [varchar](10) NULL,
	[HorasProy] [decimal](14, 4) NOT NULL,
	[HorasEje] [decimal](14, 4) NOT NULL,
	[HorasReal] [decimal](14, 4) NOT NULL,
	[TrabReal] [decimal](14, 4) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasMaterializacionHorasDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasMaterializacionHorasDinamica](
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[semana] [varchar](50) NOT NULL,
	[idCuadrilla] [int] NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NULL,
	[codTren] [varchar](50) NULL,
	[codLP] [varchar](50) NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[N1] [varchar](10) NULL,
	[N2] [varchar](10) NULL,
	[N3] [varchar](10) NULL,
	[N4] [varchar](10) NULL,
	[N5] [varchar](10) NULL,
	[HorasProy] [decimal](14, 4) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasMethods]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasMethods](
	[idMethod] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[incidencia] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasMethods] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasMethodsAgrupadosVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasMethodsAgrupadosVersion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codOrigen] [varchar](50) NOT NULL,
	[codDestino] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ObrasMethodsAgrupadosVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codOrigen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasMethodsChangesDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasMethodsChangesDinamica](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdObra] [varchar](50) NOT NULL,
	[CodNotaClave] [varchar](50) NOT NULL,
	[DescripcionTecnica] [nvarchar](4000) NOT NULL,
	[DescripcionComercial] [nvarchar](4000) NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Synced] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasMethodsDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasMethodsDinamica](
	[idMethod] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[descripcionComercial] [nvarchar](4000) NULL,
 CONSTRAINT [PK_ObrasMethodsDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasMethodsHistory]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasMethodsHistory](
	[idMethod] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[incidencia] [bit] NOT NULL,
	[cantidad] [decimal](14, 4) NOT NULL,
	[codgrupo] [varchar](50) NOT NULL,
	[nombregrupo] [varchar](255) NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasMethodsHistory] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codNotaClave] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasMethodsPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasMethodsPromocion](
	[idMethod] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[promType] [tinyint] NOT NULL,
	[descripcionComercial] [nvarchar](4000) NULL,
 CONSTRAINT [PK_ObrasMethodsPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codNotaClave] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasMethodsVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasMethodsVersion](
	[idMethod] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[descripcionComercial] [nvarchar](4000) NULL,
 CONSTRAINT [PK_ObrasMethodsVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasModelos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasModelos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[fileName] [varchar](200) NULL,
	[modelURN] [varchar](200) NULL,
	[modelParams] [nvarchar](max) NULL,
	[isModelComplete] [bit] NOT NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_ObrasModelos_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasModulosControl]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasModulosControl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[cantidad] [numeric](14, 4) NOT NULL,
	[longitud] [numeric](12, 2) NULL,
	[area] [numeric](12, 2) NULL,
	[areaBruta] [numeric](12, 2) NULL,
	[volumen] [numeric](12, 2) NULL,
	[volumenBruto] [numeric](12, 2) NULL,
	[N1] [varchar](10) NULL,
	[N2] [varchar](10) NULL,
	[N3] [varchar](10) NULL,
	[N4] [varchar](10) NULL,
	[N5] [varchar](10) NULL,
	[NID] [varchar](50) NULL,
	[idObjeto] [uniqueidentifier] NOT NULL,
	[idObjetoRevit] [varchar](50) NOT NULL,
	[archivoOrigen] [varchar](100) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[archivoNavis] [varchar](100) NOT NULL,
	[diametro] [int] NULL,
	[N6] [varchar](10) NULL,
	[incidencia] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasModulosControl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasModulosControlDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasModulosControlDinamica](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[cantidad] [numeric](14, 4) NOT NULL,
	[longitud] [numeric](12, 2) NULL,
	[area] [numeric](12, 2) NULL,
	[areaBruta] [numeric](12, 2) NULL,
	[volumen] [numeric](12, 2) NULL,
	[volumenBruto] [numeric](12, 2) NULL,
	[N1] [varchar](10) NULL,
	[N2] [varchar](10) NULL,
	[N3] [varchar](10) NULL,
	[N4] [varchar](10) NULL,
	[N5] [varchar](10) NULL,
	[NID] [varchar](50) NULL,
	[idObjeto] [uniqueidentifier] NOT NULL,
	[idObjetoRevit] [varchar](50) NOT NULL,
	[archivoOrigen] [varchar](100) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[codAreaProduccion] [varchar](50) NULL,
	[archivoNavis] [varchar](100) NOT NULL,
	[diametro] [int] NULL,
	[N6] [varchar](10) NULL,
	[desestimado] [bit] NULL,
 CONSTRAINT [PK_ObrasModulosControlDinamica] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasModulosControlPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasModulosControlPromocion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[cantidad] [numeric](14, 4) NOT NULL,
	[longitud] [numeric](12, 2) NULL,
	[area] [numeric](12, 2) NULL,
	[areaBruta] [numeric](12, 2) NULL,
	[volumen] [numeric](12, 2) NULL,
	[volumenBruto] [numeric](12, 2) NULL,
	[N1] [varchar](10) NULL,
	[N2] [varchar](10) NULL,
	[N3] [varchar](10) NULL,
	[N4] [varchar](10) NULL,
	[N5] [varchar](10) NULL,
	[NID] [varchar](50) NULL,
	[idObjeto] [uniqueidentifier] NOT NULL,
	[idObjetoRevit] [varchar](50) NOT NULL,
	[archivoOrigen] [varchar](100) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[codAreaProduccion] [varchar](50) NOT NULL,
	[archivoNavis] [varchar](100) NOT NULL,
	[diametro] [int] NULL,
	[N6] [varchar](10) NULL,
	[desestimado] [bit] NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasModulosControlPromocion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasModulosControlVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasModulosControlVersion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[cantidad] [numeric](14, 4) NOT NULL,
	[longitud] [numeric](14, 4) NULL,
	[area] [numeric](12, 2) NULL,
	[areaBruta] [numeric](12, 2) NULL,
	[volumen] [numeric](12, 2) NULL,
	[volumenBruto] [numeric](12, 2) NULL,
	[N1] [varchar](10) NULL,
	[N2] [varchar](10) NULL,
	[N3] [varchar](10) NULL,
	[N4] [varchar](10) NULL,
	[N5] [varchar](10) NULL,
	[NID] [varchar](50) NULL,
	[idObjeto] [uniqueidentifier] NOT NULL,
	[idObjetoRevit] [varchar](50) NOT NULL,
	[archivoOrigen] [varchar](100) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[codAreaProduccion] [varchar](50) NOT NULL,
	[archivoNavis] [varchar](100) NOT NULL,
	[diametro] [int] NULL,
	[N6] [varchar](10) NULL,
 CONSTRAINT [PK_ObrasModulosControlVersion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasNCZCCantidadesDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasNCZCCantidadesDinamica](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[cantidad] [numeric](12, 2) NOT NULL,
	[N1] [varchar](10) NULL,
	[N2] [varchar](10) NULL,
	[N3] [varchar](10) NULL,
	[N4] [varchar](10) NULL,
	[N5] [varchar](10) NULL,
	[N6] [varchar](10) NULL,
 CONSTRAINT [PK_ObrasNCZCCantidadesDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codNotaClave] ASC,
	[codZonaControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasNCZCCantidadesPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasNCZCCantidadesPromocion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[cantidad] [numeric](12, 2) NOT NULL,
	[N1] [varchar](10) NULL,
	[N2] [varchar](10) NULL,
	[N3] [varchar](10) NULL,
	[N4] [varchar](10) NULL,
	[N5] [varchar](10) NULL,
	[N6] [varchar](10) NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasNCZCCantidadesPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codNotaClave] ASC,
	[codZonaControl] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPartidasContrataVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPartidasContrataVersion](
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[descripcion] [varchar](4000) NULL,
 CONSTRAINT [PK_ObrasPartidasContrataVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPerfilEmpresas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPerfilEmpresas](
	[idPerfilEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codPerfil] [varchar](50) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[horasJornada] [numeric](12, 2) NOT NULL,
	[orden] [int] NULL,
	[numOperarios] [int] NULL,
 CONSTRAINT [PK_ObrasPerfilEmpresas] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPerfilEmpresasDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPerfilEmpresasDinamica](
	[idPerfilEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codPerfil] [varchar](50) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[horasJornada] [numeric](12, 2) NOT NULL,
	[orden] [int] NULL,
	[numOperarios] [int] NULL,
 CONSTRAINT [PK_ObrasPerfilEmpresasDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPerfilEmpresasPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPerfilEmpresasPromocion](
	[idPerfilEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codPerfil] [varchar](50) NOT NULL,
	[nombre] [varchar](100) NULL,
	[horasJornada] [numeric](12, 2) NOT NULL,
	[orden] [int] NULL,
	[promType] [tinyint] NOT NULL,
	[numOperarios] [int] NULL,
 CONSTRAINT [PK_ObrasPerfilEmpresasPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codPerfil] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPerfilEmpresasVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPerfilEmpresasVersion](
	[idPerfilEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codPerfil] [varchar](50) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[horasJornada] [numeric](12, 2) NOT NULL,
	[orden] [int] NULL,
	[numOperarios] [int] NULL,
 CONSTRAINT [PK_ObrasPerfilEmpresasVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPlanificacionBase]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPlanificacionBase](
	[idObra] [varchar](50) NOT NULL,
	[semanas] [int] NOT NULL,
	[fechaInicio] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idObra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPlanificacionBasePerfiles]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPlanificacionBasePerfiles](
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codPerfil] [varchar](50) NOT NULL,
	[semana] [int] NOT NULL,
	[operarios] [decimal](10, 6) NOT NULL,
	[isPerfilPlan] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC,
	[codPerfil] ASC,
	[semana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPlanificacionDetallada]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPlanificacionDetallada](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[n1] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC,
	[codActividad] ASC,
	[codZonaControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPlanificacionDetalladaSemanal]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPlanificacionDetalladaSemanal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPlanificacionDetallada] [int] NULL,
	[semana] [int] NOT NULL,
	[horas] [decimal](10, 6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idPlanificacionDetallada] ASC,
	[semana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPlanificacionDetalladaSemanalObjetos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPlanificacionDetalladaSemanalObjetos](
	[idPlanDetalladaSemanal] [int] NOT NULL,
	[IdObjeto] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_ObrasPlanificacionDetalladaSemanalObjetos] PRIMARY KEY CLUSTERED 
(
	[idPlanDetalladaSemanal] ASC,
	[IdObjeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPlanificacionOrdenVagon]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPlanificacionOrdenVagon](
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[orden] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC,
	[codZonaControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasPreciosResources]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasPreciosResources](
	[IdPrecioResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[codProveedor] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[precio] [numeric](12, 4) NOT NULL,
	[indice] [numeric](12, 4) NOT NULL,
	[observaciones] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPrecioResource] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelCapitulos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelCapitulos](
	[idRelCapitulo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ObrasRelCapitulos] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codInf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelCapitulosDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelCapitulosDinamica](
	[idRelCapitulo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ObrasRelCapitulosDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codInf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelCapitulosMethods]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelCapitulosMethods](
	[idObra] [varchar](50) NOT NULL,
	[codCap1] [varchar](50) NULL,
	[codCap2] [varchar](50) NULL,
	[codCap3] [varchar](50) NULL,
	[codCap4] [varchar](50) NULL,
	[codCap5] [varchar](50) NULL,
	[codCap6] [varchar](50) NULL,
	[codCap7] [varchar](50) NULL,
	[codCap8] [varchar](50) NULL,
	[codCap9] [varchar](50) NULL,
	[codCap10] [varchar](50) NULL,
	[codNotaClave] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ObrasRelCapitulosMethods] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelCapitulosPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelCapitulosPromocion](
	[idRelCapitulo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasRelCapitulosPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codInf] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelCapitulosVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelCapitulosVersion](
	[idRelCapitulo] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ObrasRelCapitulosVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codInf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelGruposSTMethods]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelGruposSTMethods](
	[idRelacion] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[notas] [varchar](1000) NULL,
	[idTipoGrupo] [int] NOT NULL,
 CONSTRAINT [PK_ObrasGruposRelSTMethods] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codInf] ASC,
	[idTipoGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelGruposSTMethodsDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelGruposSTMethodsDinamica](
	[idRelacion] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[notas] [varchar](1000) NULL,
	[idTipoGrupo] [int] NOT NULL,
 CONSTRAINT [PK_ObrasGruposRelSTMethodsDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codInf] ASC,
	[idTipoGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelGruposSTMethodsPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelGruposSTMethodsPromocion](
	[idRelacion] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[notas] [varchar](1000) NULL,
	[idTipoGrupo] [int] NOT NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasGruposRelSTMethodsPromocion_idObraCodInfTipoGrPromType] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codInf] ASC,
	[idTipoGrupo] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelGruposSTMethodsVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelGruposSTMethodsVersion](
	[idRelacion] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[notas] [varchar](1000) NULL,
	[idTipoGrupo] [int] NOT NULL,
 CONSTRAINT [PK_ObrasGruposRelSTMethodsVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codInf] ASC,
	[idTipoGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelMethods]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelMethods](
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codInf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelMethodsContrataVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelMethodsContrataVersion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codOrigen] [varchar](50) NOT NULL,
	[codDestino] [varchar](50) NOT NULL,
	[tipo] [int] NOT NULL,
	[rendimiento] [numeric](13, 12) NULL,
 CONSTRAINT [PK_ObrasRelMethodsContrataVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codOrigen] ASC,
	[codDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelMethodsPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelMethodsPromocion](
	[idRelMethod] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[rendimiento] [numeric](12, 4) NOT NULL,
	[tipo] [int] NOT NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasRelMethodsPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codSup] ASC,
	[codInf] ASC,
	[tipo] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelMethodsResources]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelMethodsResources](
	[idRelMethodResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[rendConsumo] [numeric](16, 8) NULL,
	[notas] [varchar](1000) NULL,
	[capacidadProduccion] [numeric](14, 4) NULL,
	[incidencia] [bit] NOT NULL,
	[rendPlan] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_ObrasRelMethodResource] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codNotaClave] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelMethodsResourcesDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelMethodsResourcesDinamica](
	[idRelMethodResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[rendConsumo] [numeric](16, 8) NULL,
	[notas] [varchar](1000) NULL,
	[capacidadProduccion] [numeric](14, 4) NULL,
	[rendPlan] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_ObrasRelMethodResourceDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codNotaClave] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelMethodsResourcesHistory]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelMethodsResourcesHistory](
	[idRelMethodResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[rendConsumo] [numeric](16, 8) NOT NULL,
	[notas] [varchar](1000) NULL,
	[capacidadProduccion] [numeric](14, 4) NULL,
	[incidencia] [bit] NOT NULL,
	[rendPlan] [numeric](12, 4) NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasRelMethodResourceHistory] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codNotaClave] ASC,
	[codRecurso] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelMethodsResourcesPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelMethodsResourcesPromocion](
	[idRelMethodResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[rendConsumo] [numeric](16, 8) NULL,
	[notas] [varchar](1000) NULL,
	[capacidadProduccion] [numeric](14, 4) NULL,
	[promType] [tinyint] NOT NULL,
	[rendPlan] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_ObrasRelMethodsResourcesPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codNotaClave] ASC,
	[codRecurso] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelMethodsResourcesVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelMethodsResourcesVersion](
	[idRelMethodResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[rendConsumo] [numeric](16, 8) NULL,
	[notas] [varchar](1000) NULL,
	[capacidadProduccion] [numeric](14, 4) NULL,
	[rendPlan] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_ObrasRelMethodsResourcesVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codNotaClave] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelMethodsVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelMethodsVersion](
	[idRelMethod] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[rendimiento] [numeric](12, 4) NOT NULL,
	[tipo] [int] NOT NULL,
 CONSTRAINT [PK_ObrasRelMethodsVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codSup] ASC,
	[codInf] ASC,
	[tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelResources]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelResources](
	[idRelResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[cantidad] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_ObrasRelResources] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codSup] ASC,
	[codInf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelResourcesDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelResourcesDinamica](
	[idRelResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[cantidad] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_ObrasRelResourcesDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codSup] ASC,
	[codInf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelResourcesPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelResourcesPromocion](
	[idRelResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[promType] [tinyint] NOT NULL,
	[cantidad] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_ObrasRelResourcesPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codSup] ASC,
	[codInf] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelResourcesVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelResourcesVersion](
	[idRelResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
	[cantidad] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_ObrasRelResourcesVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codSup] ASC,
	[codInf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelSTMethodsResources]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelSTMethodsResources](
	[idRelSTMethodResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[porcentaje] [numeric](8, 4) NOT NULL,
	[incidencia] [bit] NOT NULL,
	[porcentajeRecup] [numeric](8, 4) NOT NULL,
 CONSTRAINT [PK_ObrasRelSTMethodsResources] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC,
	[codNotaClave] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelSTMethodsResourcesDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica](
	[idRelSTMethodResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[porcentaje] [numeric](8, 4) NOT NULL,
	[porcentajeRecup] [numeric](8, 4) NOT NULL,
 CONSTRAINT [PK_ObrasRelSTMethodsResourcesDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC,
	[codNotaClave] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelSTMethodsResourcesPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion](
	[idRelSTMethodResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[porcentaje] [numeric](8, 4) NOT NULL,
	[porcentajeRecup] [numeric](8, 4) NOT NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasRelSTMethodsResourcesPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC,
	[codNotaClave] ASC,
	[codRecurso] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelSTMethodsResourcesVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelSTMethodsResourcesVersion](
	[idRelSTMethodResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[porcentaje] [numeric](8, 4) NOT NULL,
	[porcentajeRecup] [numeric](8, 4) NOT NULL,
 CONSTRAINT [PK_ObrasRelSTMethodsResourcesVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codActividad] ASC,
	[codNotaClave] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelSuperficiesN1Version]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelSuperficiesN1Version](
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[idVersionSuperficie] [int] NOT NULL,
	[n1] [varchar](10) NOT NULL,
	[cantidad] [numeric](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[idVersionSuperficie] ASC,
	[n1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelVagonesScheduleTasks]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelVagonesScheduleTasks](
	[idRelVagonST] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[orden] [int] NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasRelVagonesScheduleTasks] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC,
	[codActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelVagonesScheduleTasksDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelVagonesScheduleTasksDinamica](
	[idRelVagonST] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[orden] [int] NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasRelVagonesScheduleTasksDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC,
	[codActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelVagonesScheduleTasksPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelVagonesScheduleTasksPromocion](
	[idRelVagonST] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[orden] [int] NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasRelVagonesScheduleTasksPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC,
	[codActividad] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelVagonesScheduleTasksVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelVagonesScheduleTasksVersion](
	[idRelVagonST] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[orden] [int] NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasRelVagonesScheduleTasksVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codVagon] ASC,
	[codActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelVagonesZonificacionNs]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelVagonesZonificacionNs](
	[idRelVagonZonificacionN] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codN1] [varchar](10) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasRelVagonesZonificacionNs] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC,
	[codN1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelVagonesZonificacionNsDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelVagonesZonificacionNsDinamica](
	[idRelVagonZonificacionN] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codN1] [varchar](10) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasRelVagonesZonificacionNsDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC,
	[codN1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelVagonesZonificacionNsPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelVagonesZonificacionNsPromocion](
	[idRelVagonZonificacionN] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codN1] [varchar](10) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasRelVagonesZonificacionNsPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC,
	[codN1] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasRelVagonesZonificacionNsVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasRelVagonesZonificacionNsVersion](
	[idRelVagonZonificacionN] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[codN1] [varchar](10) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasRelVagonesZonificacionNsVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codVagon] ASC,
	[codN1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasResources]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasResources](
	[idResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[costeTeorico] [numeric](12, 4) NOT NULL,
	[costeContratado] [numeric](12, 4) NULL,
	[idNaturaleza] [int] NOT NULL,
	[noContratable] [bit] NULL,
	[costeUnitarioPeriodo] [numeric](12, 4) NULL,
	[descripcion] [varchar](4000) NULL,
	[codPerfil] [varchar](50) NULL,
	[cantidadPaquete] [decimal](12, 4) NULL,
	[ajustado] [bit] NULL,
	[tipoPeriodo] [tinyint] NULL,
	[codProyectoArea] [varchar](50) NULL,
	[incidencia] [bit] NOT NULL,
	[periodo] [numeric](12, 4) NULL,
 CONSTRAINT [PK_ObrasResources] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasResourcesDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasResourcesDinamica](
	[idResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[costeTeorico] [numeric](12, 4) NOT NULL,
	[idNaturaleza] [int] NOT NULL,
	[costeUnitarioPeriodo] [numeric](12, 4) NULL,
	[descripcion] [varchar](4000) NULL,
	[codPerfil] [varchar](50) NULL,
	[cantidadPaquete] [decimal](12, 4) NULL,
	[ajustado] [bit] NULL,
	[tipoPeriodo] [tinyint] NULL,
	[codProyectoArea] [varchar](50) NULL,
	[comercial] [bit] NOT NULL,
	[periodo] [numeric](12, 4) NULL,
 CONSTRAINT [PK_ObrasResourcesDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasResourcesEjecutados]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasResourcesEjecutados](
	[idObra] [varchar](50) NOT NULL,
	[codProveedor] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ObrasResourcesEjecutados] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codProveedor] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasResourcesHistory]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasResourcesHistory](
	[idResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[costeTeorico] [numeric](12, 4) NOT NULL,
	[costeContratado] [numeric](12, 4) NULL,
	[idNaturaleza] [int] NOT NULL,
	[noContratable] [bit] NULL,
	[costeUnitarioPeriodo] [numeric](12, 4) NULL,
	[descripcion] [varchar](4000) NULL,
	[codPerfil] [varchar](50) NULL,
	[nombreperfil] [varchar](255) NOT NULL,
	[cantidadPaquete] [decimal](12, 4) NULL,
	[tipoPeriodo] [tinyint] NULL,
	[codProyectoArea] [varchar](50) NULL,
	[incidencia] [bit] NOT NULL,
	[periodo] [numeric](12, 4) NULL,
	[codgrupo] [varchar](50) NOT NULL,
	[nombregrupo] [varchar](255) NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasResourcesHistory] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codRecurso] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasResourcesPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasResourcesPromocion](
	[idResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[costeTeorico] [numeric](12, 4) NOT NULL,
	[idNaturaleza] [int] NOT NULL,
	[costeUnitarioPeriodo] [numeric](12, 4) NULL,
	[descripcion] [varchar](4000) NULL,
	[codPerfil] [varchar](50) NULL,
	[cantidadPaquete] [decimal](12, 4) NULL,
	[ajustado] [bit] NULL,
	[tipoPeriodo] [tinyint] NULL,
	[codProyectoArea] [varchar](50) NULL,
	[promType] [tinyint] NOT NULL,
	[periodo] [numeric](12, 4) NULL,
	[comercial] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasResourcesPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codRecurso] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasResourcesVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasResourcesVersion](
	[idResource] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[costeTeorico] [numeric](12, 4) NOT NULL,
	[idNaturaleza] [int] NOT NULL,
	[costeUnitarioPeriodo] [numeric](12, 4) NULL,
	[descripcion] [varchar](4000) NULL,
	[codPerfil] [varchar](50) NULL,
	[cantidadPaquete] [decimal](12, 4) NULL,
	[ajustado] [bit] NULL,
	[tipoPeriodo] [tinyint] NULL,
	[codProyectoArea] [varchar](50) NULL,
	[periodo] [numeric](12, 4) NULL,
	[comercial] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasResourcesVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasScheduleTasks]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasScheduleTasks](
	[idScheduleTask] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[visibleFinal] [bit] NULL,
	[codPerfil] [varchar](50) NULL,
	[incidencia] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasScheduleTasks] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasScheduleTasksDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasScheduleTasksDinamica](
	[idScheduleTask] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[visibleFinal] [bit] NULL,
	[codPerfil] [varchar](50) NULL,
 CONSTRAINT [PK_ObrasScheduleTasksDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasScheduleTasksPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasScheduleTasksPromocion](
	[idScheduleTask] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[visibleFinal] [bit] NULL,
	[codPerfil] [varchar](50) NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasScheduleTasksPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasScheduleTasksVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasScheduleTasksVersion](
	[idScheduleTask] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[unidadMedida] [varchar](5) NOT NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[visibleFinal] [bit] NULL,
	[codPerfil] [varchar](50) NULL,
 CONSTRAINT [PK_ObrasScheduleTasksVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSTQuantities]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSTQuantities](
	[idSTQuantity] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[rendProduccion] [numeric](12, 4) NOT NULL,
	[computable] [bit] NOT NULL,
	[rendComputable] [numeric](12, 4) NOT NULL,
	[incidencia] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasSTQuantities] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC,
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSTQuantitiesDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSTQuantitiesDinamica](
	[idSTQuantity] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[rendProduccion] [numeric](12, 4) NOT NULL,
	[computable] [bit] NOT NULL,
	[rendComputable] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_ObrasSTQuantitiesDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC,
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSTQuantitiesPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSTQuantitiesPromocion](
	[idSTQuantity] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[rendProduccion] [numeric](12, 4) NOT NULL,
	[computable] [bit] NOT NULL,
	[rendComputable] [numeric](12, 4) NOT NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasSTQuantitiesPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC,
	[codNotaClave] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSTQuantitiesVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSTQuantitiesVersion](
	[idSTQuantity] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[rendProduccion] [numeric](12, 4) NOT NULL,
	[computable] [bit] NOT NULL,
	[rendComputable] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_ObrasSTQuantitiesVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codActividad] ASC,
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSTZonasControl]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSTZonasControl](
	[idSTZonaControl] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[incidencia] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasSTZonasControl] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC,
	[codZonaControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSTZonasControlDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSTZonasControlDinamica](
	[idSTZonaControl] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ObrasSTZonasControlDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC,
	[codZonaControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSTZonasControlPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSTZonasControlPromocion](
	[idSTZonaControl] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasSTZonasControlPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codActividad] ASC,
	[codZonaControl] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSTZonasControlVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSTZonasControlVersion](
	[idSTZonaControl] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ObrasSTZonasControlVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codActividad] ASC,
	[codZonaControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSTZonasEjecutados]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSTZonasEjecutados](
	[idObra] [varchar](50) NOT NULL,
	[codProveedor] [varchar](50) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ObrasSTZonasEjecutados] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codProveedor] ASC,
	[codActividad] ASC,
	[codZonaControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasSyncVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasSyncVersion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [nvarchar](50) NULL,
	[date] [datetime] NULL,
	[usuario] [nvarchar](50) NULL,
	[Resources] [tinyint] NULL,
	[Methods] [tinyint] NULL,
	[ScheduleTasks] [tinyint] NULL,
	[RecursosModulosControl] [tinyint] NULL,
	[CuadrillasActividades] [tinyint] NULL,
 CONSTRAINT [PK_ObraSyncVersion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasTotalesMaterializados]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasTotalesMaterializados](
	[idObra] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[impPromocion] [numeric](14, 2) NOT NULL,
	[impProyecto] [numeric](14, 2) NOT NULL,
	[impCompras] [numeric](14, 2) NOT NULL,
	[impContratado] [numeric](14, 2) NOT NULL,
	[impEjecutado] [numeric](14, 2) NOT NULL,
	[impFacturado] [numeric](14, 2) NOT NULL,
	[impVentas] [numeric](14, 2) NOT NULL,
	[impVentasFirmado] [numeric](14, 2) NOT NULL,
	[nombreObra] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasTrenes]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasTrenes](
	[idTren] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codTren] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[codLP] [varchar](50) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasTrenes] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codTren] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasTrenesDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasTrenesDinamica](
	[idTren] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codTren] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[codLP] [varchar](50) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasTrenesDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codTren] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasTrenesPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasTrenesPromocion](
	[idTren] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codTren] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[codLP] [varchar](50) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasTrenesPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codTren] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasTrenesVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasTrenesVersion](
	[idTren] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codTren] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[codLP] [varchar](50) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasTrenesVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codTren] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVagones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVagones](
	[idVagon] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[hasAllNsRelated] [bit] NOT NULL,
	[codTren] [varchar](50) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasVagones] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVagonesDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVagonesDinamica](
	[idVagon] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[hasAllNsRelated] [bit] NOT NULL,
	[codTren] [varchar](50) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasVagonesDinamica] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVagonesPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVagonesPromocion](
	[idVagon] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[hasAllNsRelated] [bit] NOT NULL,
	[codTren] [varchar](50) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[promType] [tinyint] NOT NULL,
 CONSTRAINT [PK_ObrasVagonesPromocion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codVagon] ASC,
	[promType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVagonesVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVagonesVersion](
	[idVagon] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codVagon] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[color] [varchar](10) NULL,
	[orden] [int] NULL,
	[hasAllNsRelated] [bit] NOT NULL,
	[codTren] [varchar](50) NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_ObrasVagonesVersion] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codVagon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVentasConceptos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVentasConceptos](
	[idConcepto] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codConcepto] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[importe] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ObrasVentasConceptos] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVentasExcepcionesNotasClaveVersiones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVentasExcepcionesNotasClaveVersiones](
	[idAgrupacion] [int] NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC,
	[codNotaClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVentasSeccionesVersiones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVentasSeccionesVersiones](
	[idSeccion] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[seccion] [varchar](250) NOT NULL,
	[ordenSeccion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVentasSuperficiesVersiones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVentasSuperficiesVersiones](
	[idVersionSuperficie] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[orden] [int] NOT NULL,
	[isSobreRasante] [bit] NULL,
	[nombre] [varchar](250) NOT NULL,
	[m2Real] [decimal](12, 4) NOT NULL,
	[percComputable] [decimal](8, 4) NULL,
	[idSeccion] [int] NULL,
	[isComputable] [bit] NOT NULL,
	[codNotaClave] [varchar](50) NULL,
	[isCalculado] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasVentasSuperficiesVersiones_1] PRIMARY KEY CLUSTERED 
(
	[idVersionSuperficie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVentasTecnicasVersiones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVentasTecnicasVersiones](
	[idVersionTecnica] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[idTipologiaVenta] [int] NULL,
	[numViviendas] [int] NULL,
	[numGarajes] [int] NULL,
	[numTrasteros] [int] NULL,
	[numEscaleras] [int] NULL,
	[numAscensores] [int] NULL,
	[costeBR] [decimal](18, 2) NULL,
	[costeSR] [decimal](18, 2) NULL,
	[costeUrb] [decimal](18, 2) NULL,
	[coste] [decimal](18, 2) NULL,
 CONSTRAINT [PK_VersionesTecnicas] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVentasVersiones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVentasVersiones](
	[idVersion] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [varchar](4000) NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaCierre] [datetime] NULL,
	[estado] [int] NOT NULL,
	[logo] [varchar](max) NULL,
	[archivo] [varchar](100) NOT NULL,
	[numPresupuesto] [varchar](250) NULL,
	[descripcionPresupuesto] [varchar](500) NULL,
 CONSTRAINT [PK_Versiones] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVentasViviendasHabitacionesVersiones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVentasViviendasHabitacionesVersiones](
	[idVersionVivienda] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[orden] [int] NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[numViviendas] [int] NOT NULL,
 CONSTRAINT [PK_ObrasVentasViviendasHabitacionesVersiones] PRIMARY KEY CLUSTERED 
(
	[idVersionVivienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasVentasViviendasTipologiaVersiones]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasVentasViviendasTipologiaVersiones](
	[idVersionVivienda] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[orden] [int] NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[numViviendas] [int] NOT NULL,
 CONSTRAINT [PK_ObrasVentasViviendasTipologiaVersiones] PRIMARY KEY CLUSTERED 
(
	[idVersionVivienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasZonificacionNs]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasZonificacionNs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codN] [varchar](10) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[nivel] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[orden] [int] NULL,
	[isVisibleMatriz] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasZonificacionNs] PRIMARY KEY CLUSTERED 
(
	[codN] ASC,
	[idObra] ASC,
	[nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasZonificacionNsDinamica]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasZonificacionNsDinamica](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codN] [varchar](10) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[nivel] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[orden] [int] NULL,
	[isVisibleMatriz] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasZonificacionNsDinamica] PRIMARY KEY CLUSTERED 
(
	[codN] ASC,
	[idObra] ASC,
	[nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasZonificacionNsPromocion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasZonificacionNsPromocion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codN] [varchar](10) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[nivel] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[orden] [int] NULL,
	[isVisibleMatriz] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasZonificacionNsPromocion] PRIMARY KEY CLUSTERED 
(
	[codN] ASC,
	[idObra] ASC,
	[nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObrasZonificacionNsVersion]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObrasZonificacionNsVersion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codN] [varchar](10) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[nivel] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[orden] [int] NULL,
	[isVisibleMatriz] [bit] NOT NULL,
 CONSTRAINT [PK_ObrasZonificacionNsVersion] PRIMARY KEY CLUSTERED 
(
	[codN] ASC,
	[idObra] ASC,
	[version] ASC,
	[nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ofertas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ofertas](
	[idOferta] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[observaciones] [varchar](500) NOT NULL,
	[idOfertaTipo] [int] NULL,
	[idPrioridad] [int] NULL,
	[empresaNAV] [varchar](50) NULL,
	[codContrato] [varchar](50) NULL,
	[numAnexo] [int] NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
	[usuarioCreacion] [varchar](50) NULL,
	[definitiva] [bit] NOT NULL,
	[presentarAMesa] [bit] NOT NULL,
	[idActa] [int] NULL,
	[incidencia] [bit] NOT NULL,
	[estadoContrato] [int] NULL,
	[nombreEmpresaNAV] [varchar](50) NULL,
	[codSuperRecurso] [varchar](50) NULL,
	[desglose] [bit] NULL,
 CONSTRAINT [PK_Ofertas] PRIMARY KEY CLUSTERED 
(
	[idOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertasActas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertasActas](
	[idActa] [int] IDENTITY(1,1) NOT NULL,
	[numActa] [int] NOT NULL,
	[year] [int] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[usuarioCreacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OfertasActas] PRIMARY KEY CLUSTERED 
(
	[idActa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertasComentariosUsuario]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertasComentariosUsuario](
	[IdOferta] [int] NULL,
	[CodRecurso] [varchar](50) NULL,
	[CodNotaClave] [varchar](50) NULL,
	[FechaRegistro] [datetime] NULL,
	[Usuario] [nvarchar](50) NULL,
	[DescripcionTxt] [text] NULL,
	[DescripcionHtml] [text] NULL,
	[idComentario] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_OfertasComentariosUsuario] PRIMARY KEY CLUSTERED 
(
	[idComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertasPrioridades]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertasPrioridades](
	[idOfertaPrioridad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_OfertasPrioridades] PRIMARY KEY CLUSTERED 
(
	[idOfertaPrioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertasProveedores]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertasProveedores](
	[idOfertaProveedor] [int] IDENTITY(1,1) NOT NULL,
	[idOferta] [int] NOT NULL,
	[CIF] [varchar](15) NOT NULL,
	[retencion] [numeric](6, 2) NULL,
	[codFormaPago] [nvarchar](10) NULL,
	[adjudicado] [bit] NOT NULL,
	[codProveedor] [varchar](50) NULL,
 CONSTRAINT [PK_OfertasProveedores_1] PRIMARY KEY CLUSTERED 
(
	[idOfertaProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertasProveedoresProvisional]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertasProveedoresProvisional](
	[idOfertaProveedorProvisional] [int] IDENTITY(1,1) NOT NULL,
	[CIF] [varchar](15) NOT NULL,
	[nombre] [varchar](100) NULL,
	[telefono] [varchar](50) NULL,
	[mail] [varchar](50) NULL,
	[creado] [bit] NULL,
 CONSTRAINT [PK_OfertasProveedores] PRIMARY KEY CLUSTERED 
(
	[idOfertaProveedorProvisional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertasProveedoresRecursosPrecio]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertasProveedoresRecursosPrecio](
	[idOfertaProveedorRecursoPrecio] [int] IDENTITY(1,1) NOT NULL,
	[idOfertaRecurso] [int] NOT NULL,
	[idOfertaProveedor] [int] NOT NULL,
	[precio] [numeric](12, 4) NULL,
	[precioAlquiler] [numeric](14, 4) NULL,
 CONSTRAINT [PK_OfertasRecursosPrecio] PRIMARY KEY CLUSTERED 
(
	[idOfertaRecurso] ASC,
	[idOfertaProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertasRecursos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertasRecursos](
	[idOfertaRecurso] [int] IDENTITY(1,1) NOT NULL,
	[idOferta] [int] NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[notas] [varchar](200) NULL,
 CONSTRAINT [PK_OfertasRecursos] PRIMARY KEY CLUSTERED 
(
	[idOfertaRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertasRecursosMC]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertasRecursosMC](
	[idOfertaRecursoMC] [int] IDENTITY(1,1) NOT NULL,
	[idOfertaRecurso] [int] NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[cantidad] [numeric](14, 4) NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_OfertasRecursosMC] PRIMARY KEY CLUSTERED 
(
	[idOfertaRecursoMC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertasRecursosMCObjetos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertasRecursosMCObjetos](
	[idOfertaRecursoMCObjeto] [int] IDENTITY(1,1) NOT NULL,
	[idOfertaRecursoMC] [int] NOT NULL,
	[idObjeto] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_OfertasRecursosMCObjetos] PRIMARY KEY CLUSTERED 
(
	[idOfertaRecursoMCObjeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertasTipos]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertasTipos](
	[idOfertaTipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[ofertaTipoNAV] [int] NOT NULL,
 CONSTRAINT [PK_OfertasTipos] PRIMARY KEY CLUSTERED 
(
	[idOfertaTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment Terms]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment Terms](
	[Code] [varchar](10) NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Payment Terms] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planned]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planned](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codActividad] [varchar](50) NOT NULL,
	[codZonaControl] [varchar](50) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[numOperarios] [int] NULL,
 CONSTRAINT [PK_Planned] PRIMARY KEY CLUSTERED 
(
	[codActividad] ASC,
	[codZonaControl] ASC,
	[idObra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlannedEntradas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlannedEntradas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[semana] [int] NOT NULL,
	[cantidad] [decimal](20, 2) NULL,
	[codRecursoTransp] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PlannedEntradas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlannedObjects]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlannedObjects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idPlanned] [int] NOT NULL,
	[idObjeto] [uniqueidentifier] NOT NULL,
	[orden] [int] NULL,
	[fechaInicio] [datetime] NULL,
	[fechaFin] [datetime] NULL,
	[activo] [bit] NOT NULL,
	[circular] [bit] NOT NULL,
 CONSTRAINT [PK_PlannedObjects_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlannedObjectsDependencies]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlannedObjectsDependencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idPlannedObject] [int] NOT NULL,
	[idPlannedObjectPredecesor] [int] NOT NULL,
	[gap] [numeric](12, 2) NOT NULL,
 CONSTRAINT [PK_PlannedObjectsDependencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlannedObjectsPercentages]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlannedObjectsPercentages](
	[idPlannedObjectPercentage] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[porcentaje] [decimal](12, 4) NOT NULL,
	[idPlannedObject] [int] NOT NULL,
 CONSTRAINT [PK_PlannedObjectPercentages] PRIMARY KEY CLUSTERED 
(
	[idPlannedObject] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlannedOperarios]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlannedOperarios](
	[idPlannedOperario] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[codPerfil] [varchar](50) NOT NULL,
	[dia] [datetime] NOT NULL,
	[operarios] [int] NULL,
	[jornada] [decimal](12, 1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlannedRelResources]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlannedRelResources](
	[idobra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codDep] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idobra] ASC,
	[codSup] ASC,
	[codDep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreciosBaseHistory]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreciosBaseHistory](
	[idRecurso] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[precio] [numeric](12, 4) NOT NULL,
 CONSTRAINT [PK_PreciosBaseHistory] PRIMARY KEY CLUSTERED 
(
	[codRecurso] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RangosTrabajador]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RangosTrabajador](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_RangosEmpleados] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourcesGroupConversions]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourcesGroupConversions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[idProveedor] [varchar](50) NOT NULL,
	[codRecurso] [varchar](50) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[unidades] [numeric](14, 4) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
	[activo] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RevitGruposNC]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevitGruposNC](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodNotaClaveModelada] [varchar](50) NOT NULL,
	[CodNotaClaveCambios] [varchar](50) NOT NULL,
	[DescripcionCambios] [nvarchar](500) NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
	[TipoArchivo] [varchar](20) NOT NULL,
	[N5] [varchar](3) NULL,
	[N6] [varchar](3) NULL,
	[IdObra] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_RevitGruposNC] UNIQUE NONCLUSTERED 
(
	[CodNotaClaveCambios] ASC,
	[IdObra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RevitRecodifSNC]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevitRecodifSNC](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codNotaClave] [varchar](50) NOT NULL,
	[codNotaClaveRecodif] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RevitRecodifSNC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subcontratas]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcontratas](
	[ID] [int] NOT NULL,
	[codProveedor] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NULL,
	[fechaVencimiento] [datetime] NULL,
	[bloqueado] [tinyint] NULL,
	[documentacionCorrecta] [tinyint] NULL,
 CONSTRAINT [PK_Subcontratas] PRIMARY KEY CLUSTERED 
(
	[codProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubcontratasRel]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubcontratasRel](
	[idObra] [varchar](50) NOT NULL,
	[codSup] [varchar](50) NOT NULL,
	[codInf] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SubcontratasRel] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC,
	[codSup] ASC,
	[codInf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposHora]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposHora](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idClaseHora] [int] NOT NULL,
	[idTipoTrabajador] [int] NULL,
	[nombre] [nvarchar](250) NOT NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoHora] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposTrabajador]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposTrabajador](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_TiposEmpleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMP_reparto_REC-ACT_20220701]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMP_reparto_REC-ACT_20220701](
	[codNotaClave] [nvarchar](255) NULL,
	[codRecurso] [nvarchar](255) NULL,
	[codActividad] [nvarchar](255) NULL,
	[porcentaje_actual] [float] NULL,
	[porcentaje_modificado] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TotalesProduccionProveedorMesCab]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalesProduccionProveedorMesCab](
	[idCaptura] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[year] [int] NOT NULL,
	[month] [int] NOT NULL,
	[day] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaCaptura] [datetime] NOT NULL,
	[autorCaptura] [varchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_TotalesProduccionProveedorMesCab] PRIMARY KEY CLUSTERED 
(
	[idCaptura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TotalesProduccionProveedorMesLin]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalesProduccionProveedorMesLin](
	[importeProduccion] [decimal](18, 2) NOT NULL,
	[importeConsumido] [decimal](18, 2) NOT NULL,
	[importeContratado] [decimal](18, 2) NOT NULL,
	[importeEjecutado] [decimal](18, 2) NOT NULL,
	[importeSuministrado] [decimal](18, 2) NOT NULL,
	[importeAcopiado] [decimal](18, 2) NOT NULL,
	[desviacion] [decimal](18, 2) NOT NULL,
	[importeFacturado] [decimal](18, 2) NOT NULL,
	[idCaptura] [int] NOT NULL,
	[codProveedor] [varchar](20) NOT NULL,
	[importeProgramado] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TotalesProduccionProveedorMesLin] PRIMARY KEY CLUSTERED 
(
	[idCaptura] ASC,
	[codProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TotalesProduccionProveedorSemanaCab]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalesProduccionProveedorSemanaCab](
	[idCaptura] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[year] [int] NOT NULL,
	[month] [int] NOT NULL,
	[day] [int] NOT NULL,
	[fechaCaptura] [datetime] NOT NULL,
	[autorCaptura] [varchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_TotalesProduccionProveedorSemanaCab] PRIMARY KEY CLUSTERED 
(
	[idCaptura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TotalesProduccionProveedorSemanaLin]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalesProduccionProveedorSemanaLin](
	[importeConsumido] [decimal](18, 2) NOT NULL,
	[importeEjecutado] [decimal](18, 2) NOT NULL,
	[horasEjecutadas] [decimal](18, 2) NOT NULL,
	[horasReales] [decimal](18, 2) NOT NULL,
	[horasGanadas] [decimal](18, 2) NOT NULL,
	[numTrabajadoresSemana] [int] NOT NULL,
	[numRotacionesSemana] [int] NOT NULL,
	[idCaptura] [int] NOT NULL,
	[codProveedor] [varchar](20) NOT NULL,
	[importeProgramado] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TotalesProduccionProveedorSemanaLin] PRIMARY KEY CLUSTERED 
(
	[idCaptura] ASC,
	[codProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajadores]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajadores](
	[ID] [int] NOT NULL,
	[DNI] [varchar](50) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[propio] [tinyint] NOT NULL,
	[idSubcontrata] [int] NULL,
	[fechaVencimiento] [datetime] NULL,
	[bloqueado] [tinyint] NULL,
	[documentacionCorrecta] [tinyint] NULL,
	[createdDate] [datetime] NULL,
	[modifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Trabajadores] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrabajadoresPropiosObra]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrabajadoresPropiosObra](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [nvarchar](50) NULL,
	[nombre] [nvarchar](100) NULL,
	[DNI] [nvarchar](20) NULL,
	[idTipoTrabajador] [int] NULL,
	[idRangoTrabajador] [int] NULL,
	[fechaCreacion] [datetime] NULL,
	[fechaModificacion] [datetime] NULL,
	[activo] [bit] NULL,
	[codActividad] [varchar](50) NULL,
 CONSTRAINT [PK_TrabajadoresPropiosObra] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGridTemplate]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGridTemplate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](100) NOT NULL,
	[codTemplate] [nvarchar](4000) NOT NULL,
	[templateData] [nvarchar](max) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_UserGridTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[UserName] [nvarchar](50) NOT NULL,
	[MachineName] [nvarchar](50) NOT NULL,
	[HubeVersion] [int] NOT NULL,
	[HubeEnv] [nvarchar](10) NOT NULL,
	[LastDate] [date] NOT NULL,
	[CPU] [nvarchar](150) NOT NULL,
	[CPUCores] [int] NOT NULL,
	[CPUThreads] [int] NOT NULL,
	[CPUFrecuency] [int] NOT NULL,
	[RAM] [decimal](20, 0) NOT NULL,
 CONSTRAINT [pk_UserInformation] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[HubeEnv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosApp]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosApp](
	[idUser] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosObra]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosObra](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [varchar](50) NOT NULL,
	[usuario] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 02/01/2024 10:01:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[No_] [varchar](20) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[Contact] [varchar](100) NOT NULL,
	[Phone No_] [varchar](30) NOT NULL,
	[Payment Terms Code] [varchar](10) NOT NULL,
	[VAT Registration No_] [varchar](20) NOT NULL,
	[E-Mail] [varchar](80) NOT NULL,
	[Días envío facturas proforma] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[No_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActividadesSemanal] ADD  CONSTRAINT [DF_ActividadesSemanal_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ActividadesSemanal] ADD  CONSTRAINT [DF_ActividadesSemanal_fechaModificacion]  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[ActividadesSemanal] ADD  CONSTRAINT [DF_ActividadesSemanal_recurrente]  DEFAULT ((0)) FOR [recurrente]
GO
ALTER TABLE [dbo].[AlbaranesCAB] ADD  CONSTRAINT [DF_Albaranes_Presto]  DEFAULT ('N') FOR [Presto]
GO
ALTER TABLE [dbo].[AlbaranesLIN] ADD  CONSTRAINT [DF_AlbaranesLIN_Maquinaria]  DEFAULT ((0)) FOR [Maquinaria]
GO
ALTER TABLE [dbo].[AlbaranesLIN] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[Almacenes] ADD  CONSTRAINT [DF_Almacenes_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[AlmacenesSemanal] ADD  CONSTRAINT [DF_AlmacenesSemanal_cerrado]  DEFAULT ((0)) FOR [cerrado]
GO
ALTER TABLE [dbo].[AlmacenesSemanalConsumos] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[AlmacenesSemanalRecursos] ADD  DEFAULT ((0)) FOR [Incidencia]
GO
ALTER TABLE [dbo].[AuditoriasModulosControl] ADD  CONSTRAINT [DF__Auditoria__Audit__149C0161]  DEFAULT ((1)) FOR [Auditado]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_L]  DEFAULT ((0)) FOR [L]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_M]  DEFAULT ((0)) FOR [M]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_X]  DEFAULT ((0)) FOR [X]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_J]  DEFAULT ((0)) FOR [J]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_V]  DEFAULT ((0)) FOR [V]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_S]  DEFAULT ((0)) FOR [S]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_D]  DEFAULT ((0)) FOR [D]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_horasJornadaLV]  DEFAULT ((0)) FOR [horasJornadaLV]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_horasJornadaSD]  DEFAULT ((0)) FOR [horasJornadaSD]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_cerrada]  DEFAULT ((0)) FOR [cerrada]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[CuadrillasSemanal] ADD  CONSTRAINT [DF_CuadrillasSemanal_fechaModificacion]  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[ExcepcionesMedicion] ADD  CONSTRAINT [DF_ExcepcionesMedicion_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ExcepcionesMedicion] ADD  CONSTRAINT [DF_ExcepcionesMedicion_fechaModificacion]  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[FacturasProformaCAB] ADD  DEFAULT (getdate()) FOR [fechaProforma]
GO
ALTER TABLE [dbo].[FacturasProformaLIN] ADD  DEFAULT (getdate()) FOR [fechaGen]
GO
ALTER TABLE [dbo].[GlobalCapitulos] ADD  DEFAULT ((0)) FOR [oculto]
GO
ALTER TABLE [dbo].[GlobalGruposSTMethods] ADD  CONSTRAINT [DF_GlobalGruposSTMethods_idTipoGrupo]  DEFAULT ((0)) FOR [idTipoGrupo]
GO
ALTER TABLE [dbo].[GlobalPerfilEmpresas] ADD  CONSTRAINT [DF_GlobalPerfilEmpresas_orden]  DEFAULT ((0)) FOR [orden]
GO
ALTER TABLE [dbo].[GlobalRelMethods] ADD  CONSTRAINT [DF_GlobalRelMethod_rendimiento]  DEFAULT ((0)) FOR [rendimiento]
GO
ALTER TABLE [dbo].[GlobalRelMethodsResources] ADD  CONSTRAINT [DF_GlobalRelMethodResource_rendConsumo]  DEFAULT ((0)) FOR [rendConsumo]
GO
ALTER TABLE [dbo].[GlobalRelMethodsResources] ADD  CONSTRAINT [DF_GlobalRelMethodResource_rendDesglosado]  DEFAULT ((0)) FOR [rendDesglosado]
GO
ALTER TABLE [dbo].[GlobalRelMethodsResources] ADD  DEFAULT ((0)) FOR [rendPlan]
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources] ADD  CONSTRAINT [DF_GlobalRelSTMethodsResources_porcentaje]  DEFAULT ((1)) FOR [porcentaje]
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources] ADD  DEFAULT ((0)) FOR [porcentajeRecup]
GO
ALTER TABLE [dbo].[GlobalRelVagonesScheduleTasks] ADD  CONSTRAINT [DF_GlobalRelVagonesScheduleTasks_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[GlobalRelVagonesZonificacionNs] ADD  CONSTRAINT [DF_GlobalRelVagonesZonificacionNs_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[GlobalResources] ADD  CONSTRAINT [DF_GlobalResources_costeTeorico]  DEFAULT ((0)) FOR [costeTeorico]
GO
ALTER TABLE [dbo].[GlobalResources] ADD  CONSTRAINT [DF_GlobalResources_idNaturaleza]  DEFAULT ((0)) FOR [idNaturaleza]
GO
ALTER TABLE [dbo].[GlobalResources] ADD  CONSTRAINT [DF_GlobalResources_Ventas]  DEFAULT ((0)) FOR [comercial]
GO
ALTER TABLE [dbo].[GlobalScheduleTasks] ADD  CONSTRAINT [DF_GlobalScheduleTasks_visibleInicial]  DEFAULT ((0)) FOR [visibleFinal]
GO
ALTER TABLE [dbo].[GlobalSTPerfiles] ADD  CONSTRAINT [DF_GlobalSTPerfiles_coeficienteHorasTrabajadas]  DEFAULT ((0)) FOR [coeficienteHorasTrabajadas]
GO
ALTER TABLE [dbo].[GlobalSTQuantities] ADD  CONSTRAINT [DF_GlobalSTQuantities_rendProduccion]  DEFAULT ((0)) FOR [rendProduccion]
GO
ALTER TABLE [dbo].[GlobalSTQuantities] ADD  CONSTRAINT [DF_GlobalSTQuantities_computable]  DEFAULT ((0)) FOR [computable]
GO
ALTER TABLE [dbo].[GlobalSTQuantities] ADD  DEFAULT ((1)) FOR [rendComputable]
GO
ALTER TABLE [dbo].[GlobalTrenes] ADD  CONSTRAINT [DF_GlobalTrenes_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[GlobalVagones] ADD  CONSTRAINT [DF_GlobalVagones_hasAllNsRelated]  DEFAULT ((1)) FOR [hasAllNsRelated]
GO
ALTER TABLE [dbo].[GlobalVagones] ADD  CONSTRAINT [DF_GlobalVagones_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[GlobalVentasSuperficies] ADD  DEFAULT (NULL) FOR [codNotaClave]
GO
ALTER TABLE [dbo].[GlobalZonificacionNs] ADD  DEFAULT ((1)) FOR [isVisibleMatriz]
GO
ALTER TABLE [dbo].[HorasTrabajadas] ADD  CONSTRAINT [DF_EmpleadosActividades_UsuarioGrabacion]  DEFAULT (user_name()) FOR [usuarioCreacion]
GO
ALTER TABLE [dbo].[HorasTrabajadasiPadRepartidas] ADD  CONSTRAINT [DF_HorasTrabajadasiPadRepartidas_UsuarioGrabacion]  DEFAULT (user_name()) FOR [usuarioCreacion]
GO
ALTER TABLE [dbo].[Obras] ADD  DEFAULT ((0)) FOR [isPromocion]
GO
ALTER TABLE [dbo].[Obras] ADD  DEFAULT ((0)) FOR [isOficinaTecnica]
GO
ALTER TABLE [dbo].[Obras] ADD  DEFAULT ((0)) FOR [isController]
GO
ALTER TABLE [dbo].[Obras] ADD  DEFAULT ((0)) FOR [isProduccion]
GO
ALTER TABLE [dbo].[Obras] ADD  DEFAULT ((1)) FOR [generateProformas]
GO
ALTER TABLE [dbo].[ObrasComparadorImportesPrePro] ADD  CONSTRAINT [DF_ObrasComparadorImportesPrePro_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasGruposSTMethods] ADD  CONSTRAINT [DF_ObrasGruposSTMethods_idTipoGrupo]  DEFAULT ((0)) FOR [idTipoGrupo]
GO
ALTER TABLE [dbo].[ObrasGruposSTMethodsDinamica] ADD  CONSTRAINT [DF_ObrasGruposSTMethodsDinamica_idTipoGrupo]  DEFAULT ((0)) FOR [idTipoGrupo]
GO
ALTER TABLE [dbo].[ObrasGruposSTMethodsPromocion] ADD  CONSTRAINT [DF_ObrasGruposSTMethodsPromocion_idTipoGrupo]  DEFAULT ((0)) FOR [idTipoGrupo]
GO
ALTER TABLE [dbo].[ObrasGruposSTMethodsPromocion] ADD  DEFAULT ((0)) FOR [promType]
GO
ALTER TABLE [dbo].[ObrasGruposSTMethodsVersion] ADD  CONSTRAINT [DF_ObrasGruposSTMethodsVersion_idTipoGrupo]  DEFAULT ((0)) FOR [idTipoGrupo]
GO
ALTER TABLE [dbo].[ObrasIncidencias] ADD  DEFAULT ('') FOR [nombreProveedor]
GO
ALTER TABLE [dbo].[ObrasMethods] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[ObrasMethodsHistory] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[ObrasMethodsHistory] ADD  DEFAULT ((0)) FOR [cantidad]
GO
ALTER TABLE [dbo].[ObrasMethodsPromocion] ADD  DEFAULT ((0)) FOR [promType]
GO
ALTER TABLE [dbo].[ObrasModelos] ADD  CONSTRAINT [DF_ObrasModelos_isModelComplete]  DEFAULT ((0)) FOR [isModelComplete]
GO
ALTER TABLE [dbo].[ObrasModulosControl] ADD  CONSTRAINT [DF_ObrasModulosControl_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasModulosControl] ADD  CONSTRAINT [DF__ObrasModu__incid__3BAF0C07]  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[ObrasModulosControlDinamica] ADD  CONSTRAINT [DF_ObrasModulosControlDinamica_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasModulosControlPromocion] ADD  CONSTRAINT [DF_ObrasModulosControlPromocion_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasModulosControlPromocion] ADD  CONSTRAINT [DF__ObrasModu__promT__28744A9C]  DEFAULT ((0)) FOR [promType]
GO
ALTER TABLE [dbo].[ObrasPerfilEmpresas] ADD  CONSTRAINT [DF_ObrasPerfilEmpresas_orden]  DEFAULT ((0)) FOR [orden]
GO
ALTER TABLE [dbo].[ObrasPerfilEmpresasDinamica] ADD  CONSTRAINT [DF_ObrasPerfilEmpresasDinamica_orden]  DEFAULT ((0)) FOR [orden]
GO
ALTER TABLE [dbo].[ObrasPerfilEmpresasPromocion] ADD  CONSTRAINT [DF_ObrasPerfilEmpresasPromocion_orden]  DEFAULT ((0)) FOR [orden]
GO
ALTER TABLE [dbo].[ObrasPerfilEmpresasPromocion] ADD  DEFAULT ((0)) FOR [promType]
GO
ALTER TABLE [dbo].[ObrasPlanificacionBasePerfiles] ADD  DEFAULT ((0)) FOR [isPerfilPlan]
GO
ALTER TABLE [dbo].[ObrasPlanificacionOrdenVagon] ADD  DEFAULT (NULL) FOR [orden]
GO
ALTER TABLE [dbo].[ObrasRelGruposSTMethodsPromocion] ADD  DEFAULT ((0)) FOR [promType]
GO
ALTER TABLE [dbo].[ObrasRelMethodsContrataVersion] ADD  DEFAULT ((1)) FOR [tipo]
GO
ALTER TABLE [dbo].[ObrasRelMethodsPromocion] ADD  CONSTRAINT [DF_ObrasRelMethodsPromocion_rendimiento]  DEFAULT ((0)) FOR [rendimiento]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResources] ADD  CONSTRAINT [DF_ObrasRelMethodResource_rendConsumo]  DEFAULT ((0)) FOR [rendConsumo]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResources] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResources] ADD  DEFAULT ((0)) FOR [rendPlan]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesDinamica] ADD  CONSTRAINT [DF_ObrasRelMethodResourceDinamica_rendConsumo]  DEFAULT ((0)) FOR [rendConsumo]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesDinamica] ADD  DEFAULT ((0)) FOR [rendPlan]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesHistory] ADD  CONSTRAINT [DF_ObrasRelMethodResourceHistory_rendConsumo]  DEFAULT ((0)) FOR [rendConsumo]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesHistory] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesPromocion] ADD  CONSTRAINT [DF_ObrasRelMethodsResourcesPromocion_rendConsumo]  DEFAULT ((0)) FOR [rendConsumo]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesPromocion] ADD  DEFAULT ((0)) FOR [promType]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesPromocion] ADD  DEFAULT ((0)) FOR [rendPlan]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesVersion] ADD  CONSTRAINT [DF_ObrasRelMethodsResourcesVersion_rendConsumo]  DEFAULT ((0)) FOR [rendConsumo]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesVersion] ADD  DEFAULT ((0)) FOR [rendPlan]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources] ADD  CONSTRAINT [DF_ObrasRelSTMethodsResources_porcentaje]  DEFAULT ((1)) FOR [porcentaje]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources] ADD  DEFAULT ((0)) FOR [porcentajeRecup]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica] ADD  CONSTRAINT [DF_ObrasRelSTMethodsResourcesDinamica_porcentaje]  DEFAULT ((1)) FOR [porcentaje]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica] ADD  DEFAULT ((0)) FOR [porcentajeRecup]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion] ADD  CONSTRAINT [DF_ObrasRelSTMethodsResourcesPromocion_porcentaje]  DEFAULT ((1)) FOR [porcentaje]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion] ADD  DEFAULT ((0)) FOR [promType]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesVersion] ADD  CONSTRAINT [DF_ObrasRelSTMethodsResourcesVersion_porcentaje]  DEFAULT ((1)) FOR [porcentaje]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasks] ADD  CONSTRAINT [DF_ObrasRelVagonesScheduleTasks_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksDinamica] ADD  CONSTRAINT [DF_ObrasRelVagonesScheduleTasksDinamica_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksPromocion] ADD  CONSTRAINT [DF_ObrasRelVagonesScheduleTasksPromocion_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksVersion] ADD  CONSTRAINT [DF_ObrasRelVagonesScheduleTasksVersion_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNs] ADD  CONSTRAINT [DF_ObrasRelVagonesZonificacionNs_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNsDinamica] ADD  CONSTRAINT [DF_ObrasRelVagonesZonificacionNsDinamica_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNsPromocion] ADD  CONSTRAINT [DF_ObrasRelVagonesZonificacionNsPromocion_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNsVersion] ADD  CONSTRAINT [DF_ObrasRelVagonesZonificacionNsVersion_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasResources] ADD  CONSTRAINT [DF_ObrasResources_costeTeorico]  DEFAULT ((0)) FOR [costeTeorico]
GO
ALTER TABLE [dbo].[ObrasResources] ADD  CONSTRAINT [DF_ObrasResources_costeContratado]  DEFAULT ((0)) FOR [costeContratado]
GO
ALTER TABLE [dbo].[ObrasResources] ADD  CONSTRAINT [DF_ObrasResources_idNaturaleza]  DEFAULT ((0)) FOR [idNaturaleza]
GO
ALTER TABLE [dbo].[ObrasResources] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[ObrasResourcesDinamica] ADD  CONSTRAINT [DF_ObrasResourcesDinamica_costeTeorico]  DEFAULT ((0)) FOR [costeTeorico]
GO
ALTER TABLE [dbo].[ObrasResourcesDinamica] ADD  CONSTRAINT [DF_ObrasResourcesDinamica_idNaturaleza]  DEFAULT ((0)) FOR [idNaturaleza]
GO
ALTER TABLE [dbo].[ObrasResourcesDinamica] ADD  DEFAULT ((0)) FOR [comercial]
GO
ALTER TABLE [dbo].[ObrasResourcesEjecutados] ADD  DEFAULT ('Hiberus') FOR [usuarioCreacion]
GO
ALTER TABLE [dbo].[ObrasResourcesHistory] ADD  CONSTRAINT [DF_ObrasResourcesHistory_costeTeorico]  DEFAULT ((0)) FOR [costeTeorico]
GO
ALTER TABLE [dbo].[ObrasResourcesHistory] ADD  CONSTRAINT [DF_ObrasResourcesHistory_costeContratado]  DEFAULT ((0)) FOR [costeContratado]
GO
ALTER TABLE [dbo].[ObrasResourcesHistory] ADD  CONSTRAINT [DF_ObrasResourcesHistory_idNaturaleza]  DEFAULT ((0)) FOR [idNaturaleza]
GO
ALTER TABLE [dbo].[ObrasResourcesHistory] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[ObrasResourcesPromocion] ADD  CONSTRAINT [DF_ObrasResourcesPromocion_costeTeorico]  DEFAULT ((0)) FOR [costeTeorico]
GO
ALTER TABLE [dbo].[ObrasResourcesPromocion] ADD  CONSTRAINT [DF_ObrasResourcesPromocion_idNaturaleza]  DEFAULT ((0)) FOR [idNaturaleza]
GO
ALTER TABLE [dbo].[ObrasResourcesPromocion] ADD  DEFAULT ((0)) FOR [promType]
GO
ALTER TABLE [dbo].[ObrasResourcesPromocion] ADD  DEFAULT ((0)) FOR [comercial]
GO
ALTER TABLE [dbo].[ObrasResourcesVersion] ADD  CONSTRAINT [DF_ObrasResourcesVersion_costeTeorico]  DEFAULT ((0)) FOR [costeTeorico]
GO
ALTER TABLE [dbo].[ObrasResourcesVersion] ADD  CONSTRAINT [DF_ObrasResourcesVersion_idNaturaleza]  DEFAULT ((0)) FOR [idNaturaleza]
GO
ALTER TABLE [dbo].[ObrasResourcesVersion] ADD  DEFAULT ((0)) FOR [comercial]
GO
ALTER TABLE [dbo].[ObrasScheduleTasks] ADD  CONSTRAINT [DF_ObrasScheduleTasks_orden]  DEFAULT ((0)) FOR [orden]
GO
ALTER TABLE [dbo].[ObrasScheduleTasks] ADD  CONSTRAINT [DF_ObrasScheduleTasks_visibleInicial]  DEFAULT ((0)) FOR [visibleFinal]
GO
ALTER TABLE [dbo].[ObrasScheduleTasks] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[ObrasScheduleTasksDinamica] ADD  CONSTRAINT [DF_ObrasScheduleTasksDinamica_orden]  DEFAULT ((0)) FOR [orden]
GO
ALTER TABLE [dbo].[ObrasScheduleTasksDinamica] ADD  CONSTRAINT [DF_ObrasScheduleTasksDinamica_visibleInicial]  DEFAULT ((0)) FOR [visibleFinal]
GO
ALTER TABLE [dbo].[ObrasScheduleTasksPromocion] ADD  CONSTRAINT [DF_ObrasScheduleTasksPromocion_visibleInicial]  DEFAULT ((0)) FOR [visibleFinal]
GO
ALTER TABLE [dbo].[ObrasScheduleTasksPromocion] ADD  DEFAULT ((0)) FOR [promType]
GO
ALTER TABLE [dbo].[ObrasScheduleTasksVersion] ADD  CONSTRAINT [DF_ObrasScheduleTasksVersion_visibleInicial]  DEFAULT ((0)) FOR [visibleFinal]
GO
ALTER TABLE [dbo].[ObrasSTQuantities] ADD  CONSTRAINT [DF_ObrasSTQuantities_rendProduccion]  DEFAULT ((0)) FOR [rendProduccion]
GO
ALTER TABLE [dbo].[ObrasSTQuantities] ADD  CONSTRAINT [DF_ObrasSTQuantities_computable]  DEFAULT ((0)) FOR [computable]
GO
ALTER TABLE [dbo].[ObrasSTQuantities] ADD  CONSTRAINT [ValorDefectoUno]  DEFAULT ((1)) FOR [rendComputable]
GO
ALTER TABLE [dbo].[ObrasSTQuantities] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesDinamica] ADD  CONSTRAINT [DF_ObrasSTQuantitiesDinamica_rendProduccion]  DEFAULT ((0)) FOR [rendProduccion]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesDinamica] ADD  CONSTRAINT [DF_ObrasSTQuantitiesDinamica_computable]  DEFAULT ((0)) FOR [computable]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesDinamica] ADD  CONSTRAINT [ValorDefectoUnoDinamica]  DEFAULT ((1)) FOR [rendComputable]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesPromocion] ADD  CONSTRAINT [DF_ObrasSTQuantitiesPromocion_rendProduccion]  DEFAULT ((0)) FOR [rendProduccion]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesPromocion] ADD  CONSTRAINT [DF_ObrasSTQuantitiesPromocion_computable]  DEFAULT ((0)) FOR [computable]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesPromocion] ADD  CONSTRAINT [DF_ObrasSTQuantitiesPromocion_rendComputable]  DEFAULT ((1)) FOR [rendComputable]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesPromocion] ADD  DEFAULT ((0)) FOR [promType]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesVersion] ADD  CONSTRAINT [DF_ObrasSTQuantitiesVersion_rendProduccion]  DEFAULT ((0)) FOR [rendProduccion]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesVersion] ADD  CONSTRAINT [DF_ObrasSTQuantitiesVersion_computable]  DEFAULT ((0)) FOR [computable]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesVersion] ADD  CONSTRAINT [DF_ObrasSTQuantitiesVersion_rendComputable]  DEFAULT ((1)) FOR [rendComputable]
GO
ALTER TABLE [dbo].[ObrasSTZonasControl] ADD  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[ObrasSTZonasControlPromocion] ADD  DEFAULT ((0)) FOR [promType]
GO
ALTER TABLE [dbo].[ObrasSTZonasEjecutados] ADD  DEFAULT ('Hiberus') FOR [usuarioCreacion]
GO
ALTER TABLE [dbo].[ObrasTrenes] ADD  CONSTRAINT [DF_ObrasTrenes_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasTrenesDinamica] ADD  CONSTRAINT [DF_ObrasTrenesDinamica_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasTrenesPromocion] ADD  CONSTRAINT [DF_ObrasTrenesPromocion_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasTrenesVersion] ADD  CONSTRAINT [DF_ObrasTrenesVersion_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasVagones] ADD  CONSTRAINT [DF_ObrasVagones_hasAllNsRelated]  DEFAULT ((1)) FOR [hasAllNsRelated]
GO
ALTER TABLE [dbo].[ObrasVagones] ADD  CONSTRAINT [DF_ObrasVagones_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasVagonesDinamica] ADD  CONSTRAINT [DF_ObrasVagonesDinamica_hasAllNsRelated]  DEFAULT ((1)) FOR [hasAllNsRelated]
GO
ALTER TABLE [dbo].[ObrasVagonesDinamica] ADD  CONSTRAINT [DF_ObrasVagonesDinamica_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasVagonesPromocion] ADD  CONSTRAINT [DF_ObrasVagonesPromocion_hasAllNsRelated]  DEFAULT ((1)) FOR [hasAllNsRelated]
GO
ALTER TABLE [dbo].[ObrasVagonesPromocion] ADD  CONSTRAINT [DF_ObrasVagonesPromocion_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasVagonesVersion] ADD  CONSTRAINT [DF_ObrasVagonesVersion_hasAllNsRelated]  DEFAULT ((1)) FOR [hasAllNsRelated]
GO
ALTER TABLE [dbo].[ObrasVagonesVersion] ADD  CONSTRAINT [DF_ObrasVagonesVersion_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[ObrasVentasSuperficiesVersiones] ADD  DEFAULT ((1)) FOR [isComputable]
GO
ALTER TABLE [dbo].[ObrasVentasSuperficiesVersiones] ADD  DEFAULT (NULL) FOR [codNotaClave]
GO
ALTER TABLE [dbo].[ObrasVentasSuperficiesVersiones] ADD  DEFAULT ((0)) FOR [isCalculado]
GO
ALTER TABLE [dbo].[ObrasVentasVersiones] ADD  CONSTRAINT [c_archivo]  DEFAULT ('') FOR [archivo]
GO
ALTER TABLE [dbo].[ObrasZonificacionNs] ADD  DEFAULT ((1)) FOR [isVisibleMatriz]
GO
ALTER TABLE [dbo].[ObrasZonificacionNsDinamica] ADD  DEFAULT ((1)) FOR [isVisibleMatriz]
GO
ALTER TABLE [dbo].[ObrasZonificacionNsPromocion] ADD  DEFAULT ((1)) FOR [isVisibleMatriz]
GO
ALTER TABLE [dbo].[ObrasZonificacionNsVersion] ADD  DEFAULT ((1)) FOR [isVisibleMatriz]
GO
ALTER TABLE [dbo].[Ofertas] ADD  CONSTRAINT [DF_Ofertas_definitva]  DEFAULT ((0)) FOR [definitiva]
GO
ALTER TABLE [dbo].[Ofertas] ADD  CONSTRAINT [DF_Ofertas_presentarAMesa]  DEFAULT ((0)) FOR [presentarAMesa]
GO
ALTER TABLE [dbo].[Ofertas] ADD  CONSTRAINT [DF_Ofertas_incidencia]  DEFAULT ((0)) FOR [incidencia]
GO
ALTER TABLE [dbo].[OfertasComentariosUsuario] ADD  CONSTRAINT [DF_OfertasComentariosUsuario_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[OfertasProveedores] ADD  CONSTRAINT [DF_OfertasProveedores_adjudicado]  DEFAULT ((0)) FOR [adjudicado]
GO
ALTER TABLE [dbo].[PlannedEntradas] ADD  DEFAULT ('') FOR [codRecursoTransp]
GO
ALTER TABLE [dbo].[PlannedObjects] ADD  CONSTRAINT [DF_PlannedObjects_activo]  DEFAULT ((0)) FOR [activo]
GO
ALTER TABLE [dbo].[PlannedObjects] ADD  CONSTRAINT [DF_PlannedObjects_circular]  DEFAULT ((0)) FOR [circular]
GO
ALTER TABLE [dbo].[PlannedObjectsDependencies] ADD  CONSTRAINT [DF_PlannedObjectsDependencies_gap]  DEFAULT ((0)) FOR [gap]
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorMesLin] ADD  CONSTRAINT [default_ImpProg_Mes]  DEFAULT ((0)) FOR [importeProgramado]
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorSemanaLin] ADD  CONSTRAINT [default_ImpProg_Semana]  DEFAULT ((0)) FOR [importeProgramado]
GO
ALTER TABLE [dbo].[TrabajadoresPropiosObra] ADD  CONSTRAINT [DF_TrabajadoresPropiosObra_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[TrabajadoresPropiosObra] ADD  CONSTRAINT [DF_TrabajadoresPropiosObra_fechaModificacion]  DEFAULT (getdate()) FOR [fechaModificacion]
GO
ALTER TABLE [dbo].[AlbaranesLIN]  WITH CHECK ADD  CONSTRAINT [FK_AlbaranesCAB_idAlbaran] FOREIGN KEY([idAlbaran])
REFERENCES [dbo].[AlbaranesCAB] ([idAlbaran])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AlbaranesLIN] CHECK CONSTRAINT [FK_AlbaranesCAB_idAlbaran]
GO
ALTER TABLE [dbo].[AlbaranesLIN]  WITH CHECK ADD  CONSTRAINT [FK_AlbaranesLin_IncidenciasCategorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[IncidenciasCategorias] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[AlbaranesLIN] CHECK CONSTRAINT [FK_AlbaranesLin_IncidenciasCategorias]
GO
ALTER TABLE [dbo].[AlmacenesSemanalRecZonaControl]  WITH CHECK ADD  CONSTRAINT [FK_AlmacenesSemanalRecursos_AlmacenesSemanalRecZonaControl] FOREIGN KEY([idAlmacenSemanalRec])
REFERENCES [dbo].[AlmacenesSemanalRecursos] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AlmacenesSemanalRecZonaControl] CHECK CONSTRAINT [FK_AlmacenesSemanalRecursos_AlmacenesSemanalRecZonaControl]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[FacturasProformaAlbaranesLIN]  WITH NOCHECK ADD  CONSTRAINT [FK_FPAlb_AlbaranesLin] FOREIGN KEY([idLinea])
REFERENCES [dbo].[AlbaranesLIN] ([idLinea])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacturasProformaAlbaranesLIN] CHECK CONSTRAINT [FK_FPAlb_AlbaranesLin]
GO
ALTER TABLE [dbo].[FacturasProformaAlbaranesLIN]  WITH NOCHECK ADD  CONSTRAINT [FK_FPAlb_FacturasProformaLin] FOREIGN KEY([idFacturaProformaLin])
REFERENCES [dbo].[FacturasProformaLIN] ([idFacturaProformaLin])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacturasProformaAlbaranesLIN] CHECK CONSTRAINT [FK_FPAlb_FacturasProformaLin]
GO
ALTER TABLE [dbo].[FacturasProformaLIN]  WITH NOCHECK ADD  CONSTRAINT [FK_FacturasProformaCAB_idFacturaProforma] FOREIGN KEY([idFacturaProforma])
REFERENCES [dbo].[FacturasProformaCAB] ([idFacturaProforma])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacturasProformaLIN] CHECK CONSTRAINT [FK_FacturasProformaCAB_idFacturaProforma]
GO
ALTER TABLE [dbo].[GlobalRelMethods]  WITH NOCHECK ADD  CONSTRAINT [FK_GlobalMethods_codInf] FOREIGN KEY([codInf])
REFERENCES [dbo].[GlobalMethods] ([codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalRelMethods] CHECK CONSTRAINT [FK_GlobalMethods_codInf]
GO
ALTER TABLE [dbo].[GlobalRelMethodsResources]  WITH CHECK ADD  CONSTRAINT [FK_GlobalResources_GlobalRelMethodsResources_codNotaClave] FOREIGN KEY([codNotaClave])
REFERENCES [dbo].[GlobalMethods] ([codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalRelMethodsResources] CHECK CONSTRAINT [FK_GlobalResources_GlobalRelMethodsResources_codNotaClave]
GO
ALTER TABLE [dbo].[GlobalRelMethodsResources]  WITH CHECK ADD  CONSTRAINT [FK_GlobalResources_GlobalRelMethodsResources_codRecurso] FOREIGN KEY([codRecurso])
REFERENCES [dbo].[GlobalResources] ([codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalRelMethodsResources] CHECK CONSTRAINT [FK_GlobalResources_GlobalRelMethodsResources_codRecurso]
GO
ALTER TABLE [dbo].[GlobalRelResources]  WITH NOCHECK ADD  CONSTRAINT [FK_GlobalResources_GlobalRelResources_codSup] FOREIGN KEY([codSup])
REFERENCES [dbo].[GlobalResources] ([codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalRelResources] CHECK CONSTRAINT [FK_GlobalResources_GlobalRelResources_codSup]
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_GlobalMethods_GlobalRelSTMethodsResources_codNotaClave] FOREIGN KEY([codNotaClave])
REFERENCES [dbo].[GlobalMethods] ([codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources] CHECK CONSTRAINT [FK_GlobalMethods_GlobalRelSTMethodsResources_codNotaClave]
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_GlobalRelMethodResources_GlobalRelSTMethodsResources_codRecurso_codNotaClave] FOREIGN KEY([codNotaClave], [codRecurso])
REFERENCES [dbo].[GlobalRelMethodsResources] ([codNotaClave], [codRecurso])
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources] CHECK CONSTRAINT [FK_GlobalRelMethodResources_GlobalRelSTMethodsResources_codRecurso_codNotaClave]
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_GlobalResources_GlobalRelSTMethodsResources_codRecurso] FOREIGN KEY([codRecurso])
REFERENCES [dbo].[GlobalResources] ([codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources] CHECK CONSTRAINT [FK_GlobalResources_GlobalRelSTMethodsResources_codRecurso]
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_GlobalScheduleTasks_GlobalRelSTMethodsResources_codActividad] FOREIGN KEY([codActividad])
REFERENCES [dbo].[GlobalScheduleTasks] ([codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources] CHECK CONSTRAINT [FK_GlobalScheduleTasks_GlobalRelSTMethodsResources_codActividad]
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_GlobalSTQuantities_GlobalRelSTMethodsResources_codActividad_codNotaClave] FOREIGN KEY([codActividad], [codNotaClave])
REFERENCES [dbo].[GlobalSTQuantities] ([codActividad], [codNotaClave])
GO
ALTER TABLE [dbo].[GlobalRelSTMethodsResources] CHECK CONSTRAINT [FK_GlobalSTQuantities_GlobalRelSTMethodsResources_codActividad_codNotaClave]
GO
ALTER TABLE [dbo].[GlobalRelTipologiaPerfil]  WITH CHECK ADD FOREIGN KEY([codPerfil])
REFERENCES [dbo].[GlobalPerfilEmpresas] ([codPerfil])
GO
ALTER TABLE [dbo].[GlobalRelTipologiaPerfil]  WITH CHECK ADD FOREIGN KEY([codPerfil])
REFERENCES [dbo].[GlobalPerfilEmpresas] ([codPerfil])
GO
ALTER TABLE [dbo].[GlobalRelTipologiaPerfil]  WITH CHECK ADD FOREIGN KEY([idTipologia])
REFERENCES [dbo].[GlobalTipologiasObra] ([ID])
GO
ALTER TABLE [dbo].[GlobalRelTipologiaPerfil]  WITH CHECK ADD FOREIGN KEY([idTipologia])
REFERENCES [dbo].[GlobalTipologiasObra] ([ID])
GO
ALTER TABLE [dbo].[GlobalRelVagonesScheduleTasks]  WITH CHECK ADD  CONSTRAINT [FK_GlobalScheduleTasks_codActividad] FOREIGN KEY([codActividad])
REFERENCES [dbo].[GlobalScheduleTasks] ([codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalRelVagonesScheduleTasks] CHECK CONSTRAINT [FK_GlobalScheduleTasks_codActividad]
GO
ALTER TABLE [dbo].[GlobalRelVagonesScheduleTasks]  WITH CHECK ADD  CONSTRAINT [FK_ST_GlobalVagones_codVagon] FOREIGN KEY([codVagon])
REFERENCES [dbo].[GlobalVagones] ([codVagon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalRelVagonesScheduleTasks] CHECK CONSTRAINT [FK_ST_GlobalVagones_codVagon]
GO
ALTER TABLE [dbo].[GlobalRelVagonesZonificacionNs]  WITH NOCHECK ADD  CONSTRAINT [FK_Ns_GlobalVagones_codVagon] FOREIGN KEY([codVagon])
REFERENCES [dbo].[GlobalVagones] ([codVagon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalRelVagonesZonificacionNs] CHECK CONSTRAINT [FK_Ns_GlobalVagones_codVagon]
GO
ALTER TABLE [dbo].[GlobalResources]  WITH CHECK ADD  CONSTRAINT [FK_GlobalPerfilEmpresas] FOREIGN KEY([codPerfil])
REFERENCES [dbo].[GlobalPerfilEmpresas] ([codPerfil])
GO
ALTER TABLE [dbo].[GlobalResources] CHECK CONSTRAINT [FK_GlobalPerfilEmpresas]
GO
ALTER TABLE [dbo].[GlobalSTQuantities]  WITH CHECK ADD  CONSTRAINT [FK_GlobalMethods_GlobalSTQuantities_codNotaClave] FOREIGN KEY([codNotaClave])
REFERENCES [dbo].[GlobalMethods] ([codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalSTQuantities] CHECK CONSTRAINT [FK_GlobalMethods_GlobalSTQuantities_codNotaClave]
GO
ALTER TABLE [dbo].[GlobalSTQuantities]  WITH CHECK ADD  CONSTRAINT [FK_GlobalScheduleTasks_GlobalSTQuantities_codActividad] FOREIGN KEY([codActividad])
REFERENCES [dbo].[GlobalScheduleTasks] ([codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalSTQuantities] CHECK CONSTRAINT [FK_GlobalScheduleTasks_GlobalSTQuantities_codActividad]
GO
ALTER TABLE [dbo].[GlobalVagones]  WITH CHECK ADD  CONSTRAINT [FK_GlobalTrenes_codTren] FOREIGN KEY([codTren])
REFERENCES [dbo].[GlobalTrenes] ([codTren])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GlobalVagones] CHECK CONSTRAINT [FK_GlobalTrenes_codTren]
GO
ALTER TABLE [dbo].[GlobalVentasExcepcionesNotasClave]  WITH CHECK ADD FOREIGN KEY([codNotaClave])
REFERENCES [dbo].[GlobalMethods] ([codNotaClave])
GO
ALTER TABLE [dbo].[GlobalVentasExcepcionesNotasClave]  WITH CHECK ADD FOREIGN KEY([codNotaClave])
REFERENCES [dbo].[GlobalMethods] ([codNotaClave])
GO
ALTER TABLE [dbo].[GlobalVentasExcepcionesNotasClave]  WITH CHECK ADD FOREIGN KEY([idAgrupacion])
REFERENCES [dbo].[GlobalVentasExcepciones] ([id])
GO
ALTER TABLE [dbo].[GlobalVentasExcepcionesNotasClave]  WITH CHECK ADD FOREIGN KEY([idAgrupacion])
REFERENCES [dbo].[GlobalVentasExcepciones] ([id])
GO
ALTER TABLE [dbo].[GlobalVentasSuperficies]  WITH CHECK ADD FOREIGN KEY([idSeccion])
REFERENCES [dbo].[GlobalVentasSecciones] ([idSeccion])
GO
ALTER TABLE [dbo].[GlobalVentasSuperficies]  WITH CHECK ADD FOREIGN KEY([idSeccion])
REFERENCES [dbo].[GlobalVentasSecciones] ([idSeccion])
GO
ALTER TABLE [dbo].[GlobalVentasViviendasTipologias]  WITH CHECK ADD FOREIGN KEY([idTipologia])
REFERENCES [dbo].[GlobalTipologiasVentasObra] ([ID])
GO
ALTER TABLE [dbo].[GlobalVentasViviendasTipologias]  WITH CHECK ADD FOREIGN KEY([idTipologia])
REFERENCES [dbo].[GlobalTipologiasVentasObra] ([ID])
GO
ALTER TABLE [dbo].[Obras]  WITH CHECK ADD  CONSTRAINT [FK_GlobalTipologiasObra_id] FOREIGN KEY([idTipologiaObra])
REFERENCES [dbo].[GlobalTipologiasObra] ([ID])
GO
ALTER TABLE [dbo].[Obras] CHECK CONSTRAINT [FK_GlobalTipologiasObra_id]
GO
ALTER TABLE [dbo].[ObrasIncidenciasCantidadesPrevistas]  WITH CHECK ADD  CONSTRAINT [FK_ObrasIncidenciasCantidadesPrevistas_ObrasResources] FOREIGN KEY([IdObra], [CodRecurso])
REFERENCES [dbo].[ObrasResources] ([idObra], [codRecurso])
GO
ALTER TABLE [dbo].[ObrasIncidenciasCantidadesPrevistas] CHECK CONSTRAINT [FK_ObrasIncidenciasCantidadesPrevistas_ObrasResources]
GO
ALTER TABLE [dbo].[ObrasIncidenciasCantidadesPrevistas]  WITH CHECK ADD  CONSTRAINT [FK_ObrasIncidenciasCantidadesPrevistas_Vendor1] FOREIGN KEY([CodProveedor])
REFERENCES [dbo].[Vendor] ([No_])
GO
ALTER TABLE [dbo].[ObrasIncidenciasCantidadesPrevistas] CHECK CONSTRAINT [FK_ObrasIncidenciasCantidadesPrevistas_Vendor1]
GO
ALTER TABLE [dbo].[ObrasPartidasContrataVersion]  WITH CHECK ADD  CONSTRAINT [FK_ObrasPartidasContrataVersion_ObrasMethodsVersion] FOREIGN KEY([idObra], [version], [codNotaClave])
REFERENCES [dbo].[ObrasMethodsVersion] ([idObra], [version], [codNotaClave])
GO
ALTER TABLE [dbo].[ObrasPartidasContrataVersion] CHECK CONSTRAINT [FK_ObrasPartidasContrataVersion_ObrasMethodsVersion]
GO
ALTER TABLE [dbo].[ObrasPlanificacionBase]  WITH CHECK ADD FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
GO
ALTER TABLE [dbo].[ObrasPlanificacionBase]  WITH CHECK ADD FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
GO
ALTER TABLE [dbo].[ObrasPlanificacionBasePerfiles]  WITH CHECK ADD FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
GO
ALTER TABLE [dbo].[ObrasPlanificacionBasePerfiles]  WITH CHECK ADD FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
GO
ALTER TABLE [dbo].[ObrasPlanificacionDetalladaSemanal]  WITH CHECK ADD FOREIGN KEY([idPlanificacionDetallada])
REFERENCES [dbo].[ObrasPlanificacionDetallada] ([id])
GO
ALTER TABLE [dbo].[ObrasPlanificacionDetalladaSemanal]  WITH CHECK ADD FOREIGN KEY([idPlanificacionDetallada])
REFERENCES [dbo].[ObrasPlanificacionDetallada] ([id])
GO
ALTER TABLE [dbo].[ObrasPlanificacionDetalladaSemanalObjetos]  WITH CHECK ADD  CONSTRAINT [FK_ObrasPlanificacionDetalladaSemanalObjetos_ObrasPlanificacionDetallada] FOREIGN KEY([idPlanDetalladaSemanal])
REFERENCES [dbo].[ObrasPlanificacionDetalladaSemanal] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasPlanificacionDetalladaSemanalObjetos] CHECK CONSTRAINT [FK_ObrasPlanificacionDetalladaSemanalObjetos_ObrasPlanificacionDetallada]
GO
ALTER TABLE [dbo].[ObrasPlanificacionOrdenVagon]  WITH CHECK ADD FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
GO
ALTER TABLE [dbo].[ObrasPlanificacionOrdenVagon]  WITH CHECK ADD FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
GO
ALTER TABLE [dbo].[ObrasRelMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethods_ObrasRelMethodsResources_codNotaClaveIdObra] FOREIGN KEY([idObra], [codNotaClave])
REFERENCES [dbo].[ObrasMethods] ([idObra], [codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelMethodsResources] CHECK CONSTRAINT [FK_ObrasMethods_ObrasRelMethodsResources_codNotaClaveIdObra]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResources_ObrasRelMethodsResources_codRecursoIdObra] FOREIGN KEY([idObra], [codRecurso])
REFERENCES [dbo].[ObrasResources] ([idObra], [codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelMethodsResources] CHECK CONSTRAINT [FK_ObrasResources_ObrasRelMethodsResources_codRecursoIdObra]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethodsDinamica_ObrasRelMethodsResourcesDinamica_codNotaClaveIdObra] FOREIGN KEY([idObra], [codNotaClave])
REFERENCES [dbo].[ObrasMethodsDinamica] ([idObra], [codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesDinamica] CHECK CONSTRAINT [FK_ObrasMethodsDinamica_ObrasRelMethodsResourcesDinamica_codNotaClaveIdObra]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResourcesDinamica_ObrasRelMethodsResourcesDinamica_codRecursoIdObra] FOREIGN KEY([idObra], [codRecurso])
REFERENCES [dbo].[ObrasResourcesDinamica] ([idObra], [codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesDinamica] CHECK CONSTRAINT [FK_ObrasResourcesDinamica_ObrasRelMethodsResourcesDinamica_codRecursoIdObra]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethodsPromocion_ObrasRelMethodsResourcesPromocion_idObraCodNotaClave] FOREIGN KEY([idObra], [codNotaClave], [promType])
REFERENCES [dbo].[ObrasMethodsPromocion] ([idObra], [codNotaClave], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesPromocion] CHECK CONSTRAINT [FK_ObrasMethodsPromocion_ObrasRelMethodsResourcesPromocion_idObraCodNotaClave]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResourcesPromocion_ObrasRelMethodsResourcesPromocion_idObraCodRecurso] FOREIGN KEY([idObra], [codRecurso], [promType])
REFERENCES [dbo].[ObrasResourcesPromocion] ([idObra], [codRecurso], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesPromocion] CHECK CONSTRAINT [FK_ObrasResourcesPromocion_ObrasRelMethodsResourcesPromocion_idObraCodRecurso]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethodsVersion_ObrasRelMethodsResourcesVersion_idObraCodNotaClave] FOREIGN KEY([idObra], [version], [codNotaClave])
REFERENCES [dbo].[ObrasMethodsVersion] ([idObra], [version], [codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesVersion] CHECK CONSTRAINT [FK_ObrasMethodsVersion_ObrasRelMethodsResourcesVersion_idObraCodNotaClave]
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResourcesVersion_ObrasRelMethodsResourcesVersion_idObraCodRecurso] FOREIGN KEY([idObra], [version], [codRecurso])
REFERENCES [dbo].[ObrasResourcesVersion] ([idObra], [version], [codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelMethodsResourcesVersion] CHECK CONSTRAINT [FK_ObrasResourcesVersion_ObrasRelMethodsResourcesVersion_idObraCodRecurso]
GO
ALTER TABLE [dbo].[ObrasRelResources]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResources_ObrasRelResources_codSupIdObra] FOREIGN KEY([idObra], [codSup])
REFERENCES [dbo].[ObrasResources] ([idObra], [codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelResources] CHECK CONSTRAINT [FK_ObrasResources_ObrasRelResources_codSupIdObra]
GO
ALTER TABLE [dbo].[ObrasRelResourcesDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResourcesDinamica_ObrasRelResourcesDinamica_codSupIdObra] FOREIGN KEY([idObra], [codSup])
REFERENCES [dbo].[ObrasResourcesDinamica] ([idObra], [codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelResourcesDinamica] CHECK CONSTRAINT [FK_ObrasResourcesDinamica_ObrasRelResourcesDinamica_codSupIdObra]
GO
ALTER TABLE [dbo].[ObrasRelResourcesPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResourcesPromocion_codSupIdObra] FOREIGN KEY([idObra], [codSup], [promType])
REFERENCES [dbo].[ObrasResourcesPromocion] ([idObra], [codRecurso], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelResourcesPromocion] CHECK CONSTRAINT [FK_ObrasResourcesPromocion_codSupIdObra]
GO
ALTER TABLE [dbo].[ObrasRelResourcesVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResourcesVersion_codSupIdObra] FOREIGN KEY([idObra], [version], [codSup])
REFERENCES [dbo].[ObrasResourcesVersion] ([idObra], [version], [codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelResourcesVersion] CHECK CONSTRAINT [FK_ObrasResourcesVersion_codSupIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethods_ObrasRelSTMethodsResources_codNotaClaveIdObra] FOREIGN KEY([idObra], [codNotaClave])
REFERENCES [dbo].[ObrasMethods] ([idObra], [codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources] CHECK CONSTRAINT [FK_ObrasMethods_ObrasRelSTMethodsResources_codNotaClaveIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasRelMethodResources_ObrasRelSTMethodsResources_idObra_codRecurso_codNotaClave] FOREIGN KEY([idObra], [codNotaClave], [codRecurso])
REFERENCES [dbo].[ObrasRelMethodsResources] ([idObra], [codNotaClave], [codRecurso])
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources] CHECK CONSTRAINT [FK_ObrasRelMethodResources_ObrasRelSTMethodsResources_idObra_codRecurso_codNotaClave]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResources_ObrasRelSTMethodsResources_codRecursoIdObra] FOREIGN KEY([idObra], [codRecurso])
REFERENCES [dbo].[ObrasResources] ([idObra], [codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources] CHECK CONSTRAINT [FK_ObrasResources_ObrasRelSTMethodsResources_codRecursoIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasks_ObrasRelSTMethodsResources_codActividadIdObra] FOREIGN KEY([idObra], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasks] ([idObra], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources] CHECK CONSTRAINT [FK_ObrasScheduleTasks_ObrasRelSTMethodsResources_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasSTQuantities_ObrasRelSTMethodsResources_idObra_codActividad_codNotaClave] FOREIGN KEY([idObra], [codActividad], [codNotaClave])
REFERENCES [dbo].[ObrasSTQuantities] ([idObra], [codActividad], [codNotaClave])
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResources] CHECK CONSTRAINT [FK_ObrasSTQuantities_ObrasRelSTMethodsResources_idObra_codActividad_codNotaClave]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethodsDinamica_ObrasRelSTMethodsResourcesDinamica_codNotaClaveIdObra] FOREIGN KEY([idObra], [codNotaClave])
REFERENCES [dbo].[ObrasMethodsDinamica] ([idObra], [codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica] CHECK CONSTRAINT [FK_ObrasMethodsDinamica_ObrasRelSTMethodsResourcesDinamica_codNotaClaveIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasRelMethodResourcesDinamica_ObrasRelSTMethodsResourcesDinamica_idObra_codRecurso_codNotaClave] FOREIGN KEY([idObra], [codNotaClave], [codRecurso])
REFERENCES [dbo].[ObrasRelMethodsResourcesDinamica] ([idObra], [codNotaClave], [codRecurso])
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica] CHECK CONSTRAINT [FK_ObrasRelMethodResourcesDinamica_ObrasRelSTMethodsResourcesDinamica_idObra_codRecurso_codNotaClave]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResourcesDinamica_ObrasRelSTMethodsResourcesDinamica_codRecursoIdObra] FOREIGN KEY([idObra], [codRecurso])
REFERENCES [dbo].[ObrasResourcesDinamica] ([idObra], [codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica] CHECK CONSTRAINT [FK_ObrasResourcesDinamica_ObrasRelSTMethodsResourcesDinamica_codRecursoIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksDinamica_ObrasRelSTMethodsResourcesDinamica_codActividadIdObra] FOREIGN KEY([idObra], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasksDinamica] ([idObra], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica] CHECK CONSTRAINT [FK_ObrasScheduleTasksDinamica_ObrasRelSTMethodsResourcesDinamica_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasSTQuantitiesDinamica_ObrasRelSTMethodsResourcesDinamica_idObra_codActividad_codNotaClave] FOREIGN KEY([idObra], [codActividad], [codNotaClave])
REFERENCES [dbo].[ObrasSTQuantitiesDinamica] ([idObra], [codActividad], [codNotaClave])
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesDinamica] CHECK CONSTRAINT [FK_ObrasSTQuantitiesDinamica_ObrasRelSTMethodsResourcesDinamica_idObra_codActividad_codNotaClave]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethodsPromocion_ObrasRelSTMethodsResourcesPromocion_codNotaClaveIdObra] FOREIGN KEY([idObra], [codNotaClave], [promType])
REFERENCES [dbo].[ObrasMethodsPromocion] ([idObra], [codNotaClave], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion] CHECK CONSTRAINT [FK_ObrasMethodsPromocion_ObrasRelSTMethodsResourcesPromocion_codNotaClaveIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasRelMethodResourcesPromocion_ObrasRelSTMethodsResourcesPromocion_idObra_codRecurso_codNotaClave] FOREIGN KEY([idObra], [codNotaClave], [codRecurso], [promType])
REFERENCES [dbo].[ObrasRelMethodsResourcesPromocion] ([idObra], [codNotaClave], [codRecurso], [promType])
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion] CHECK CONSTRAINT [FK_ObrasRelMethodResourcesPromocion_ObrasRelSTMethodsResourcesPromocion_idObra_codRecurso_codNotaClave]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResourcesPromocion_ObrasRelSTMethodsResourcesPromocion_codRecursoIdObra] FOREIGN KEY([idObra], [codRecurso], [promType])
REFERENCES [dbo].[ObrasResourcesPromocion] ([idObra], [codRecurso], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion] CHECK CONSTRAINT [FK_ObrasResourcesPromocion_ObrasRelSTMethodsResourcesPromocion_codRecursoIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksPromocion_ObrasRelSTMethodsResourcesPromocion_codActividadIdObra] FOREIGN KEY([idObra], [codActividad], [promType])
REFERENCES [dbo].[ObrasScheduleTasksPromocion] ([idObra], [codActividad], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion] CHECK CONSTRAINT [FK_ObrasScheduleTasksPromocion_ObrasRelSTMethodsResourcesPromocion_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasSTQuantitiesPromocion_ObrasRelSTMethodsResourcesPromocion_idObra_codActividad_codNotaClave] FOREIGN KEY([idObra], [codActividad], [codNotaClave], [promType])
REFERENCES [dbo].[ObrasSTQuantitiesPromocion] ([idObra], [codActividad], [codNotaClave], [promType])
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesPromocion] CHECK CONSTRAINT [FK_ObrasSTQuantitiesPromocion_ObrasRelSTMethodsResourcesPromocion_idObra_codActividad_codNotaClave]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethodsVersion_ObrasRelSTMethodsResourcesVersion_codNotaClaveIdObra] FOREIGN KEY([idObra], [version], [codNotaClave])
REFERENCES [dbo].[ObrasMethodsVersion] ([idObra], [version], [codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesVersion] CHECK CONSTRAINT [FK_ObrasMethodsVersion_ObrasRelSTMethodsResourcesVersion_codNotaClaveIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasRelMethodResourcesVersion_ObrasRelSTMethodsResourcesVersion_idObra_codRecurso_codNotaClave] FOREIGN KEY([idObra], [version], [codNotaClave], [codRecurso])
REFERENCES [dbo].[ObrasRelMethodsResourcesVersion] ([idObra], [version], [codNotaClave], [codRecurso])
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesVersion] CHECK CONSTRAINT [FK_ObrasRelMethodResourcesVersion_ObrasRelSTMethodsResourcesVersion_idObra_codRecurso_codNotaClave]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasResourcesVersion_ObrasRelSTMethodsResourcesVersion_codRecursoIdObra] FOREIGN KEY([idObra], [version], [codRecurso])
REFERENCES [dbo].[ObrasResourcesVersion] ([idObra], [version], [codRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesVersion] CHECK CONSTRAINT [FK_ObrasResourcesVersion_ObrasRelSTMethodsResourcesVersion_codRecursoIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksVersion_ObrasRelSTMethodsResourcesVersion_codActividadIdObra] FOREIGN KEY([idObra], [version], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasksVersion] ([idObra], [version], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesVersion] CHECK CONSTRAINT [FK_ObrasScheduleTasksVersion_ObrasRelSTMethodsResourcesVersion_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasSTQuantitiesVersion_ObrasRelSTMethodsResourcesVersion_idObra_codActividad_codNotaClave] FOREIGN KEY([idObra], [version], [codActividad], [codNotaClave])
REFERENCES [dbo].[ObrasSTQuantitiesVersion] ([idObra], [version], [codActividad], [codNotaClave])
GO
ALTER TABLE [dbo].[ObrasRelSTMethodsResourcesVersion] CHECK CONSTRAINT [FK_ObrasSTQuantitiesVersion_ObrasRelSTMethodsResourcesVersion_idObra_codActividad_codNotaClave]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasks]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasks_idObra_codActividad] FOREIGN KEY([idObra], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasks] ([idObra], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasks] CHECK CONSTRAINT [FK_ObrasScheduleTasks_idObra_codActividad]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasks]  WITH NOCHECK ADD  CONSTRAINT [FK_ST_ObrasVagones_idObra_codVagon] FOREIGN KEY([idObra], [codVagon])
REFERENCES [dbo].[ObrasVagones] ([idObra], [codVagon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasks] CHECK CONSTRAINT [FK_ST_ObrasVagones_idObra_codVagon]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksDinamica_idObra_codActividad] FOREIGN KEY([idObra], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasksDinamica] ([idObra], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksDinamica] CHECK CONSTRAINT [FK_ObrasScheduleTasksDinamica_idObra_codActividad]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ST_ObrasVagonesDinamica_idObra_codVagon] FOREIGN KEY([idObra], [codVagon])
REFERENCES [dbo].[ObrasVagonesDinamica] ([idObra], [codVagon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksDinamica] CHECK CONSTRAINT [FK_ST_ObrasVagonesDinamica_idObra_codVagon]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksPromocion_idObra_codActividad] FOREIGN KEY([idObra], [codActividad], [promType])
REFERENCES [dbo].[ObrasScheduleTasksPromocion] ([idObra], [codActividad], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksPromocion] CHECK CONSTRAINT [FK_ObrasScheduleTasksPromocion_idObra_codActividad]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ST_ObrasVagonesPromocion_idObra_codVagon] FOREIGN KEY([idObra], [codVagon], [promType])
REFERENCES [dbo].[ObrasVagonesPromocion] ([idObra], [codVagon], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksPromocion] CHECK CONSTRAINT [FK_ST_ObrasVagonesPromocion_idObra_codVagon]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksVersion_idObra_codActividad] FOREIGN KEY([idObra], [version], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasksVersion] ([idObra], [version], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksVersion] CHECK CONSTRAINT [FK_ObrasScheduleTasksVersion_idObra_codActividad]
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ST_ObrasVagonesVersion_idObra_codVagon] FOREIGN KEY([idObra], [version], [codVagon])
REFERENCES [dbo].[ObrasVagonesVersion] ([idObra], [version], [codVagon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesScheduleTasksVersion] CHECK CONSTRAINT [FK_ST_ObrasVagonesVersion_idObra_codVagon]
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNs]  WITH NOCHECK ADD  CONSTRAINT [FK_Ns_ObrasVagones_idObra_codVagon] FOREIGN KEY([idObra], [codVagon])
REFERENCES [dbo].[ObrasVagones] ([idObra], [codVagon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNs] CHECK CONSTRAINT [FK_Ns_ObrasVagones_idObra_codVagon]
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNsDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_Ns_ObrasVagonesDinamica_idObra_codVagon] FOREIGN KEY([idObra], [codVagon])
REFERENCES [dbo].[ObrasVagonesDinamica] ([idObra], [codVagon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNsDinamica] CHECK CONSTRAINT [FK_Ns_ObrasVagonesDinamica_idObra_codVagon]
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNsPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_Ns_ObrasVagonesPromocion_idObra_codVagon] FOREIGN KEY([idObra], [codVagon], [promType])
REFERENCES [dbo].[ObrasVagonesPromocion] ([idObra], [codVagon], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNsPromocion] CHECK CONSTRAINT [FK_Ns_ObrasVagonesPromocion_idObra_codVagon]
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNsVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_Ns_ObrasVagonesVersion_idObra_codVagon] FOREIGN KEY([idObra], [version], [codVagon])
REFERENCES [dbo].[ObrasVagonesVersion] ([idObra], [version], [codVagon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasRelVagonesZonificacionNsVersion] CHECK CONSTRAINT [FK_Ns_ObrasVagonesVersion_idObra_codVagon]
GO
ALTER TABLE [dbo].[ObrasResources]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasPerfilEmpresas] FOREIGN KEY([idObra], [codPerfil])
REFERENCES [dbo].[ObrasPerfilEmpresas] ([idObra], [codPerfil])
GO
ALTER TABLE [dbo].[ObrasResources] CHECK CONSTRAINT [FK_ObrasPerfilEmpresas]
GO
ALTER TABLE [dbo].[ObrasResourcesEjecutados]  WITH CHECK ADD  CONSTRAINT [FK_ObrasResourcesEjecutados_ObrasResources] FOREIGN KEY([idObra], [codRecurso])
REFERENCES [dbo].[ObrasResources] ([idObra], [codRecurso])
GO
ALTER TABLE [dbo].[ObrasResourcesEjecutados] CHECK CONSTRAINT [FK_ObrasResourcesEjecutados_ObrasResources]
GO
ALTER TABLE [dbo].[ObrasSTQuantities]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethods_ObrasSTQuantities_codNotaClaveIdObra] FOREIGN KEY([idObra], [codNotaClave])
REFERENCES [dbo].[ObrasMethods] ([idObra], [codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTQuantities] CHECK CONSTRAINT [FK_ObrasMethods_ObrasSTQuantities_codNotaClaveIdObra]
GO
ALTER TABLE [dbo].[ObrasSTQuantities]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasks_ObrasSTQuantities_codActividadIdObra] FOREIGN KEY([idObra], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasks] ([idObra], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTQuantities] CHECK CONSTRAINT [FK_ObrasScheduleTasks_ObrasSTQuantities_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethodsDinamica_ObrasSTQuantitiesDinamica_codNotaClaveIdObra] FOREIGN KEY([idObra], [codNotaClave])
REFERENCES [dbo].[ObrasMethodsDinamica] ([idObra], [codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesDinamica] CHECK CONSTRAINT [FK_ObrasMethodsDinamica_ObrasSTQuantitiesDinamica_codNotaClaveIdObra]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksDinamica_ObrasSTQuantitiesDinamica_codActividadIdObra] FOREIGN KEY([idObra], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasksDinamica] ([idObra], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesDinamica] CHECK CONSTRAINT [FK_ObrasScheduleTasksDinamica_ObrasSTQuantitiesDinamica_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethodsPromocion_ObrasSTQuantitiesPromocion_codNotaClaveIdObra] FOREIGN KEY([idObra], [codNotaClave], [promType])
REFERENCES [dbo].[ObrasMethodsPromocion] ([idObra], [codNotaClave], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesPromocion] CHECK CONSTRAINT [FK_ObrasMethodsPromocion_ObrasSTQuantitiesPromocion_codNotaClaveIdObra]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksPromocion_ObrasSTQuantitiesPromocion_codActividadIdObra] FOREIGN KEY([idObra], [codActividad], [promType])
REFERENCES [dbo].[ObrasScheduleTasksPromocion] ([idObra], [codActividad], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesPromocion] CHECK CONSTRAINT [FK_ObrasScheduleTasksPromocion_ObrasSTQuantitiesPromocion_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasMethodsVersion_ObrasSTQuantitiesVersion_codNotaClaveIdObra] FOREIGN KEY([idObra], [version], [codNotaClave])
REFERENCES [dbo].[ObrasMethodsVersion] ([idObra], [version], [codNotaClave])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesVersion] CHECK CONSTRAINT [FK_ObrasMethodsVersion_ObrasSTQuantitiesVersion_codNotaClaveIdObra]
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksVersion_ObrasSTQuantitiesVersion_codActividadIdObra] FOREIGN KEY([idObra], [version], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasksVersion] ([idObra], [version], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTQuantitiesVersion] CHECK CONSTRAINT [FK_ObrasScheduleTasksVersion_ObrasSTQuantitiesVersion_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasSTZonasControl]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasks_ObrasSTZonasControl_codActividadIdObra] FOREIGN KEY([idObra], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasks] ([idObra], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTZonasControl] CHECK CONSTRAINT [FK_ObrasScheduleTasks_ObrasSTZonasControl_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasSTZonasControlDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksDinamica_ObrasSTZonasControlDinamica_codActividadIdObra] FOREIGN KEY([idObra], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasksDinamica] ([idObra], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTZonasControlDinamica] CHECK CONSTRAINT [FK_ObrasScheduleTasksDinamica_ObrasSTZonasControlDinamica_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasSTZonasControlPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksPromocion_ObrasSTZonasControlPromocion_codActividadIdObra] FOREIGN KEY([idObra], [codActividad], [promType])
REFERENCES [dbo].[ObrasScheduleTasksPromocion] ([idObra], [codActividad], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTZonasControlPromocion] CHECK CONSTRAINT [FK_ObrasScheduleTasksPromocion_ObrasSTZonasControlPromocion_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasSTZonasControlVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasScheduleTasksVersion_codActividadIdObra] FOREIGN KEY([idObra], [version], [codActividad])
REFERENCES [dbo].[ObrasScheduleTasksVersion] ([idObra], [version], [codActividad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasSTZonasControlVersion] CHECK CONSTRAINT [FK_ObrasScheduleTasksVersion_codActividadIdObra]
GO
ALTER TABLE [dbo].[ObrasSTZonasEjecutados]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasSTZonasEjecutados_Obras] FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
GO
ALTER TABLE [dbo].[ObrasSTZonasEjecutados] CHECK CONSTRAINT [FK_ObrasSTZonasEjecutados_Obras]
GO
ALTER TABLE [dbo].[ObrasVagones]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasTrenes_idObra_codTren] FOREIGN KEY([idObra], [codTren])
REFERENCES [dbo].[ObrasTrenes] ([idObra], [codTren])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasVagones] CHECK CONSTRAINT [FK_ObrasTrenes_idObra_codTren]
GO
ALTER TABLE [dbo].[ObrasVagonesDinamica]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasTrenesDinamica_idObra_codTren] FOREIGN KEY([idObra], [codTren])
REFERENCES [dbo].[ObrasTrenesDinamica] ([idObra], [codTren])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasVagonesDinamica] CHECK CONSTRAINT [FK_ObrasTrenesDinamica_idObra_codTren]
GO
ALTER TABLE [dbo].[ObrasVagonesPromocion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasTrenesPromocion_idObra_codTren] FOREIGN KEY([idObra], [codTren], [promType])
REFERENCES [dbo].[ObrasTrenesPromocion] ([idObra], [codTren], [promType])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasVagonesPromocion] CHECK CONSTRAINT [FK_ObrasTrenesPromocion_idObra_codTren]
GO
ALTER TABLE [dbo].[ObrasVagonesVersion]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasTrenesVersion_idObra_codTren] FOREIGN KEY([idObra], [version], [codTren])
REFERENCES [dbo].[ObrasTrenesVersion] ([idObra], [version], [codTren])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObrasVagonesVersion] CHECK CONSTRAINT [FK_ObrasTrenesVersion_idObra_codTren]
GO
ALTER TABLE [dbo].[ObrasVentasExcepcionesNotasClaveVersiones]  WITH CHECK ADD FOREIGN KEY([idAgrupacion])
REFERENCES [dbo].[GlobalVentasExcepciones] ([id])
GO
ALTER TABLE [dbo].[ObrasVentasExcepcionesNotasClaveVersiones]  WITH CHECK ADD FOREIGN KEY([idAgrupacion])
REFERENCES [dbo].[GlobalVentasExcepciones] ([id])
GO
ALTER TABLE [dbo].[ObrasVentasExcepcionesNotasClaveVersiones]  WITH CHECK ADD FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
GO
ALTER TABLE [dbo].[ObrasVentasExcepcionesNotasClaveVersiones]  WITH CHECK ADD FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
GO
ALTER TABLE [dbo].[ObrasVentasExcepcionesNotasClaveVersiones]  WITH CHECK ADD FOREIGN KEY([idObra], [version])
REFERENCES [dbo].[ObrasVentasVersiones] ([idObra], [version])
GO
ALTER TABLE [dbo].[ObrasVentasExcepcionesNotasClaveVersiones]  WITH CHECK ADD FOREIGN KEY([idObra], [version], [codNotaClave])
REFERENCES [dbo].[ObrasMethodsVersion] ([idObra], [version], [codNotaClave])
GO
ALTER TABLE [dbo].[ObrasVentasExcepcionesNotasClaveVersiones]  WITH CHECK ADD FOREIGN KEY([idObra], [version])
REFERENCES [dbo].[ObrasVentasVersiones] ([idObra], [version])
GO
ALTER TABLE [dbo].[ObrasVentasExcepcionesNotasClaveVersiones]  WITH CHECK ADD FOREIGN KEY([idObra], [version], [codNotaClave])
REFERENCES [dbo].[ObrasMethodsVersion] ([idObra], [version], [codNotaClave])
GO
ALTER TABLE [dbo].[ObrasVentasSeccionesVersiones]  WITH CHECK ADD FOREIGN KEY([idObra], [version])
REFERENCES [dbo].[ObrasVentasVersiones] ([idObra], [version])
GO
ALTER TABLE [dbo].[ObrasVentasSeccionesVersiones]  WITH CHECK ADD FOREIGN KEY([idObra], [version])
REFERENCES [dbo].[ObrasVentasVersiones] ([idObra], [version])
GO
ALTER TABLE [dbo].[ObrasVentasSuperficiesVersiones]  WITH NOCHECK ADD FOREIGN KEY([idSeccion])
REFERENCES [dbo].[ObrasVentasSeccionesVersiones] ([idSeccion])
GO
ALTER TABLE [dbo].[ObrasVentasSuperficiesVersiones]  WITH NOCHECK ADD FOREIGN KEY([idSeccion])
REFERENCES [dbo].[ObrasVentasSeccionesVersiones] ([idSeccion])
GO
ALTER TABLE [dbo].[ObrasVentasSuperficiesVersiones]  WITH NOCHECK ADD  CONSTRAINT [FK_ObrasVentasSuperficiesVersiones_Version] FOREIGN KEY([idObra], [version])
REFERENCES [dbo].[ObrasVentasTecnicasVersiones] ([idObra], [version])
GO
ALTER TABLE [dbo].[ObrasVentasSuperficiesVersiones] CHECK CONSTRAINT [FK_ObrasVentasSuperficiesVersiones_Version]
GO
ALTER TABLE [dbo].[ObrasVentasTecnicasVersiones]  WITH CHECK ADD  CONSTRAINT [FK_ObrasVentasVersionesTecnicas_Obras] FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
GO
ALTER TABLE [dbo].[ObrasVentasTecnicasVersiones] CHECK CONSTRAINT [FK_ObrasVentasVersionesTecnicas_Obras]
GO
ALTER TABLE [dbo].[ObrasVentasTecnicasVersiones]  WITH CHECK ADD  CONSTRAINT [FK_ObrasVentasVersionesTecnicas_Tipologias] FOREIGN KEY([idTipologiaVenta])
REFERENCES [dbo].[GlobalTipologiasVentasObra] ([ID])
GO
ALTER TABLE [dbo].[ObrasVentasTecnicasVersiones] CHECK CONSTRAINT [FK_ObrasVentasVersionesTecnicas_Tipologias]
GO
ALTER TABLE [dbo].[ObrasVentasVersiones]  WITH CHECK ADD  CONSTRAINT [FK_ObrasVentasVersiones_Obras] FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
GO
ALTER TABLE [dbo].[ObrasVentasVersiones] CHECK CONSTRAINT [FK_ObrasVentasVersiones_Obras]
GO
ALTER TABLE [dbo].[ObrasVentasViviendasHabitacionesVersiones]  WITH CHECK ADD  CONSTRAINT [FK_ObrasVentasVersionesTecnicas_Version] FOREIGN KEY([idObra], [version])
REFERENCES [dbo].[ObrasVentasTecnicasVersiones] ([idObra], [version])
GO
ALTER TABLE [dbo].[ObrasVentasViviendasHabitacionesVersiones] CHECK CONSTRAINT [FK_ObrasVentasVersionesTecnicas_Version]
GO
ALTER TABLE [dbo].[ObrasVentasViviendasTipologiaVersiones]  WITH CHECK ADD  CONSTRAINT [FK_ObrasVentasViviendasTipologiaVersiones_Version] FOREIGN KEY([idObra], [version])
REFERENCES [dbo].[ObrasVentasTecnicasVersiones] ([idObra], [version])
GO
ALTER TABLE [dbo].[ObrasVentasViviendasTipologiaVersiones] CHECK CONSTRAINT [FK_ObrasVentasViviendasTipologiaVersiones_Version]
GO
ALTER TABLE [dbo].[OfertasProveedores]  WITH CHECK ADD  CONSTRAINT [FK_Ofertas_Proveedores] FOREIGN KEY([idOferta])
REFERENCES [dbo].[Ofertas] ([idOferta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OfertasProveedores] CHECK CONSTRAINT [FK_Ofertas_Proveedores]
GO
ALTER TABLE [dbo].[OfertasProveedoresRecursosPrecio]  WITH NOCHECK ADD  CONSTRAINT [FK_OfertasProveedores] FOREIGN KEY([idOfertaProveedor])
REFERENCES [dbo].[OfertasProveedores] ([idOfertaProveedor])
GO
ALTER TABLE [dbo].[OfertasProveedoresRecursosPrecio] CHECK CONSTRAINT [FK_OfertasProveedores]
GO
ALTER TABLE [dbo].[OfertasProveedoresRecursosPrecio]  WITH NOCHECK ADD  CONSTRAINT [FK_OfertasRecursos_OfertasProveedores] FOREIGN KEY([idOfertaRecurso])
REFERENCES [dbo].[OfertasRecursos] ([idOfertaRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OfertasProveedoresRecursosPrecio] CHECK CONSTRAINT [FK_OfertasRecursos_OfertasProveedores]
GO
ALTER TABLE [dbo].[OfertasRecursos]  WITH CHECK ADD  CONSTRAINT [FK_Ofertas_Recursos] FOREIGN KEY([idOferta])
REFERENCES [dbo].[Ofertas] ([idOferta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OfertasRecursos] CHECK CONSTRAINT [FK_Ofertas_Recursos]
GO
ALTER TABLE [dbo].[OfertasRecursosMC]  WITH NOCHECK ADD  CONSTRAINT [FK_OfertasRecursos] FOREIGN KEY([idOfertaRecurso])
REFERENCES [dbo].[OfertasRecursos] ([idOfertaRecurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OfertasRecursosMC] CHECK CONSTRAINT [FK_OfertasRecursos]
GO
ALTER TABLE [dbo].[OfertasRecursosMCObjetos]  WITH NOCHECK ADD  CONSTRAINT [FK_OfertasRecursosMC] FOREIGN KEY([idOfertaRecursoMC])
REFERENCES [dbo].[OfertasRecursosMC] ([idOfertaRecursoMC])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OfertasRecursosMCObjetos] CHECK CONSTRAINT [FK_OfertasRecursosMC]
GO
ALTER TABLE [dbo].[RevitGruposNC]  WITH CHECK ADD  CONSTRAINT [FK_GlobalMethods_RevitGruposNC] FOREIGN KEY([CodNotaClaveCambios])
REFERENCES [dbo].[GlobalMethods] ([codNotaClave])
GO
ALTER TABLE [dbo].[RevitGruposNC] CHECK CONSTRAINT [FK_GlobalMethods_RevitGruposNC]
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorMesCab]  WITH CHECK ADD  CONSTRAINT [FK_Obras_TotalesProduccionProveedorMesCab] FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorMesCab] CHECK CONSTRAINT [FK_Obras_TotalesProduccionProveedorMesCab]
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorMesLin]  WITH NOCHECK ADD  CONSTRAINT [FK_TotalesProduccionProveedorMesLin_TotalesProduccionProveedorMesCab] FOREIGN KEY([idCaptura])
REFERENCES [dbo].[TotalesProduccionProveedorMesCab] ([idCaptura])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorMesLin] CHECK CONSTRAINT [FK_TotalesProduccionProveedorMesLin_TotalesProduccionProveedorMesCab]
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorMesLin]  WITH NOCHECK ADD  CONSTRAINT [FK_Vendor_TotalesProduccionProveedorMesLin] FOREIGN KEY([codProveedor])
REFERENCES [dbo].[Vendor] ([No_])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorMesLin] CHECK CONSTRAINT [FK_Vendor_TotalesProduccionProveedorMesLin]
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorSemanaCab]  WITH CHECK ADD  CONSTRAINT [FK_Obras_TotalesProduccionProveedorSemanaCab] FOREIGN KEY([idObra])
REFERENCES [dbo].[Obras] ([idObra])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorSemanaCab] CHECK CONSTRAINT [FK_Obras_TotalesProduccionProveedorSemanaCab]
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorSemanaLin]  WITH NOCHECK ADD  CONSTRAINT [FK_TotalesProduccionProveedorSemanaLin_TotalesProduccionProveedorSemanaCab] FOREIGN KEY([idCaptura])
REFERENCES [dbo].[TotalesProduccionProveedorSemanaCab] ([idCaptura])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorSemanaLin] CHECK CONSTRAINT [FK_TotalesProduccionProveedorSemanaLin_TotalesProduccionProveedorSemanaCab]
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorSemanaLin]  WITH NOCHECK ADD  CONSTRAINT [FK_Vendor_TotalesProduccionProveedorSemanaLin] FOREIGN KEY([codProveedor])
REFERENCES [dbo].[Vendor] ([No_])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TotalesProduccionProveedorSemanaLin] CHECK CONSTRAINT [FK_Vendor_TotalesProduccionProveedorSemanaLin]
GO
ALTER TABLE [dbo].[GlobalRelGruposSTMethods]  WITH CHECK ADD  CONSTRAINT [CK_GlobalRelGruposSTMethods] CHECK  ((len([codSup])>(0) AND len([codInf])>(0) AND [idTipoGrupo]<>(0)))
GO
ALTER TABLE [dbo].[GlobalRelGruposSTMethods] CHECK CONSTRAINT [CK_GlobalRelGruposSTMethods]
GO
EXEC sys.sp_addextendedproperty @name=N'Pedro', @value=N'Almacena las fechas que se consideran festivo, por obra.  Se usa en la función dbo.DiasHabiles' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Festivos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2020025_Test' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MiniProfilers', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MTObjeto', @value=N'Usada en una MT de compras.
Almacena comentarios adicionales a la ofertas para que aparezcan en el informe que se envía al proveedor.
Se hizo a demanda de francisco.aliana mientras se desarrollaba algo en Hube.
Todavía está en uso 11/05/2022' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OfertasComentariosUsuario'
GO
