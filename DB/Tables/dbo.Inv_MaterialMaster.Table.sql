USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialMaster]    Script Date: 05/02/2015 09:42:15 ******/
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
