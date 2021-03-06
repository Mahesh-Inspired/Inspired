USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialPackaging]    Script Date: 05/02/2015 09:42:15 ******/
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
