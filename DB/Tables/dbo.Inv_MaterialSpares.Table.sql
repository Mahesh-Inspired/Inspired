USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialSpares]    Script Date: 05/02/2015 09:42:15 ******/
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
