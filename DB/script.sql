USE [master]
GO
/****** Object:  Database [Inspired]    Script Date: 20/4/2015 10:40:29 AM ******/
CREATE DATABASE [Inspired]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inspired', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Inspired.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Inspired_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Inspired_log.ldf' , SIZE = 6912KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Inspired] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inspired].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inspired] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inspired] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inspired] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inspired] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inspired] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inspired] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inspired] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Inspired] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inspired] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inspired] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inspired] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inspired] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inspired] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inspired] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inspired] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inspired] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Inspired] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inspired] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inspired] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inspired] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inspired] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inspired] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inspired] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inspired] SET RECOVERY FULL 
GO
ALTER DATABASE [Inspired] SET  MULTI_USER 
GO
ALTER DATABASE [Inspired] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inspired] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inspired] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inspired] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Inspired]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 20/4/2015 10:40:29 AM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FAS_AccountMaster]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FAS_AccountMaster](
	[Accd_Key] [int] IDENTITY(1,1) NOT NULL,
	[Acc_Code] [varchar](50) NOT NULL,
	[Acc_Description] [varchar](500) NOT NULL,
	[Acc_Type] [varchar](50) NOT NULL,
	[Price_Type] [int] NULL,
	[Company_Id] [int] NOT NULL,
	[Branch_Id] [int] NOT NULL,
 CONSTRAINT [PK_FAS_AccountMaster] PRIMARY KEY CLUSTERED 
(
	[Accd_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gen_BranchMaster]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gen_BranchMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[Description] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Gen_BranchMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gen_CompanyMaster]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gen_CompanyMaster](
	[Id] [int] NOT NULL,
	[Company_Code] [nvarchar](10) NOT NULL,
	[Company_Description] [varchar](500) NOT NULL,
	[Status] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Gen_CompanyMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gen_LookupGroup]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gen_LookupGroup](
	[Id] [int] NOT NULL,
	[LookupType_Id] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[IsHidden] [bit] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Gen_LookupGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gen_LookupItem]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gen_LookupItem](
	[Id] [int] NOT NULL,
	[LookupType_Id] [int] NOT NULL,
	[LookupGroup_Id] [int] NULL,
	[Description] [varchar](500) NOT NULL,
	[Ordinal] [int] NOT NULL,
	[IsOther] [bit] NOT NULL,
	[IsHidden] [bit] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_update] [date] NOT NULL,
 CONSTRAINT [PK_Gen_LookupItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gen_LookupType]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gen_LookupType](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Gen_LookupType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gen_UserMaster]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gen_UserMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[Branch_Id] [int] NULL,
	[Status] [varchar](1) NULL,
 CONSTRAINT [PK_Gen_UserMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_CategoryMaster]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_CategoryMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Description] [varchar](500) NULL,
	[Status] [varchar](1) NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_CategoryMaster_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_DocumentMaster]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_DocumentMaster](
	[TRANS_TYPE] [varchar](50) NOT NULL,
	[DOC_CODE] [varchar](20) NOT NULL,
	[DOC_DESC] [varchar](250) NOT NULL,
	[START_NO] [numeric](18, 0) NOT NULL,
	[LAST_NO] [numeric](18, 0) NOT NULL,
	[STATUS] [bit] NOT NULL,
	[COMPANY_ID] [int] NOT NULL,
	[USER_ID] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
 CONSTRAINT [PK_Inv_DocumentMaster] PRIMARY KEY CLUSTERED 
(
	[TRANS_TYPE] ASC,
	[DOC_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_MaterialAlternateRelative]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialAlternateRelative](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[AR_Item_Id] [int] NOT NULL,
	[AR_Flag] [int] NOT NULL,
	[Notes] [text] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NULL,
 CONSTRAINT [PK_Inv_MaterialAlternateRelative] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inv_MaterialBOM]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialBOM](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Parent_Id] [int] NOT NULL,
	[Child_Id] [int] NOT NULL,
	[Notes] [text] NULL,
	[Quantity] [int] NOT NULL,
	[In_Out_Flag] [bit] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialBOM] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inv_MaterialBranch]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_MaterialBranch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Branch_Id] [int] NOT NULL,
	[Description] [varchar](500) NULL,
	[Long_Description] [varchar](2000) NULL,
	[Overview] [text] NULL,
	[SKU_Number] [varchar](150) NULL,
	[NETT_Price] [decimal](18, 2) NULL,
	[Sale_Price] [decimal](18, 2) NULL,
	[Batch_YN] [bit] NULL,
	[Serial_YN] [bit] NULL,
	[Location_YN] [bit] NULL,
	[Status] [varchar](10) NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NULL,
	[Last_Updated] [date] NULL,
 CONSTRAINT [PK_Inv_MaterialBranch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_MaterialBranchSpec]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialBranchSpec](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Branch_Id] [int] NOT NULL,
	[Spec_Id] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialBranchSpec] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inv_MaterialCategory]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Category_Type] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inv_MaterialDiscount]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_MaterialDiscount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Type] [int] NULL,
	[Customer_Id] [int] NULL,
	[Branch_Id] [int] NULL,
	[Group_Id] [int] NULL,
	[Type_Id] [int] NULL,
	[Category_Id] [int] NULL,
	[SubCategory_Id] [int] NULL,
	[Make_Id] [int] NULL,
	[Model_Number_Id] [int] NULL,
	[Item_Id] [int] NULL,
	[Discount] [numeric](18, 2) NOT NULL,
	[Based_On] [varchar](1) NULL,
	[From_Qty] [int] NOT NULL,
	[To_Qty] [int] NOT NULL,
	[Price_Type] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialDiscount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_MaterialDocument]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_MaterialDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Document_Path] [varchar](500) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[version] [int] NOT NULL,
	[FromDT] [datetime] NULL,
	[EndDT] [datetime] NULL,
 CONSTRAINT [PK_Inv_MaterialDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_MaterialMaster]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_MaterialMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[SKU_Number] [varchar](150) NULL,
	[Long_Description] [varchar](2000) NULL,
	[Overview] [text] NULL,
	[UOM] [int] NULL,
	[Margin_Percent] [decimal](18, 2) NULL,
	[Batch_YN] [bit] NULL,
	[Serial_YN] [bit] NULL,
	[Location_YN] [bit] NULL,
	[Shelf_Life] [int] NULL,
	[Barcode] [varchar](250) NULL,
	[Max_Level] [int] NULL,
	[Min_Level] [int] NULL,
	[Re_order_Level] [int] NULL,
	[Lead_Time] [int] NULL,
	[NETT_Price] [decimal](18, 2) NULL,
	[Sale_Price] [decimal](18, 2) NULL,
	[Cost_Price] [decimal](18, 2) NULL,
	[LIFO_Price] [decimal](18, 2) NULL,
	[FIFO_Price] [decimal](18, 2) NULL,
	[WA_Price] [decimal](18, 2) NULL,
	[MCarton_Quantity] [int] NULL,
	[MCarton_Length] [decimal](18, 2) NULL,
	[MCarton_Width] [decimal](18, 2) NULL,
	[MCarton_Height] [decimal](18, 2) NULL,
	[MCarton_Gross_Weight] [decimal](18, 2) NULL,
	[MCarton_NETT_Weight] [decimal](18, 2) NULL,
	[Status] [varchar](10) NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NULL,
	[Last_Updated] [date] NULL,
 CONSTRAINT [PK_Inv_MaterialMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_MaterialNotes]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialNotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Accd_Key] [int] NULL,
	[Taken_By] [int] NOT NULL,
	[Entry_date] [date] NOT NULL,
	[Notes] [text] NOT NULL,
	[Type] [int] NOT NULL,
	[Expiry_Date] [date] NULL,
	[ToBe_Actioned_By] [int] NULL,
	[Action_Date] [date] NULL,
	[Priority_Flg] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialNotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inv_MaterialPackaging]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialPackaging](
	[Item_Id] [int] NOT NULL,
	[Box_Number] [int] NOT NULL,
	[Box_Length] [numeric](18, 2) NULL,
	[Box_Width] [numeric](18, 2) NULL,
	[Box_Height] [numeric](18, 2) NULL,
	[Box_Gross_Weight] [numeric](18, 2) NULL,
	[Box_NETT_Weight] [numeric](18, 2) NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NULL,
	[Last_Updated] [date] NULL,
 CONSTRAINT [PK_Inv_MaterialPackaging] PRIMARY KEY CLUSTERED 
(
	[Item_Id] ASC,
	[Box_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inv_MaterialPrice]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account_Id] [int] NULL,
	[Item_Id] [int] NOT NULL,
	[From_Qty] [int] NOT NULL,
	[To_Qty] [int] NOT NULL,
	[Price_Type] [int] NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialPrice_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inv_MaterialSpares]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialSpares](
	[Item_Id] [int] NOT NULL,
	[Spare_Id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[Overview] [text] NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialSpares] PRIMARY KEY CLUSTERED 
(
	[Item_Id] ASC,
	[Spare_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inv_MaterialSpecification]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_MaterialSpecification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Batch_Number] [varchar](150) NULL,
	[Spec_Id] [int] NOT NULL,
	[Spec_Value] [varchar](100) NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NULL,
	[Last_Updated] [date] NULL,
 CONSTRAINT [PK_Inv_MaterialSpecification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_MaterialSupplier]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_MaterialSupplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Supplier_Code] [int] NOT NULL,
	[Ref_Number] [varchar](50) NOT NULL,
	[Min_Order] [int] NULL,
	[Notes] [text] NULL,
	[Currency] [int] NOT NULL,
	[Cost] [numeric](18, 2) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_StockMaster]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_StockMaster](
	[ITEM_ID] [int] NOT NULL,
	[WHS_ID] [int] NOT NULL,
	[BATCH_NO] [varchar](50) NOT NULL,
	[OB_DT] [date] NULL,
	[OB_QTY] [numeric](18, 0) NOT NULL,
	[CB_QTY] [numeric](18, 0) NOT NULL,
	[NOTES] [text] NULL,
	[WA_PRC] [decimal](18, 2) NULL,
	[FIFO_PRC] [decimal](18, 2) NULL,
	[LIFO_PRC] [decimal](18, 2) NULL,
	[COMPANY_ID] [int] NOT NULL,
	[USER_ID] [int] NULL,
	[LAST_UPDATED] [date] NULL,
 CONSTRAINT [PK_INV_STOCKMASTER] PRIMARY KEY CLUSTERED 
(
	[ITEM_ID] ASC,
	[WHS_ID] ASC,
	[BATCH_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_StockMasterSlNo]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_StockMasterSlNo](
	[ITEM_ID] [int] NOT NULL,
	[WHS_ID] [int] NOT NULL,
	[BATCH_NO] [varchar](50) NOT NULL,
	[SERIAL_NO] [varchar](500) NOT NULL,
	[CB_QTY] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_INV_STOCKMASTERSLNO] PRIMARY KEY CLUSTERED 
(
	[ITEM_ID] ASC,
	[WHS_ID] ASC,
	[BATCH_NO] ASC,
	[SERIAL_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_StockTran]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_StockTran](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DOC_CODE] [varchar](20) NOT NULL,
	[DOC_NUM] [numeric](18, 0) NOT NULL,
	[DOC_DATE] [datetime] NULL,
	[TRANS_TYPE] [varchar](10) NOT NULL,
	[REF_NO] [varchar](250) NULL,
	[REF_DT] [datetime] NULL,
	[NOTES] [varchar](5000) NULL,
	[ITEM_ID] [int] NOT NULL,
	[WHS_ID] [int] NOT NULL,
	[BATCH_NO] [varchar](250) NOT NULL,
	[REC_QTY] [numeric](18, 0) NULL,
	[ISS_QTY] [numeric](18, 0) NULL,
	[TRANS_VALUE] [decimal](18, 2) NULL,
	[USER_ID] [int] NULL,
	[LAST_UPDATED] [datetime] NULL,
 CONSTRAINT [PK_Inv_StockTran_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_StockTranSlNo]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_StockTranSlNo](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DOC_CODE] [varchar](20) NOT NULL,
	[DOC_NUM] [numeric](18, 0) NOT NULL,
	[DOC_DATE] [datetime] NULL,
	[ITEM_ID] [int] NOT NULL,
	[WHS_ID] [int] NOT NULL,
	[BATCH_NO] [varchar](250) NOT NULL,
	[SERIAL_NO] [varchar](250) NOT NULL,
	[REC_QTY] [numeric](18, 0) NULL,
	[ISS_QTY] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Inv_StockTranSlNo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inv_WarehouseMaster]    Script Date: 20/4/2015 10:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_WarehouseMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Location] [varchar](500) NULL,
	[Type] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[Branch_Id] [int] NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_WarehouseMaster_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201407220752212_InitialCreate', N'Inspired.Web.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB72DB36107DEF4CFF81C3A7A433116DE725CD48C938B2DD7A1ADB99C8491F331009C99892204B408EFC6D7DE827F5170AF04EE242F0A28BF3E291C8C5EE62F760713BF27FFFFC3B7DBF0D7CEB11C6048578669F4E4E6C0B6237F4105ECFEC0D5DBD7A63BF7FF7F34FD34B2FD85A5F73B9D75C8EB5C464663F501ABD751CE23EC000904980DC3824E18A4EDC307080173A672727BF3AA7A70E642A6CA6CBB2A69F3798A200265FD8D779885D18D10DF06F420FFA247BCEDE2C12ADD62D082089800B67F63526118AA137F9132E27A9B86D9DFB08305716D05FD916C038A4803247DF7E217041E310AF17117B00FCFBA70832B915F009CC3AF0B61437EDCBC919EF8B5336EC150BBBE825EBE7258B077DE2EE257D65DDF460F2E873E8C3AA2493FD033ED51EB0479FE23082319386ABA2BD6D39F5764EB361D1ACD286BBC00249630600DBBA01DB8F10AFE90383C6D91BDBBA425BE8E54FB2287EC188E18535A2F1867DBDDDF83E58FAB078EF686DF2BF1AABECE370AB53A70CAF36E8E751E423374929434E6C5B1F0081996F0C5A933C29E94BC728815C76EE0314EC3F8BD798BE3E93C4A6324016348CE16F10C31850E87D0294C21897CEB7652FE9183736420A0D2C7D05FE6607A66EC1235A27F168184DF3FC19FAC94BF28022091012CFBEA5A2577118F0112B497F22F16D116E62977721D48ADD83780D694F14D750FA03970EDEBF91CA87DED02740C8F730F67E07E461E7C616D0DDC42C7B0B0A82688F584FD047C6457B0EE316B4E783C2D4D58FE11AE176571331ADABA584D6D58A585757B9B2764FB994D6D14240EB67292573B357FD48BADEA788F0C66221918A2636D8E347E435A755458B5C9879D2BD54E59EEDBB5C35BAB96FF3B598EDDCF8B029B5D3C8D54DA992013E7848F45D91771811DC449F59F850D0CEFD3D1CAC92A41895D954525366933F3A509552324C0D067F87C9A0D5CBCEC83F27247451E29E6A36F82659575E62CF321BA4F2CD543ACD58371B9F22BE05638F67F62F42605BCD14B3A36ACF56B7706A37C7E21DBE803EA4D03A77D3138139202EF04424B2F879F5276CF8C298DB02FE9C2597C600612A8E75845D1401DFA81F8DD686AB75EE5D61A7F9E602461073A346F932714059D79CC25623746D919A3A15189AA3B31CDE26A8918C753968D282D10F9A62A990189119382E640ADDD83330855C99D8974FA287C2A571D19454F71DE1F2F9574CA11B87C0E5B3AD9795ADBC096664A75872D0A4C79D3DA1293B3ED8373695014D174D2C0994A500C6E2B1F1C592BF845B2A8494375C405A3F17281761D2394108585D8910369DC64A623AA86DD3D849597E6EA3D5982D053BA86D8B65592C1B4A2B49D6389CADC52BC2FA1D6B1384C66BE3A28FF2A809F5C27835AC502CE8ACC19E89778C56657BA50F9662A1D661A9A6E8518604C348898BB38A5AA9AA3102648226C58AA1C39A61BC001D0249D543667DA454735897594CD1A9BCA21A064B326F8D10AD7C9F5E4C39E5D5B893DE8DE777E88EE2127D7A03A208E175E5523D7B622DD21BF5F9AB45F70BEC20D5E1B844728F5D785B58A2610CD6B0F19699669E5EA198D00B40C112F0139FB91708625D26D8DC64759E1533984F15B934FF9CE150E417D46765718D9729B9625D0CF84231B95495245FDEDCE22C07E0835872A5360FFD4D80D5EB5675EBF462ACDA3E7D226A983A0DFF8575A9102E61F1548FBD5166EA236268869A37F7FD93246F3E38490CB51E4A16E2C925B6846B50557381881BA30061C0BCDC45D2DA424CF8E7BBD50BDD68E06EBF3CBE484B5B735BE290289F9A6BAA5F0657B5D5DF986B6CDCF85655365EED1F072DE93FBEEC0BE3ACBE5BD9EB201BA132668B903173262123754E9C42C76EC66E856454555279DC51574623129465CF8F1208D92E704C2048EEF63B0341A14357869B60509D87A9B5346ED2ABCA5AB8046A9DB5EBF15A5557730D8E041AE3AE71E557DC9D81D16DAD3B0E2EF213FFAA16D52DC0EE3357DFD3B594F86CB3DBB18A67AD3A576ABE85154AB46E2B2B06CFA8CE272AE467DD150F7A3BA73C74EF3D09A9FD6AEED1C5940B5BF5A64801B862CBDED89A4FB36D723B095ED837A722B695572BB6747C221406132E3059FCEDCF7DC462580ADC008C5690D0FBF02F8867F6D9C9E9598346DF83D2EE10E2F9C7CC6BC78F20761F402C925306D0D673A52F02B07D391615FDB024DED1E254EEB05A62D597873B48A1946B3B4863634F31289ABDB072A09F1A205E5B5A7F4CD0113CC2AF0B06A546FC05C12075C5DCB6FF1CFFF0A4DCD1CA8F94733B9A7609A5769F30783644D4D1025EE7998E1CEB51A98F8721D4686E8487522F0773750E42667C5E841C7302637ACB7E082EA1FAA67820516D10C01407163B277FFDC844C4632A6187C6D7210A9831BE8EA67E7524141E13C03266DC3042E3B38398EA2A488E31C549DEE8206B1CA3E5DB37812AA23828971D34B5112DD3E3B399ED2D43068274E9784EA25B48E53C3095B114BD4A63D971ADD2989C1DA4339621536B3193D19B95B39DDAE99C666C4EBD6D39C3B195F36944F9D45B9667F790BC50256BAC1B0154CF267D0EC4CF6A86451655170AA3960DF95C289EC371B1EF50EC90C4393C18B5BAA9B834DB094B53BCE2613365E5BF21B1F99AA075A982135A30746B736421738D57613E57373CCA451A27283790028F4DA0E731452BE052F6DA858424BFD7CD083397C1127AD7F86E43A30D655D86C1D2AF9DE8F1295F673FA1A2D67D9EDE45C92F5EC7E8027313B12EC03BFC61837CAFF0FB4A72D4A350C1D712D93935CF25E5E7D5EBA742D36D880D1565E12B9640F730887CA68CDCE10578846ADFDA63588FD8F40281750C0292E928DBB3AF0C7E5EB07DF73F92BD5755CF4B0000, N'6.0.0-20911')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Inventory')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a43f7fb6-3899-4297-978f-8ce8fb4b3e87', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fe4cb7a0-7aa9-4b08-995f-ba7656c56d07', N'1')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'a43f7fb6-3899-4297-978f-8ce8fb4b3e87', N'InventoryUser1', N'APZHRaTDTMn0YKgXXUsuImLvByVO60tRWPQUvHvUUYGIybYP7Vc/VzyNM8C601Q23Q==', N'0cda9217-6195-404e-b3c1-b61dd2f11ab5', N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'fe4cb7a0-7aa9-4b08-995f-ba7656c56d07', N'admin', N'ABeObohDIYcJtm9LGUo78FWxR+MwI32zHUUTBUqLBIZrLa69HKwdwmofoxABVYJHvg==', N'd99cc6bf-0b7f-4d14-b779-0dc9ea9fef19', N'ApplicationUser')
SET IDENTITY_INSERT [dbo].[FAS_AccountMaster] ON 

INSERT [dbo].[FAS_AccountMaster] ([Accd_Key], [Acc_Code], [Acc_Description], [Acc_Type], [Price_Type], [Company_Id], [Branch_Id]) VALUES (1, N'Test', N'Test Supplier', N'Creditors', NULL, 3, 1)
SET IDENTITY_INSERT [dbo].[FAS_AccountMaster] OFF
SET IDENTITY_INSERT [dbo].[Gen_BranchMaster] ON 

INSERT [dbo].[Gen_BranchMaster] ([Id], [Company_Id], [Description]) VALUES (1, 3, N'Default Branch')
SET IDENTITY_INSERT [dbo].[Gen_BranchMaster] OFF
INSERT [dbo].[Gen_CompanyMaster] ([Id], [Company_Code], [Company_Description], [Status]) VALUES (3, N'1', N'Inspired Lighting', N'A')
INSERT [dbo].[Gen_LookupGroup] ([Id], [LookupType_Id], [Description], [IsHidden], [Company_Id], [User_Id], [Last_Updated]) VALUES (1, 4, N'General', 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupGroup] ([Id], [LookupType_Id], [Description], [IsHidden], [Company_Id], [User_Id], [Last_Updated]) VALUES (2, 4, N'Packaging', 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (-1, 0, NULL, N'Please Select', -1, 0, 0, 3, 1, CAST(0x22390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (0, 1, 2, N'kv', 0, 0, 0, 3, 3, CAST(0xC6390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (1, 1, NULL, N'Active', 1, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (2, 1, NULL, N'Passive', 2, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (3, 1, NULL, N'Temporary', 3, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (4, 1, 1, N'15465132', 0, 0, 0, 3, 3, CAST(0xC6390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (5, 1, 1, N'testing', 0, 1, 1, 3, 3, CAST(0xCD390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (6, 1, 1, N'98376937', 0, 0, 0, 3, 3, CAST(0xCF390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (10, 2, NULL, N'Group of Lights', 1, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (11, 2, NULL, N'Type of Lights', 2, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (12, 2, NULL, N'Category', 3, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (13, 2, NULL, N'Sub Category', 4, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (14, 2, NULL, N'Make', 5, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (15, 5, 1, N'!@#$%^&*()_+_)(*&^%!@#$%^&*(>?<:":}{{}{:":":>?', 0, 1, 1, 3, 3, CAST(0xD4390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (16, 2, 1, N'testing', 0, 0, 0, 3, 3, CAST(0xD4390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (20, 5, 1, N'BJBFJBNFBOBB)_(_)*_(*?"<":<":":<> LIJVHWIU IULKJ', 1, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (21, 3, NULL, N'Relative', 2, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (22, 3, 2, N'Testing', 0, 1, 1, 3, 3, CAST(0xD4390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (23, 3, 1, N'gkjk', 0, 0, 0, 3, 3, CAST(0xD8390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (25, 5, NULL, N'GBP', 1, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (26, 5, 1, N'EURO', 2, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (35, 6, NULL, N'Internal', 1, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (36, 6, NULL, N'External', 2, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (37, 6, NULL, N'Secretive', 3, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (45, 7, NULL, N'Critical', 1, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (46, 7, NULL, N'Information', 2, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (47, 7, NULL, N'General', 3, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (48, 7, 1, N'text123456/.,/.,00=-09-', 0, 0, 0, 3, 3, CAST(0xD4390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (55, 8, NULL, N'Main', 1, 0, 0, 3, 1, CAST(0x20390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (56, 8, NULL, N'Returns', 2, 0, 0, 3, 1, CAST(0x20390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (57, 8, 1, N'123456', 0, 1, 1, 3, 3, CAST(0xD4390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (10001, 1, 1, N'Specification 1', 1, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (10002, 4, 2, N'Height', 2, 0, 0, 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupItem] ([Id], [LookupType_Id], [LookupGroup_Id], [Description], [Ordinal], [IsOther], [IsHidden], [Company_Id], [User_Id], [Last_update]) VALUES (10003, 4, 1, N'specification testing', 0, 0, 0, 3, 3, CAST(0xD4390B00 AS Date))
INSERT [dbo].[Gen_LookupType] ([Id], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (0, N'Please Select', N'Active', 3, 1, CAST(0x22390B00 AS Date))
INSERT [dbo].[Gen_LookupType] ([Id], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (1, N'Material Statuses', N'Active', 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupType] ([Id], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (2, N'Category types', N'Active', 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupType] ([Id], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (3, N'Alternate Relative', N'Active', 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupType] ([Id], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (4, N'Specification Group', N'Active', 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupType] ([Id], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (5, N'Foreign Currency', N'Active', 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupType] ([Id], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (6, N'Notes type', N'Active', 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupType] ([Id], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (7, N'Notes Priority', N'Active', 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Gen_LookupType] ([Id], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (8, N'Warehouse type', N'Active', 3, 1, CAST(0x20390B00 AS Date))
SET IDENTITY_INSERT [dbo].[Gen_UserMaster] ON 

INSERT [dbo].[Gen_UserMaster] ([Id], [UserName], [Company_Id], [Branch_Id], [Status]) VALUES (3, N'InventoryUser1', 3, 1, N'A')
SET IDENTITY_INSERT [dbo].[Gen_UserMaster] OFF
SET IDENTITY_INSERT [dbo].[Inv_CategoryMaster] ON 

INSERT [dbo].[Inv_CategoryMaster] ([Id], [Type], [Code], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (18, -1, N'1', N'322', N'A', 3, 1, CAST(0x0B390B00 AS Date))
INSERT [dbo].[Inv_CategoryMaster] ([Id], [Type], [Code], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (19, 12, N'?.''k[po', N'Category 1', N'A', 3, 3, CAST(0x0D390B00 AS Date))
INSERT [dbo].[Inv_CategoryMaster] ([Id], [Type], [Code], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (1019, 14, N'make123', N'making', N'A', 3, 3, CAST(0xD8390B00 AS Date))
INSERT [dbo].[Inv_CategoryMaster] ([Id], [Type], [Code], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (1020, 20, N'!@)&$*@%!^%_@%', N'testing', N'A', 3, 3, CAST(0xD8390B00 AS Date))
INSERT [dbo].[Inv_CategoryMaster] ([Id], [Type], [Code], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (1021, 10, N'1', N'*@#*%^#@%_#@^@^@^^?$>^>?$<^?><^:K^OP$U^($&^&_^&@_^()@#_^()@^$^$^$^$?><^$^$^"$^+^_))+@_*^!#^+#@^*@_*&^*', N'A', 3, 3, CAST(0xD8390B00 AS Date))
INSERT [dbo].[Inv_CategoryMaster] ([Id], [Type], [Code], [Description], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (1022, 15, N'test123456', N'testing1346', N'A', 3, 3, CAST(0xD8390B00 AS Date))
SET IDENTITY_INSERT [dbo].[Inv_CategoryMaster] OFF
INSERT [dbo].[Inv_DocumentMaster] ([TRANS_TYPE], [DOC_CODE], [DOC_DESC], [START_NO], [LAST_NO], [STATUS], [COMPANY_ID], [USER_ID], [LAST_UPDATE]) VALUES (N'MiscIssues', N'1', N'Miscellaneous Issues', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), 1, 3, 3, CAST(0x0000A45E00000000 AS DateTime))
INSERT [dbo].[Inv_DocumentMaster] ([TRANS_TYPE], [DOC_CODE], [DOC_DESC], [START_NO], [LAST_NO], [STATUS], [COMPANY_ID], [USER_ID], [LAST_UPDATE]) VALUES (N'MiscReciept', N'11', N'Miscellaneous Receipts', CAST(1001 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), 1, 3, 3, CAST(0x0000A45E00000000 AS DateTime))
INSERT [dbo].[Inv_DocumentMaster] ([TRANS_TYPE], [DOC_CODE], [DOC_DESC], [START_NO], [LAST_NO], [STATUS], [COMPANY_ID], [USER_ID], [LAST_UPDATE]) VALUES (N'MiscReciept', N'12', N'Test 1', CAST(2001 AS Numeric(18, 0)), CAST(2009 AS Numeric(18, 0)), 1, 3, 3, CAST(0x0000A45E00000000 AS DateTime))
INSERT [dbo].[Inv_DocumentMaster] ([TRANS_TYPE], [DOC_CODE], [DOC_DESC], [START_NO], [LAST_NO], [STATUS], [COMPANY_ID], [USER_ID], [LAST_UPDATE]) VALUES (N'StockTransfer', N'21', N'Stock Transfer', CAST(3001 AS Numeric(18, 0)), CAST(3001 AS Numeric(18, 0)), 1, 3, 3, CAST(0x0000A45E00000000 AS DateTime))
INSERT [dbo].[Inv_DocumentMaster] ([TRANS_TYPE], [DOC_CODE], [DOC_DESC], [START_NO], [LAST_NO], [STATUS], [COMPANY_ID], [USER_ID], [LAST_UPDATE]) VALUES (N'StockVerify', N'31', N'Stock Verification', CAST(4001 AS Numeric(18, 0)), CAST(4001 AS Numeric(18, 0)), 1, 3, 3, CAST(0x0000A45E00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Inv_MaterialMaster] ON 

INSERT [dbo].[Inv_MaterialMaster] ([Id], [Code], [Description], [SKU_Number], [Long_Description], [Overview], [UOM], [Margin_Percent], [Batch_YN], [Serial_YN], [Location_YN], [Shelf_Life], [Barcode], [Max_Level], [Min_Level], [Re_order_Level], [Lead_Time], [NETT_Price], [Sale_Price], [Cost_Price], [LIFO_Price], [FIFO_Price], [WA_Price], [MCarton_Quantity], [MCarton_Length], [MCarton_Width], [MCarton_Height], [MCarton_Gross_Weight], [MCarton_NETT_Weight], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (11, N'ITEM-10097', N'Item Description 10097', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Temporary', 3, NULL, NULL)
INSERT [dbo].[Inv_MaterialMaster] ([Id], [Code], [Description], [SKU_Number], [Long_Description], [Overview], [UOM], [Margin_Percent], [Batch_YN], [Serial_YN], [Location_YN], [Shelf_Life], [Barcode], [Max_Level], [Min_Level], [Re_order_Level], [Lead_Time], [NETT_Price], [Sale_Price], [Cost_Price], [LIFO_Price], [FIFO_Price], [WA_Price], [MCarton_Quantity], [MCarton_Length], [MCarton_Width], [MCarton_Height], [MCarton_Gross_Weight], [MCarton_NETT_Weight], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (14, N'ITEM-10098', N'Item Description 10098', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Temporary', 3, NULL, NULL)
INSERT [dbo].[Inv_MaterialMaster] ([Id], [Code], [Description], [SKU_Number], [Long_Description], [Overview], [UOM], [Margin_Percent], [Batch_YN], [Serial_YN], [Location_YN], [Shelf_Life], [Barcode], [Max_Level], [Min_Level], [Re_order_Level], [Lead_Time], [NETT_Price], [Sale_Price], [Cost_Price], [LIFO_Price], [FIFO_Price], [WA_Price], [MCarton_Quantity], [MCarton_Length], [MCarton_Width], [MCarton_Height], [MCarton_Gross_Weight], [MCarton_NETT_Weight], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (15, N'ITEM-10099', N'Item Description 10099', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Temporary', 3, NULL, NULL)
INSERT [dbo].[Inv_MaterialMaster] ([Id], [Code], [Description], [SKU_Number], [Long_Description], [Overview], [UOM], [Margin_Percent], [Batch_YN], [Serial_YN], [Location_YN], [Shelf_Life], [Barcode], [Max_Level], [Min_Level], [Re_order_Level], [Lead_Time], [NETT_Price], [Sale_Price], [Cost_Price], [LIFO_Price], [FIFO_Price], [WA_Price], [MCarton_Quantity], [MCarton_Length], [MCarton_Width], [MCarton_Height], [MCarton_Gross_Weight], [MCarton_NETT_Weight], [Status], [Company_Id], [User_Id], [Last_Updated]) VALUES (16, N'ITEM-10100', N'Item Description 10100', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Temporary', 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Inv_MaterialMaster] OFF
SET IDENTITY_INSERT [dbo].[Inv_MaterialNotes] ON 

INSERT [dbo].[Inv_MaterialNotes] ([Id], [Item_Id], [Accd_Key], [Taken_By], [Entry_date], [Notes], [Type], [Expiry_Date], [ToBe_Actioned_By], [Action_Date], [Priority_Flg], [Company_Id], [User_Id], [Last_Updated]) VALUES (1011, 11, NULL, 3, CAST(0x17390B00 AS Date), N'test', 35, CAST(0x17390B00 AS Date), NULL, NULL, 45, 3, 0, CAST(0x00000000 AS Date))
SET IDENTITY_INSERT [dbo].[Inv_MaterialNotes] OFF
INSERT [dbo].[Inv_MaterialSpares] ([Item_Id], [Spare_Id], [Quantity], [Price], [Overview], [Company_Id], [User_Id], [Last_Updated]) VALUES (11, 14, 5, CAST(500.00 AS Numeric(18, 2)), N'-', 3, 0, CAST(0x00000000 AS Date))
SET IDENTITY_INSERT [dbo].[Inv_MaterialSpecification] ON 

INSERT [dbo].[Inv_MaterialSpecification] ([Id], [Item_Id], [Batch_Number], [Spec_Id], [Spec_Value], [Company_Id], [User_Id], [Last_Updated]) VALUES (3042, 11, NULL, 10001, N'123452342', 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Inv_MaterialSpecification] OFF
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (11, 2, N'1', CAST(0xD6390B00 AS Date), CAST(1 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD8390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (11, 2, N'100', CAST(0xD6390B00 AS Date), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD6390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (11, 2, N'2000000000000', CAST(0xD6390B00 AS Date), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD6390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (11, 2, N'500', CAST(0x643A0B00 AS Date), CAST(5 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD1390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (11, 3, N'500', CAST(0x643A0B00 AS Date), CAST(4 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD0390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (11, 5, N'1', CAST(0x00000000 AS Date), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD6390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (14, 2, N'1', CAST(0xD6390B00 AS Date), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD8390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (14, 2, N'5', CAST(0xD6390B00 AS Date), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD6390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (14, 2, N'500', CAST(0x823A0B00 AS Date), CAST(5 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD1390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (15, 2, N'1111', CAST(0xD6390B00 AS Date), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD6390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (15, 2, N'23232323', CAST(0x643A0B00 AS Date), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD6390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (15, 3, N'1', CAST(0x453A0B00 AS Date), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xCF390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (15, 5, N'111111', CAST(0xD6390B00 AS Date), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD6390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (16, 2, N'Default Batch', CAST(0x823A0B00 AS Date), CAST(5 AS Numeric(18, 0)), CAST(119 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD8390B00 AS Date))
INSERT [dbo].[Inv_StockMaster] ([ITEM_ID], [WHS_ID], [BATCH_NO], [OB_DT], [OB_QTY], [CB_QTY], [NOTES], [WA_PRC], [FIFO_PRC], [LIFO_PRC], [COMPANY_ID], [USER_ID], [LAST_UPDATED]) VALUES (16, 5, N'Default Batch', CAST(0xD6390B00 AS Date), CAST(1 AS Numeric(18, 0)), CAST(81 AS Numeric(18, 0)), NULL, NULL, NULL, NULL, 3, 3, CAST(0xD8390B00 AS Date))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'1', N'22222222222222222', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'1', N'4354', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'1', N'45645656', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'1', N'567', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'1', N'56756767', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'1', N'657', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'100', N'1000000000000000', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'2000000000000', N'5655555555555555555555', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'1', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'2', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'234', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'3', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'4', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'4365', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'5', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'567', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'6', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'678', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'7', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 2, N'500', N'7865', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 3, N'500', N'1', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 3, N'500', N'2', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 3, N'500', N'3', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 3, N'500', N'4', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 5, N'1', N'4354456456', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (11, 5, N'1', N'567457', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (14, 2, N'1', N'567567567567', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (14, 2, N'1', N'67878', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (14, 2, N'5', N'567567657', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (14, 2, N'500', N'1', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (14, 2, N'500', N'2', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (14, 2, N'500', N'3', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (14, 2, N'500', N'4', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (14, 2, N'500', N'5', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (15, 2, N'1111', N'5673456456', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (15, 2, N'23232323', N'456456456', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (15, 3, N'1', N'7777777777777777777', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (15, 5, N'111111', N'567567567567', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (16, 2, N'Default Batch', N'Default Serial', CAST(119 AS Numeric(18, 0)))
INSERT [dbo].[Inv_StockMasterSlNo] ([ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [CB_QTY]) VALUES (16, 5, N'Default Batch', N'Default Serial', CAST(81 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[Inv_StockTran] ON 

INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(27 AS Numeric(18, 0)), N'11', CAST(11 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), N'misc', N'1000', CAST(0x0000A50900000000 AS DateTime), N'-', 11, 2, N'500', CAST(5 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A475013472BE AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(28 AS Numeric(18, 0)), N'12', CAST(12 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), N'misc', N'1000', CAST(0x0000A50900000000 AS DateTime), N'-', 11, 2, N'500', CAST(2 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A4750134AD7E AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(29 AS Numeric(18, 0)), N'12', CAST(13 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), N'misc', N'1000', CAST(0x0000A50900000000 AS DateTime), NULL, 11, 3, N'500', CAST(4 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A4750134D50A AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(30 AS Numeric(18, 0)), N'11', CAST(14 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), N'misc', N'1000', CAST(0x0000A52700000000 AS DateTime), NULL, 14, 2, N'500', CAST(5 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47600D4CC07 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(31 AS Numeric(18, 0)), N'11', CAST(15 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), N'misc', N'1000', CAST(0x0000A52700000000 AS DateTime), NULL, 11, 2, N'500', CAST(3 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47600D6E3AA AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(32 AS Numeric(18, 0)), N'11', CAST(16 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), N'misc', N'1000', CAST(0x0000A52700000000 AS DateTime), NULL, 16, 2, N'Default Batch', CAST(5 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47600D8F207 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(33 AS Numeric(18, 0)), N'11', CAST(17 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), N'misc', N'1000', CAST(0x0000A52700000000 AS DateTime), NULL, 11, 2, N'500', CAST(5 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47600D92D50 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(34 AS Numeric(18, 0)), N'12', CAST(18 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), N'misc', N'1000', CAST(0x0000A52700000000 AS DateTime), NULL, 16, 2, N'Default Batch', CAST(5 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A476013A0577 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(41 AS Numeric(18, 0)), N'12', CAST(19 AS Numeric(18, 0)), CAST(0x0000A47B011827F6 AS DateTime), N'misc', N'1', CAST(0x0000A47B011827F6 AS DateTime), NULL, 11, 5, N'1', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B011827FB AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(45 AS Numeric(18, 0)), N'12', CAST(19 AS Numeric(18, 0)), CAST(0x0000A47B012A3F04 AS DateTime), N'misc', N'1', CAST(0x0000A47B012A3F04 AS DateTime), NULL, 14, 2, N'1', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B012A3F0A AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(46 AS Numeric(18, 0)), N'12', CAST(19 AS Numeric(18, 0)), CAST(0x0000A47B012AE5AE AS DateTime), N'misc', N'1', CAST(0x0000A47B012AE5AE AS DateTime), NULL, 14, 2, N'5', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B012AE5B2 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(53 AS Numeric(18, 0)), N'11', CAST(2001 AS Numeric(18, 0)), CAST(0x0000A47B012D1E49 AS DateTime), N'misc', N'1', CAST(0x0000A47B012D1E49 AS DateTime), NULL, 15, 2, N'1111', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B012D1E4E AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(54 AS Numeric(18, 0)), N'12', CAST(2002 AS Numeric(18, 0)), CAST(0x0000A47B012D494A AS DateTime), N'misc', N'1', CAST(0x0000A47B012D494A AS DateTime), NULL, 11, 2, N'100', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B012D4950 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(56 AS Numeric(18, 0)), N'12', CAST(2002 AS Numeric(18, 0)), CAST(0x0000A47B012F347E AS DateTime), N'misc', N'1', CAST(0x0000A47B012F347E AS DateTime), NULL, 11, 2, N'1', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B012F3483 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(57 AS Numeric(18, 0)), N'12', CAST(2002 AS Numeric(18, 0)), CAST(0x0000A47B012F5BB6 AS DateTime), N'misc', N'1', CAST(0x0000A47B012F5BB6 AS DateTime), NULL, 11, 2, N'2000000000000', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B012F5BBC AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(58 AS Numeric(18, 0)), N'11', CAST(1002 AS Numeric(18, 0)), CAST(0x0000A47B0131EE91 AS DateTime), N'misc', N'1', CAST(0x0000A47B0131EE91 AS DateTime), NULL, 11, 5, N'1', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B0131EE97 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(59 AS Numeric(18, 0)), N'12', CAST(1003 AS Numeric(18, 0)), CAST(0x0000A4EA00000000 AS DateTime), N'misc', N'1', CAST(0x0000A4EA00000000 AS DateTime), NULL, 15, 3, N'1', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A4740132A55E AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(63 AS Numeric(18, 0)), N'12', CAST(1004 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), N'misc', N'1', CAST(0x0000A50900000000 AS DateTime), NULL, 15, 2, N'23232323', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B0133A510 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(64 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47B00000000 AS DateTime), NULL, 11, 2, N'1', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B0134DF12 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(65 AS Numeric(18, 0)), N'12', CAST(2002 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47B00000000 AS DateTime), NULL, 16, 5, N'Default Batch', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B0136BF72 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(66 AS Numeric(18, 0)), N'12', CAST(2003 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47B00000000 AS DateTime), NULL, 16, 5, N'Default Batch', CAST(10 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B0136EF44 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(67 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), N'misc', NULL, CAST(0x0000A47B00000000 AS DateTime), NULL, 16, 5, N'Default Batch', CAST(9 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B01371464 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10035 AS Numeric(18, 0)), N'12', CAST(2004 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47B00000000 AS DateTime), NULL, 15, 5, N'111111', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47B0147C6AD AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10036 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'-', CAST(0x0000A47D00000000 AS DateTime), NULL, 16, 2, N'Default Batch', CAST(50 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00C812F6 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10037 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'-', CAST(0x0000A47D00000000 AS DateTime), NULL, 16, 2, N'Default Batch', CAST(50 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00C81718 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10038 AS Numeric(18, 0)), N'12', CAST(2006 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 16, 2, N'Default Batch', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00C847AD AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10039 AS Numeric(18, 0)), N'12', CAST(2006 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 16, 2, N'Default Batch', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00C8A10C AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10040 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 16, 5, N'Default Batch', CAST(20 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00C94A26 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10041 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 16, 5, N'Default Batch', CAST(20 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00C953D5 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10042 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 16, 5, N'Default Batch', CAST(20 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00C977E2 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10043 AS Numeric(18, 0)), N'12', CAST(2008 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 16, 2, N'Default Batch', CAST(5 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00CABCA3 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10044 AS Numeric(18, 0)), N'11', CAST(1 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 16, 5, N'Default Batch', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00CB0820 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10045 AS Numeric(18, 0)), N'11', CAST(2 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 16, 2, N'Default Batch', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00CB7EDA AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10046 AS Numeric(18, 0)), N'11', CAST(3 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 11, 2, N'1', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00CE2FB3 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10047 AS Numeric(18, 0)), N'12', CAST(2009 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 16, 2, N'Default Batch', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00CEA6F4 AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10048 AS Numeric(18, 0)), N'11', CAST(4 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'2', CAST(0x0000A47D00000000 AS DateTime), NULL, 14, 2, N'1', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D00D043ED AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10049 AS Numeric(18, 0)), N'11', CAST(5 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 11, 2, N'1', CAST(1 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D011E7DAF AS DateTime))
INSERT [dbo].[Inv_StockTran] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [TRANS_TYPE], [REF_NO], [REF_DT], [NOTES], [ITEM_ID], [WHS_ID], [BATCH_NO], [REC_QTY], [ISS_QTY], [TRANS_VALUE], [USER_ID], [LAST_UPDATED]) VALUES (CAST(10050 AS Numeric(18, 0)), N'11', CAST(6 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), N'misc', N'1', CAST(0x0000A47D00000000 AS DateTime), NULL, 11, 2, N'1', CAST(2 AS Numeric(18, 0)), NULL, NULL, 3, CAST(0x0000A47D011FE7EC AS DateTime))
SET IDENTITY_INSERT [dbo].[Inv_StockTran] OFF
SET IDENTITY_INSERT [dbo].[Inv_StockTranSlNo] ON 

INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(12 AS Numeric(18, 0)), N'11', CAST(11 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 11, 2, N'500', N'1', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(13 AS Numeric(18, 0)), N'11', CAST(11 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 11, 2, N'500', N'2', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(14 AS Numeric(18, 0)), N'11', CAST(11 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 11, 2, N'500', N'3', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(15 AS Numeric(18, 0)), N'11', CAST(11 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 11, 2, N'500', N'4', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(16 AS Numeric(18, 0)), N'11', CAST(11 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 11, 2, N'500', N'5', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(17 AS Numeric(18, 0)), N'12', CAST(12 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 11, 2, N'500', N'6', CAST(2 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(18 AS Numeric(18, 0)), N'12', CAST(12 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 11, 2, N'500', N'7', CAST(2 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(19 AS Numeric(18, 0)), N'12', CAST(13 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 11, 3, N'500', N'1', CAST(4 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(20 AS Numeric(18, 0)), N'12', CAST(13 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 11, 3, N'500', N'2', CAST(4 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(21 AS Numeric(18, 0)), N'12', CAST(13 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 11, 3, N'500', N'3', CAST(4 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(22 AS Numeric(18, 0)), N'12', CAST(13 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 11, 3, N'500', N'4', CAST(4 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(23 AS Numeric(18, 0)), N'11', CAST(14 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 14, 2, N'500', N'1', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(24 AS Numeric(18, 0)), N'11', CAST(14 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 14, 2, N'500', N'2', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(25 AS Numeric(18, 0)), N'11', CAST(14 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 14, 2, N'500', N'3', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(26 AS Numeric(18, 0)), N'11', CAST(14 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 14, 2, N'500', N'4', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(27 AS Numeric(18, 0)), N'11', CAST(14 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 14, 2, N'500', N'5', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(28 AS Numeric(18, 0)), N'11', CAST(15 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 11, 2, N'500', N'1', CAST(3 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(29 AS Numeric(18, 0)), N'11', CAST(15 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 11, 2, N'500', N'2', CAST(3 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(30 AS Numeric(18, 0)), N'11', CAST(15 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 11, 2, N'500', N'3', CAST(3 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(31 AS Numeric(18, 0)), N'11', CAST(16 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(32 AS Numeric(18, 0)), N'11', CAST(16 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(33 AS Numeric(18, 0)), N'11', CAST(16 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(34 AS Numeric(18, 0)), N'11', CAST(16 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(35 AS Numeric(18, 0)), N'11', CAST(16 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(36 AS Numeric(18, 0)), N'11', CAST(17 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 11, 2, N'500', N'567', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(37 AS Numeric(18, 0)), N'11', CAST(17 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 11, 2, N'500', N'4365', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(38 AS Numeric(18, 0)), N'11', CAST(17 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 11, 2, N'500', N'678', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(39 AS Numeric(18, 0)), N'11', CAST(17 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 11, 2, N'500', N'7865', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(40 AS Numeric(18, 0)), N'11', CAST(17 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 11, 2, N'500', N'234', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(41 AS Numeric(18, 0)), N'12', CAST(18 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(42 AS Numeric(18, 0)), N'12', CAST(18 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(43 AS Numeric(18, 0)), N'12', CAST(18 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(44 AS Numeric(18, 0)), N'12', CAST(18 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(45 AS Numeric(18, 0)), N'12', CAST(18 AS Numeric(18, 0)), CAST(0x0000A52700000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(46 AS Numeric(18, 0)), N'12', CAST(2002 AS Numeric(18, 0)), CAST(0x0000A47B0118281B AS DateTime), 11, 5, N'1', N'567457', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(47 AS Numeric(18, 0)), N'12', CAST(2002 AS Numeric(18, 0)), CAST(0x0000A47B012A3F2E AS DateTime), 14, 2, N'1', N'567567567567', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(48 AS Numeric(18, 0)), N'12', CAST(2002 AS Numeric(18, 0)), CAST(0x0000A47B012AE5D1 AS DateTime), 14, 2, N'5', N'567567657', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(49 AS Numeric(18, 0)), N'11', CAST(2001 AS Numeric(18, 0)), CAST(0x0000A47B012D1E6F AS DateTime), 15, 2, N'1111', N'5673456456', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(50 AS Numeric(18, 0)), N'12', CAST(2002 AS Numeric(18, 0)), CAST(0x0000A47B012D495D AS DateTime), 11, 2, N'100', N'1000000000000000', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(51 AS Numeric(18, 0)), N'12', CAST(2002 AS Numeric(18, 0)), CAST(0x0000A47B012F349C AS DateTime), 11, 2, N'1', N'56756767', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(52 AS Numeric(18, 0)), N'12', CAST(2002 AS Numeric(18, 0)), CAST(0x0000A47B012F5BC9 AS DateTime), 11, 2, N'2000000000000', N'5655555555555555555555', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(53 AS Numeric(18, 0)), N'11', CAST(1002 AS Numeric(18, 0)), CAST(0x0000A47B0131EEC1 AS DateTime), 11, 5, N'1', N'4354456456', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(54 AS Numeric(18, 0)), N'12', CAST(1003 AS Numeric(18, 0)), CAST(0x0000A4EA00000000 AS DateTime), 15, 3, N'1', N'7777777777777777777', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(55 AS Numeric(18, 0)), N'12', CAST(1004 AS Numeric(18, 0)), CAST(0x0000A50900000000 AS DateTime), 15, 2, N'23232323', N'456456456', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(56 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 11, 2, N'1', N'22222222222222222', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(57 AS Numeric(18, 0)), N'12', CAST(2002 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(58 AS Numeric(18, 0)), N'12', CAST(2003 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(10 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(59 AS Numeric(18, 0)), N'12', CAST(2003 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(10 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(60 AS Numeric(18, 0)), N'12', CAST(2003 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(10 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(61 AS Numeric(18, 0)), N'12', CAST(2003 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(10 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(62 AS Numeric(18, 0)), N'12', CAST(2003 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(10 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(63 AS Numeric(18, 0)), N'12', CAST(2003 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(10 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(64 AS Numeric(18, 0)), N'12', CAST(2003 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(10 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(65 AS Numeric(18, 0)), N'12', CAST(2003 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(10 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(66 AS Numeric(18, 0)), N'12', CAST(2003 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(10 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(67 AS Numeric(18, 0)), N'12', CAST(2003 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(10 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(68 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(9 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(69 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(9 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(70 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(9 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(71 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(9 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(72 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(9 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(73 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(9 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(74 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(9 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(75 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(9 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(76 AS Numeric(18, 0)), N'11', CAST(0 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(9 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10046 AS Numeric(18, 0)), N'12', CAST(2004 AS Numeric(18, 0)), CAST(0x0000A47B00000000 AS DateTime), 15, 5, N'111111', N'567567567567', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10047 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10048 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10049 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10050 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10051 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10052 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10053 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10054 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10055 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10056 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10057 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10058 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10059 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10060 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10061 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10062 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10063 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10064 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10065 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10066 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10067 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10068 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10069 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10070 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10071 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10072 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10073 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10074 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10075 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10076 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10077 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10078 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10079 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10080 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10081 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10082 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10083 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10084 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10085 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10086 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10087 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10088 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10089 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10090 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10091 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10092 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10093 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10094 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10095 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10096 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10097 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10098 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10099 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10100 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10101 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10102 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10103 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10104 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10105 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10106 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10107 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10108 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10109 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10110 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10111 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10112 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10113 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10114 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10115 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10116 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10117 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10118 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10119 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10120 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10121 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10122 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10123 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10124 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10125 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10126 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10127 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10128 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10129 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10130 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10131 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10132 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10133 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10134 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10135 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10136 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10137 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10138 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10139 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10140 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10141 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10142 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10143 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10144 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10145 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10146 AS Numeric(18, 0)), N'12', CAST(2005 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(50 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10147 AS Numeric(18, 0)), N'12', CAST(2006 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10148 AS Numeric(18, 0)), N'12', CAST(2006 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10149 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10150 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10151 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10152 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10153 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10154 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10155 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10156 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10157 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10158 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10159 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10160 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10161 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10162 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10163 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10164 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10165 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10166 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10167 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10168 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10169 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10170 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10171 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10172 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10173 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10174 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10175 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10176 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10177 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10178 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10179 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10180 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10181 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10182 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10183 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10184 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10185 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10186 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10187 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10188 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10189 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10190 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10191 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10192 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10193 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10194 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10195 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10196 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10197 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10198 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10199 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10200 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10201 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10202 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10203 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10204 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10205 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10206 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10207 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10208 AS Numeric(18, 0)), N'12', CAST(2007 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(20 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10209 AS Numeric(18, 0)), N'12', CAST(2008 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10210 AS Numeric(18, 0)), N'12', CAST(2008 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10211 AS Numeric(18, 0)), N'12', CAST(2008 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10212 AS Numeric(18, 0)), N'12', CAST(2008 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10213 AS Numeric(18, 0)), N'12', CAST(2008 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(5 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10214 AS Numeric(18, 0)), N'11', CAST(1 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 5, N'Default Batch', N'Default Serial', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10215 AS Numeric(18, 0)), N'11', CAST(2 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10216 AS Numeric(18, 0)), N'11', CAST(3 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 11, 2, N'1', N'45645656', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10217 AS Numeric(18, 0)), N'12', CAST(2009 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 16, 2, N'Default Batch', N'Default Serial', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10218 AS Numeric(18, 0)), N'11', CAST(4 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 14, 2, N'1', N'67878', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10219 AS Numeric(18, 0)), N'11', CAST(5 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 11, 2, N'1', N'4354', CAST(1 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10220 AS Numeric(18, 0)), N'11', CAST(6 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 11, 2, N'1', N'567', CAST(2 AS Numeric(18, 0)), NULL)
INSERT [dbo].[Inv_StockTranSlNo] ([ID], [DOC_CODE], [DOC_NUM], [DOC_DATE], [ITEM_ID], [WHS_ID], [BATCH_NO], [SERIAL_NO], [REC_QTY], [ISS_QTY]) VALUES (CAST(10221 AS Numeric(18, 0)), N'11', CAST(6 AS Numeric(18, 0)), CAST(0x0000A47D00000000 AS DateTime), 11, 2, N'1', N'657', CAST(2 AS Numeric(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[Inv_StockTranSlNo] OFF
SET IDENTITY_INSERT [dbo].[Inv_WarehouseMaster] ON 

INSERT [dbo].[Inv_WarehouseMaster] ([Id], [Code], [Description], [Location], [Type], [Company_Id], [Branch_Id], [User_Id], [Last_Updated]) VALUES (2, N'WHS', N'Default Warehouse 33', NULL, 55, 3, NULL, 0, CAST(0x00000000 AS Date))
INSERT [dbo].[Inv_WarehouseMaster] ([Id], [Code], [Description], [Location], [Type], [Company_Id], [Branch_Id], [User_Id], [Last_Updated]) VALUES (3, N'Test', N'Test Warehouse', NULL, 56, 3, NULL, 0, CAST(0x00000000 AS Date))
INSERT [dbo].[Inv_WarehouseMaster] ([Id], [Code], [Description], [Location], [Type], [Company_Id], [Branch_Id], [User_Id], [Last_Updated]) VALUES (5, N'wh2', N'-', NULL, 55, 3, NULL, 0, CAST(0x00000000 AS Date))
SET IDENTITY_INSERT [dbo].[Inv_WarehouseMaster] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User_Id]    Script Date: 20/4/2015 10:40:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[AspNetUserClaims]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 20/4/2015 10:40:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 20/4/2015 10:40:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 20/4/2015 10:40:30 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUsers]    Script Date: 20/4/2015 10:40:30 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AspNetUsers] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Inv_MaterialSpecification]    Script Date: 20/4/2015 10:40:30 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Inv_MaterialSpecification] ON [dbo].[Inv_MaterialSpecification]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Gen_LookupGroup] ADD  CONSTRAINT [DF_Gen_LookupGroup_IsHidden]  DEFAULT ((0)) FOR [IsHidden]
GO
ALTER TABLE [dbo].[Gen_LookupItem] ADD  CONSTRAINT [DF_Gen_LookupItem_IsOther]  DEFAULT ((0)) FOR [IsOther]
GO
ALTER TABLE [dbo].[Gen_LookupItem] ADD  CONSTRAINT [DF_Gen_LookupItem_IsHidden]  DEFAULT ((0)) FOR [IsHidden]
GO
ALTER TABLE [dbo].[Inv_DocumentMaster] ADD  CONSTRAINT [DF_Inv_DocMas_START_NO]  DEFAULT ((0)) FOR [START_NO]
GO
ALTER TABLE [dbo].[Inv_DocumentMaster] ADD  CONSTRAINT [DF_Inv_DocMas_LAST_NO]  DEFAULT ((0)) FOR [LAST_NO]
GO
ALTER TABLE [dbo].[Inv_StockMaster] ADD  CONSTRAINT [DF_INV_STOCKMASTER_BATCH_NO]  DEFAULT ('DB1') FOR [BATCH_NO]
GO
ALTER TABLE [dbo].[Inv_StockMaster] ADD  CONSTRAINT [DF_INV_STOCKMASTER_OB_QTY]  DEFAULT ((0)) FOR [OB_QTY]
GO
ALTER TABLE [dbo].[Inv_StockMaster] ADD  CONSTRAINT [DF_INV_STOCKMASTER_CB_QTY]  DEFAULT ((0)) FOR [CB_QTY]
GO
ALTER TABLE [dbo].[Inv_StockMasterSlNo] ADD  CONSTRAINT [DF_INV_STOCKMASTERSLNO_BATCH_NO]  DEFAULT ('DB1') FOR [BATCH_NO]
GO
ALTER TABLE [dbo].[Inv_StockMasterSlNo] ADD  CONSTRAINT [DF_INV_STOCKMASTERSLNO_SERIAL_NO]  DEFAULT ('DS1') FOR [SERIAL_NO]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[FAS_AccountMaster]  WITH CHECK ADD  CONSTRAINT [FK_FAS_AccountMaster_Gen_BranchMaster] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Gen_BranchMaster] ([Id])
GO
ALTER TABLE [dbo].[FAS_AccountMaster] CHECK CONSTRAINT [FK_FAS_AccountMaster_Gen_BranchMaster]
GO
ALTER TABLE [dbo].[FAS_AccountMaster]  WITH CHECK ADD  CONSTRAINT [FK_FAS_AccountMaster_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[FAS_AccountMaster] CHECK CONSTRAINT [FK_FAS_AccountMaster_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[FAS_AccountMaster]  WITH CHECK ADD  CONSTRAINT [FK_FAS_AccountMaster_Gen_LookupItem] FOREIGN KEY([Price_Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[FAS_AccountMaster] CHECK CONSTRAINT [FK_FAS_AccountMaster_Gen_LookupItem]
GO
ALTER TABLE [dbo].[Gen_BranchMaster]  WITH CHECK ADD  CONSTRAINT [FK_Gen_BranchMaster_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_BranchMaster] CHECK CONSTRAINT [FK_Gen_BranchMaster_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Gen_LookupGroup]  WITH CHECK ADD  CONSTRAINT [FK_Gen_LookupGroup_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_LookupGroup] CHECK CONSTRAINT [FK_Gen_LookupGroup_Company]
GO
ALTER TABLE [dbo].[Gen_LookupItem]  WITH CHECK ADD  CONSTRAINT [FK_Gen_LookupItem_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_LookupItem] CHECK CONSTRAINT [FK_Gen_LookupItem_Company]
GO
ALTER TABLE [dbo].[Gen_LookupItem]  WITH CHECK ADD  CONSTRAINT [LookupGroup_LookupItem] FOREIGN KEY([LookupGroup_Id])
REFERENCES [dbo].[Gen_LookupGroup] ([Id])
GO
ALTER TABLE [dbo].[Gen_LookupItem] CHECK CONSTRAINT [LookupGroup_LookupItem]
GO
ALTER TABLE [dbo].[Gen_LookupItem]  WITH CHECK ADD  CONSTRAINT [LookupType_LookupItem] FOREIGN KEY([LookupType_Id])
REFERENCES [dbo].[Gen_LookupType] ([Id])
GO
ALTER TABLE [dbo].[Gen_LookupItem] CHECK CONSTRAINT [LookupType_LookupItem]
GO
ALTER TABLE [dbo].[Gen_LookupType]  WITH CHECK ADD  CONSTRAINT [FK_Gen_LookupType_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_LookupType] CHECK CONSTRAINT [FK_Gen_LookupType_Company]
GO
ALTER TABLE [dbo].[Gen_UserMaster]  WITH CHECK ADD  CONSTRAINT [AspNetUser] FOREIGN KEY([UserName])
REFERENCES [dbo].[AspNetUsers] ([UserName])
GO
ALTER TABLE [dbo].[Gen_UserMaster] CHECK CONSTRAINT [AspNetUser]
GO
ALTER TABLE [dbo].[Gen_UserMaster]  WITH CHECK ADD  CONSTRAINT [Branch] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Gen_BranchMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_UserMaster] CHECK CONSTRAINT [Branch]
GO
ALTER TABLE [dbo].[Gen_UserMaster]  WITH CHECK ADD  CONSTRAINT [Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_UserMaster] CHECK CONSTRAINT [Company]
GO
ALTER TABLE [dbo].[Inv_CategoryMaster]  WITH CHECK ADD  CONSTRAINT [CategoryType_Lookup] FOREIGN KEY([Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_CategoryMaster] CHECK CONSTRAINT [CategoryType_Lookup]
GO
ALTER TABLE [dbo].[Inv_CategoryMaster]  WITH CHECK ADD  CONSTRAINT [InvCategory_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_CategoryMaster] CHECK CONSTRAINT [InvCategory_Company]
GO
ALTER TABLE [dbo].[Inv_DocumentMaster]  WITH CHECK ADD  CONSTRAINT [FK_Inv_DocMas_Company] FOREIGN KEY([COMPANY_ID])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_DocumentMaster] CHECK CONSTRAINT [FK_Inv_DocMas_Company]
GO
ALTER TABLE [dbo].[Inv_DocumentMaster]  WITH CHECK ADD  CONSTRAINT [FK_Inv_DocMas_User] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[Gen_UserMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_DocumentMaster] CHECK CONSTRAINT [FK_Inv_DocMas_User]
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative]  WITH CHECK ADD  CONSTRAINT [AlternateRelativeItemCollection] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative] CHECK CONSTRAINT [AlternateRelativeItemCollection]
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative]  WITH CHECK ADD  CONSTRAINT [AlternateRelativeItemId] FOREIGN KEY([AR_Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative] CHECK CONSTRAINT [AlternateRelativeItemId]
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialAlternateRelative_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative] CHECK CONSTRAINT [FK_Inv_MaterialAlternateRelative_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative]  WITH CHECK ADD  CONSTRAINT [MaterialAlternativeFlagLookup] FOREIGN KEY([AR_Flag])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative] CHECK CONSTRAINT [MaterialAlternativeFlagLookup]
GO
ALTER TABLE [dbo].[Inv_MaterialBOM]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBOM_Child] FOREIGN KEY([Child_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBOM] CHECK CONSTRAINT [FK_Inv_MaterialBOM_Child]
GO
ALTER TABLE [dbo].[Inv_MaterialBOM]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBOM_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBOM] CHECK CONSTRAINT [FK_Inv_MaterialBOM_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialBOM]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBOM_Parent] FOREIGN KEY([Parent_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBOM] CHECK CONSTRAINT [FK_Inv_MaterialBOM_Parent]
GO
ALTER TABLE [dbo].[Inv_MaterialBranch]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBranch_Gen_BranchMaster] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Gen_BranchMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBranch] CHECK CONSTRAINT [FK_Inv_MaterialBranch_Gen_BranchMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialBranch]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBranch_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBranch] CHECK CONSTRAINT [FK_Inv_MaterialBranch_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialBranch]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBranch_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBranch] CHECK CONSTRAINT [FK_Inv_MaterialBranch_Inv_MaterialMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialBranchSpec]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBranchSpec_Branch] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Gen_BranchMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBranchSpec] CHECK CONSTRAINT [FK_Inv_MaterialBranchSpec_Branch]
GO
ALTER TABLE [dbo].[Inv_MaterialBranchSpec]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBranchSpec_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBranchSpec] CHECK CONSTRAINT [FK_Inv_MaterialBranchSpec_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialBranchSpec]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBranchSpec_Material] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBranchSpec] CHECK CONSTRAINT [FK_Inv_MaterialBranchSpec_Material]
GO
ALTER TABLE [dbo].[Inv_MaterialBranchSpec]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBranchSpec_Specification] FOREIGN KEY([Spec_Id])
REFERENCES [dbo].[Inv_MaterialSpecification] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBranchSpec] CHECK CONSTRAINT [FK_Inv_MaterialBranchSpec_Specification]
GO
ALTER TABLE [dbo].[Inv_MaterialCategory]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialCategory_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialCategory] CHECK CONSTRAINT [FK_Inv_MaterialCategory_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialCategory]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialCategory_Inv_CategoryMaster1] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialCategory] CHECK CONSTRAINT [FK_Inv_MaterialCategory_Inv_CategoryMaster1]
GO
ALTER TABLE [dbo].[Inv_MaterialCategory]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialCategory_Material] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialCategory] CHECK CONSTRAINT [FK_Inv_MaterialCategory_Material]
GO
ALTER TABLE [dbo].[Inv_MaterialCategory]  WITH CHECK ADD  CONSTRAINT [MaterialCategoryTypeLookup] FOREIGN KEY([Category_Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialCategory] CHECK CONSTRAINT [MaterialCategoryTypeLookup]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Category]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_FAS_AccountMaster] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[FAS_AccountMaster] ([Accd_Key])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_FAS_AccountMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Gen_BranchMaster] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Gen_BranchMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Gen_BranchMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Gen_LookupItem] FOREIGN KEY([Price_Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Gen_LookupItem]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Group]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Inv_MaterialMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Make] FOREIGN KEY([Make_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Make]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Model_Number] FOREIGN KEY([Model_Number_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Model_Number]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_SubCategory] FOREIGN KEY([SubCategory_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_SubCategory]
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDiscount_Type] FOREIGN KEY([Type_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDiscount] CHECK CONSTRAINT [FK_Inv_MaterialDiscount_Type]
GO
ALTER TABLE [dbo].[Inv_MaterialDocument]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialDocument_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialDocument] CHECK CONSTRAINT [FK_Inv_MaterialDocument_Inv_MaterialMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialMaster]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialMaster_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialMaster] CHECK CONSTRAINT [FK_Inv_MaterialMaster_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialMaster]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialMaster_UOM_Lookup] FOREIGN KEY([UOM])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialMaster] CHECK CONSTRAINT [FK_Inv_MaterialMaster_UOM_Lookup]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_FAS_AccountMaster] FOREIGN KEY([Accd_Key])
REFERENCES [dbo].[FAS_AccountMaster] ([Accd_Key])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_FAS_AccountMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_Inv_MaterialMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_NotesType] FOREIGN KEY([Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_NotesType]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_PriorityFlag] FOREIGN KEY([Priority_Flg])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_PriorityFlag]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_TakenBy] FOREIGN KEY([Taken_By])
REFERENCES [dbo].[Gen_UserMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_TakenBy]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_ToBeActionedBy] FOREIGN KEY([ToBe_Actioned_By])
REFERENCES [dbo].[Gen_UserMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_ToBeActionedBy]
GO
ALTER TABLE [dbo].[Inv_MaterialPackaging]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialPackaging_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialPackaging] CHECK CONSTRAINT [FK_Inv_MaterialPackaging_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialPackaging]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialPackaging_Material] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialPackaging] CHECK CONSTRAINT [FK_Inv_MaterialPackaging_Material]
GO
ALTER TABLE [dbo].[Inv_MaterialPrice]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialPrice_FAS_AccountMaster] FOREIGN KEY([Account_Id])
REFERENCES [dbo].[FAS_AccountMaster] ([Accd_Key])
GO
ALTER TABLE [dbo].[Inv_MaterialPrice] CHECK CONSTRAINT [FK_Inv_MaterialPrice_FAS_AccountMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialPrice]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialPrice_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialPrice] CHECK CONSTRAINT [FK_Inv_MaterialPrice_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialPrice]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialPrice_Gen_LookupItem] FOREIGN KEY([Price_Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialPrice] CHECK CONSTRAINT [FK_Inv_MaterialPrice_Gen_LookupItem]
GO
ALTER TABLE [dbo].[Inv_MaterialPrice]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialPrice_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialPrice] CHECK CONSTRAINT [FK_Inv_MaterialPrice_Inv_MaterialMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialSpares]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSpares_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSpares] CHECK CONSTRAINT [FK_Inv_MaterialSpares_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialSpares]  WITH CHECK ADD  CONSTRAINT [MaterialSpares] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSpares] CHECK CONSTRAINT [MaterialSpares]
GO
ALTER TABLE [dbo].[Inv_MaterialSpares]  WITH CHECK ADD  CONSTRAINT [SpareItem] FOREIGN KEY([Spare_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSpares] CHECK CONSTRAINT [SpareItem]
GO
ALTER TABLE [dbo].[Inv_MaterialSpecification]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSpecification_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSpecification] CHECK CONSTRAINT [FK_Inv_MaterialSpecification_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialSpecification]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSpecification_Material] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSpecification] CHECK CONSTRAINT [FK_Inv_MaterialSpecification_Material]
GO
ALTER TABLE [dbo].[Inv_MaterialSpecification]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSpecIdLookup] FOREIGN KEY([Spec_Id])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSpecification] CHECK CONSTRAINT [FK_MaterialSpecIdLookup]
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSupplier_FAS_AccountMaster] FOREIGN KEY([Supplier_Code])
REFERENCES [dbo].[FAS_AccountMaster] ([Accd_Key])
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier] CHECK CONSTRAINT [FK_Inv_MaterialSupplier_FAS_AccountMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSupplier_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier] CHECK CONSTRAINT [FK_Inv_MaterialSupplier_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSupplier_Gen_LookupItem] FOREIGN KEY([Currency])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier] CHECK CONSTRAINT [FK_Inv_MaterialSupplier_Gen_LookupItem]
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSupplier_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSupplier] CHECK CONSTRAINT [FK_Inv_MaterialSupplier_Inv_MaterialMaster]
GO
ALTER TABLE [dbo].[Inv_StockMaster]  WITH CHECK ADD  CONSTRAINT [FK_INV_STOCKMASTER_COMPANY] FOREIGN KEY([COMPANY_ID])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockMaster] CHECK CONSTRAINT [FK_INV_STOCKMASTER_COMPANY]
GO
ALTER TABLE [dbo].[Inv_StockMaster]  WITH CHECK ADD  CONSTRAINT [FK_INV_STOCKMASTER_USER] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[Gen_UserMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockMaster] CHECK CONSTRAINT [FK_INV_STOCKMASTER_USER]
GO
ALTER TABLE [dbo].[Inv_StockMaster]  WITH CHECK ADD  CONSTRAINT [FK_INV_STOCKMASTER_WAREHOUSEMASTER] FOREIGN KEY([WHS_ID])
REFERENCES [dbo].[Inv_WarehouseMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockMaster] CHECK CONSTRAINT [FK_INV_STOCKMASTER_WAREHOUSEMASTER]
GO
ALTER TABLE [dbo].[Inv_StockMaster]  WITH CHECK ADD  CONSTRAINT [FK_INVSTOCKMASTER_MATERIALMASTER] FOREIGN KEY([ITEM_ID])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockMaster] CHECK CONSTRAINT [FK_INVSTOCKMASTER_MATERIALMASTER]
GO
ALTER TABLE [dbo].[Inv_StockMasterSlNo]  WITH CHECK ADD  CONSTRAINT [FK_INV_STOCKMASTERSLNO_WAREHOUSEMASTER] FOREIGN KEY([WHS_ID])
REFERENCES [dbo].[Inv_WarehouseMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockMasterSlNo] CHECK CONSTRAINT [FK_INV_STOCKMASTERSLNO_WAREHOUSEMASTER]
GO
ALTER TABLE [dbo].[Inv_StockMasterSlNo]  WITH CHECK ADD  CONSTRAINT [FK_INVSTOCKMASTERSLNO_MATERIALMASTER] FOREIGN KEY([ITEM_ID])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockMasterSlNo] CHECK CONSTRAINT [FK_INVSTOCKMASTERSLNO_MATERIALMASTER]
GO
ALTER TABLE [dbo].[Inv_StockTran]  WITH CHECK ADD  CONSTRAINT [FK_Inv_StockTran_Item] FOREIGN KEY([ITEM_ID])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockTran] CHECK CONSTRAINT [FK_Inv_StockTran_Item]
GO
ALTER TABLE [dbo].[Inv_StockTran]  WITH CHECK ADD  CONSTRAINT [FK_Inv_StockTran_User] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[Gen_UserMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockTran] CHECK CONSTRAINT [FK_Inv_StockTran_User]
GO
ALTER TABLE [dbo].[Inv_StockTran]  WITH CHECK ADD  CONSTRAINT [FK_Inv_StockTran_Warehouse] FOREIGN KEY([WHS_ID])
REFERENCES [dbo].[Inv_WarehouseMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockTran] CHECK CONSTRAINT [FK_Inv_StockTran_Warehouse]
GO
ALTER TABLE [dbo].[Inv_StockTranSlNo]  WITH CHECK ADD  CONSTRAINT [FK_Inv_StockTranSlNo_Item] FOREIGN KEY([ITEM_ID])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockTranSlNo] CHECK CONSTRAINT [FK_Inv_StockTranSlNo_Item]
GO
ALTER TABLE [dbo].[Inv_StockTranSlNo]  WITH CHECK ADD  CONSTRAINT [FK_Inv_StockTranSlNo_Warehouse] FOREIGN KEY([WHS_ID])
REFERENCES [dbo].[Inv_WarehouseMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockTranSlNo] CHECK CONSTRAINT [FK_Inv_StockTranSlNo_Warehouse]
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster]  WITH CHECK ADD  CONSTRAINT [FK_Inv_WarehouseMaster_Gen_BranchMaster] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Gen_BranchMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster] CHECK CONSTRAINT [FK_Inv_WarehouseMaster_Gen_BranchMaster]
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster]  WITH CHECK ADD  CONSTRAINT [FK_Inv_WarehouseMaster_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster] CHECK CONSTRAINT [FK_Inv_WarehouseMaster_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseType_Lookup] FOREIGN KEY([Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_WarehouseMaster] CHECK CONSTRAINT [FK_WarehouseType_Lookup]
GO
USE [master]
GO
ALTER DATABASE [Inspired] SET  READ_WRITE 
GO
