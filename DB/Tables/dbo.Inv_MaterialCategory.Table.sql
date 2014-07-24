USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialCategory]    Script Date: 24/07/2014 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialCategory](
	[Item_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialCategory] PRIMARY KEY CLUSTERED 
(
	[Item_Id] ASC,
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Inv_MaterialCategory]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialCategory_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Inv_CategoryMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialCategory] CHECK CONSTRAINT [FK_Inv_MaterialCategory_Category]
GO
ALTER TABLE [dbo].[Inv_MaterialCategory]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialCategory_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialCategory] CHECK CONSTRAINT [FK_Inv_MaterialCategory_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialCategory]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialCategory_Material] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialCategory] CHECK CONSTRAINT [FK_Inv_MaterialCategory_Material]
GO
