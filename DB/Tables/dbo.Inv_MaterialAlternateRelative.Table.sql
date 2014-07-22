USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialAlternateRelative]    Script Date: 21/07/2014 16:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialAlternateRelative](
	[Item_Id] [int] NOT NULL,
	[AR_Item_Id] [int] NOT NULL,
	[AR_Flag] [bit] NOT NULL,
	[Notes] [text] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialAlternateRelative_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative] CHECK CONSTRAINT [FK_Inv_MaterialAlternateRelative_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialAlternateRelative_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative] CHECK CONSTRAINT [FK_Inv_MaterialAlternateRelative_Inv_MaterialMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialAlternateRelative_Inv_MaterialMaster1] FOREIGN KEY([AR_Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialAlternateRelative] CHECK CONSTRAINT [FK_Inv_MaterialAlternateRelative_Inv_MaterialMaster1]
GO
