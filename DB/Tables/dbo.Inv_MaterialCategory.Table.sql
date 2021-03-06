USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialCategory]    Script Date: 05/02/2015 09:42:15 ******/
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
