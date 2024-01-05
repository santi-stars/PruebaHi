USE [Hube_PRE]
GO
/****** Object:  Table [dbo].[FacturasProformaLIN]    Script Date: 02/01/2024 16:01:08 ******/
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
	[idFacturaProformaLin] ASC,
	[Concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FacturasProformaLIN] ADD  CONSTRAINT [DF_FacturasProformaLIN_Concepto]  DEFAULT ('N') FOR [Concepto]
GO
ALTER TABLE [dbo].[FacturasProformaLIN] ADD  CONSTRAINT [DF_FacturasProformaLIN_Unidades]  DEFAULT ((0)) FOR [Unidades]
GO
ALTER TABLE [dbo].[FacturasProformaLIN] ADD  DEFAULT ((0)) FOR [activo]
GO
ALTER TABLE [dbo].[FacturasProformaLIN] ADD  DEFAULT (getdate()) FOR [fechaGen]
GO
ALTER TABLE [dbo].[FacturasProformaLIN]  WITH NOCHECK ADD  CONSTRAINT [FK_FacturasProformaCAB_idFacturaProforma] FOREIGN KEY([idFacturaProforma])
REFERENCES [dbo].[FacturasProformaCAB] ([idFacturaProforma])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacturasProformaLIN] CHECK CONSTRAINT [FK_FacturasProformaCAB_idFacturaProforma]
GO
/*
el archivo adjunto es un script de creacion de una tabla de bbdd en SQL server con sus campos, tipos de dato con o sin tamaño, restricciones, tipo 'NULL' o 'NOT NULL', valores por defecto, claves primarias simple o compuestas (PK) claves foraneas simple o compuestas (FK).
Escríbeme por favor un código en c# que abra el archivo .sql adjunto, busque los siguientes datos:
- el nombre de la tabla
- el nombre de todos sus respectivos campos
- el tipo de dato de cada campo con su tamaño si lo tiene
- si cada campo es 'NULL' o 'NOT NULL' 
- valores por defecto de cada campo si los tiene
- la clave primaria simple o compuestas (PK) 
- la clave foranea simple o compuestas (FK)
Después que escriba los resultado en un archivo .txt:
-en la primera linea el nombre de la tabla
-en las siguientes lineas, una linea para cada campo con el siguiente formato:
 [nombre de campo] [tipo de dato](tamaño si lo tiene) [valor por defecto] 'si es NULL o NOT NULL' [si es o PRIMARY KEY o FOREIGN KEY]
 */