USE [master]
GO
/****** Object:  Database [PRUEBACSTI]    Script Date: 21/04/2021 19:40:31 ******/
CREATE DATABASE [PRUEBACSTI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRUEBACSTI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PRUEBACSTI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRUEBACSTI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PRUEBACSTI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PRUEBACSTI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRUEBACSTI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRUEBACSTI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRUEBACSTI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRUEBACSTI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRUEBACSTI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRUEBACSTI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRUEBACSTI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRUEBACSTI] SET  MULTI_USER 
GO
ALTER DATABASE [PRUEBACSTI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRUEBACSTI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRUEBACSTI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRUEBACSTI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRUEBACSTI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRUEBACSTI] SET QUERY_STORE = OFF
GO
USE [PRUEBACSTI]
GO
/****** Object:  UserDefinedTableType [dbo].[DetalleFacturaTableType]    Script Date: 21/04/2021 19:40:31 ******/
CREATE TYPE [dbo].[DetalleFacturaTableType] AS TABLE(
	[DetalleFacturaId] [int] NOT NULL,
	[FacturaId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 5) NULL,
	PRIMARY KEY CLUSTERED 
(
	[DetalleFacturaId] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[DetalleFacturaTableTypeA]    Script Date: 21/04/2021 19:40:31 ******/
CREATE TYPE [dbo].[DetalleFacturaTableTypeA] AS TABLE(
	[FacturaId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 5) NULL
)
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 21/04/2021 19:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Nic] [varchar](12) NOT NULL,
	[Categoria] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 21/04/2021 19:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[DetalleFacturaId] [int] IDENTITY(1,1) NOT NULL,
	[FacturaId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 5) NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleFacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 21/04/2021 19:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[FacturaId] [int] IDENTITY(1,1) NOT NULL,
	[Serie] [varchar](3) NOT NULL,
	[Codigo] [varchar](5) NOT NULL,
	[VendedorId] [int] NOT NULL,
	[ClienteId] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Moneda] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[FacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 21/04/2021 19:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ProductoId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[PrecioUnitario] [decimal](18, 5) NULL,
	[Categoria] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 21/04/2021 19:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[VendedorId] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Dni] [char](8) NOT NULL,
	[FechaIngreso] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VendedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([ClienteId], [Nombres], [Apellidos], [Nic], [Categoria]) VALUES (1, N'Alex', N'Cercado', N'acercado', N'A')
INSERT [dbo].[Cliente] ([ClienteId], [Nombres], [Apellidos], [Nic], [Categoria]) VALUES (2, N'Jose', N'Moreno', N'morejose', N'A')
INSERT [dbo].[Cliente] ([ClienteId], [Nombres], [Apellidos], [Nic], [Categoria]) VALUES (3, N'Alejandra', N'Fernandez', N'alefer', N'B')
INSERT [dbo].[Cliente] ([ClienteId], [Nombres], [Apellidos], [Nic], [Categoria]) VALUES (5, N'Karla', N'Diaz', N'diazkar', N'B')
INSERT [dbo].[Cliente] ([ClienteId], [Nombres], [Apellidos], [Nic], [Categoria]) VALUES (6, N'Oscar', N'Miller', N'millerid', N'A')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[DetalleFactura] ON 

INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (1, 1, 1, 10, CAST(35.00000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (2, 1, 2, 10, CAST(50.00000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (3, 1, 3, 2, CAST(14.40000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (4, 2, 2, 10, CAST(74.00000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (6, 2, 4, 3, CAST(9.00000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (7, 3, 5, 5, CAST(19.50000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (8, 3, 6, 1, CAST(15.50000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (9, 4, 1, 88, CAST(120.00000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (10, 4, 2, 100, CAST(200.00000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (11, 5, 1, 2, CAST(50.00000 AS Decimal(18, 5)))
INSERT [dbo].[DetalleFactura] ([DetalleFacturaId], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (12, 5, 2, 2, CAST(50.00000 AS Decimal(18, 5)))
SET IDENTITY_INSERT [dbo].[DetalleFactura] OFF
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([FacturaId], [Serie], [Codigo], [VendedorId], [ClienteId], [Fecha], [Moneda]) VALUES (1, N'A01', N'00001', 2, 1, CAST(N'2021-04-21' AS Date), N'PEN')
INSERT [dbo].[Factura] ([FacturaId], [Serie], [Codigo], [VendedorId], [ClienteId], [Fecha], [Moneda]) VALUES (2, N'A02', N'00002', 2, 2, CAST(N'2021-04-25' AS Date), N'USD')
INSERT [dbo].[Factura] ([FacturaId], [Serie], [Codigo], [VendedorId], [ClienteId], [Fecha], [Moneda]) VALUES (3, N'A03', N'00003', 3, 3, CAST(N'2021-04-27' AS Date), N'PEN')
INSERT [dbo].[Factura] ([FacturaId], [Serie], [Codigo], [VendedorId], [ClienteId], [Fecha], [Moneda]) VALUES (4, N'B00', N'0001', 2, 2, CAST(N'2021-04-21' AS Date), N'USD')
INSERT [dbo].[Factura] ([FacturaId], [Serie], [Codigo], [VendedorId], [ClienteId], [Fecha], [Moneda]) VALUES (5, N'B01', N'00002', 2, 1, CAST(N'2021-04-21' AS Date), N'PEN')
SET IDENTITY_INSERT [dbo].[Factura] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([ProductoId], [Descripcion], [PrecioUnitario], [Categoria]) VALUES (1, N'Leche Evaporada', CAST(3.50000 AS Decimal(18, 5)), N'L ')
INSERT [dbo].[Producto] ([ProductoId], [Descripcion], [PrecioUnitario], [Categoria]) VALUES (2, N'Yogurt', CAST(5.00000 AS Decimal(18, 5)), N'L ')
INSERT [dbo].[Producto] ([ProductoId], [Descripcion], [PrecioUnitario], [Categoria]) VALUES (3, N'Mantequilla', CAST(7.20000 AS Decimal(18, 5)), N'L ')
INSERT [dbo].[Producto] ([ProductoId], [Descripcion], [PrecioUnitario], [Categoria]) VALUES (4, N'Atun Gratted', CAST(3.00000 AS Decimal(18, 5)), N'P ')
INSERT [dbo].[Producto] ([ProductoId], [Descripcion], [PrecioUnitario], [Categoria]) VALUES (5, N'Atun Filete', CAST(3.90000 AS Decimal(18, 5)), N'P ')
INSERT [dbo].[Producto] ([ProductoId], [Descripcion], [PrecioUnitario], [Categoria]) VALUES (6, N'Aceite Oliva', CAST(15.50000 AS Decimal(18, 5)), N'A ')
INSERT [dbo].[Producto] ([ProductoId], [Descripcion], [PrecioUnitario], [Categoria]) VALUES (7, N'Aceite Vegetal', CAST(5.60000 AS Decimal(18, 5)), N'A ')
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Vendedor] ON 

INSERT [dbo].[Vendedor] ([VendedorId], [Nombres], [Apellidos], [Dni], [FechaIngreso]) VALUES (2, N'Luis', N'Renjifo', N'76773371', CAST(N'2019-04-21' AS Date))
INSERT [dbo].[Vendedor] ([VendedorId], [Nombres], [Apellidos], [Dni], [FechaIngreso]) VALUES (3, N'Federico', N'Villa', N'76773372', CAST(N'2019-04-21' AS Date))
INSERT [dbo].[Vendedor] ([VendedorId], [Nombres], [Apellidos], [Dni], [FechaIngreso]) VALUES (4, N'Carlos', N'Salazar', N'76773373', CAST(N'2021-04-20' AS Date))
INSERT [dbo].[Vendedor] ([VendedorId], [Nombres], [Apellidos], [Dni], [FechaIngreso]) VALUES (5, N'Carlos', N'Melendez', N'76773355', CAST(N'2020-01-21' AS Date))
SET IDENTITY_INSERT [dbo].[Vendedor] OFF
/****** Object:  StoredProcedure [dbo].[proc_insertar_factura]    Script Date: 21/04/2021 19:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_insertar_factura]
@Serie  varchar(3)
           ,@Codigo  varchar(5)
           ,@VendedorId int
           ,@ClienteId int
           ,@Fecha date
           ,@Moneda char(3)
,@detalle DetalleFacturaTableTypeA READONLY
AS
BEGIN
    declare @id int
	declare @cantidad int
	select @cantidad = count(ProductoId)
	from @detalle

	if @cantidad <= 0
	begin
	     PRINT N'ERROR: Ingrese Productos.';  
                 RETURN 1;  
	end

	set @cantidad = 0

	select  @cantidad = count(ProductoId)
	from @detalle
	where Cantidad <= 0

	if @cantidad >= 1
	begin
	     PRINT N'ERROR: no puede tener cantidad en cero.';  
                 RETURN 1;  
	end

	INSERT INTO [dbo].[Factura]
           ([Serie]
           ,[Codigo]
           ,[VendedorId]
           ,[ClienteId]
           ,[Fecha]
           ,[Moneda])
     VALUES
           (@Serie  
           ,@Codigo 
           ,@VendedorId 
           ,@ClienteId 
           ,@Fecha 
           ,@Moneda)

		   set @id = scope_identity()

		   INSERT INTO [dbo].[DetalleFactura]
           select 
           @id
           ,ProductoId
           ,Cantidad 
           ,PrecioUnitario 
		   from @detalle
END
GO
/****** Object:  StoredProcedure [dbo].[sp_lista_cliente_factura_sin_emitir]    Script Date: 21/04/2021 19:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_lista_cliente_factura_sin_emitir]
as 
 SELECT s.*
  FROM Cliente s
  WHERE s.Categoria='A' and  NOT EXISTS (
  SELECT * FROM Factura a 
	WHERE s.ClienteId = a.ClienteId )
GO
/****** Object:  StoredProcedure [dbo].[sp_lista_facturas_emitidas]    Script Date: 21/04/2021 19:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_lista_facturas_emitidas]

as
SELECT fc.Fecha,SUM(df.PrecioUnitario) as Importe,
CONCAT(cl.Nombres,' ',cl.Apellidos) as Cliente,
CONCAT(vd.Nombres,' ', vd.Apellidos) as Vendedor,
fc.FacturaId
FROM DetalleFactura df
INNER JOIN Factura fc ON fc.FacturaId=df.FacturaId
INNER JOIN Cliente cl ON cl.ClienteId=fc.ClienteId
INNER JOIN Vendedor vd ON vd.VendedorId =fc.VendedorId
GROUP BY fc.Fecha , CONCAT(cl.Nombres,' ',cl.Apellidos),
CONCAT(vd.Nombres,' ', vd.Apellidos), fc.FacturaId
ORDER BY Importe desc
GO
/****** Object:  StoredProcedure [dbo].[sp_lista_productos]    Script Date: 21/04/2021 19:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_lista_productos]
as
select * from  Producto (NOLOCK)
GO
/****** Object:  StoredProcedure [dbo].[sp_vendedor_por_anio]    Script Date: 21/04/2021 19:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_vendedor_por_anio]
as 
select * from  Vendedor where YEAR(FechaIngreso)='2019'
GO
USE [master]
GO
ALTER DATABASE [PRUEBACSTI] SET  READ_WRITE 
GO
