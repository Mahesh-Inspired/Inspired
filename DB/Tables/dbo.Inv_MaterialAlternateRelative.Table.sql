USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialAlternateRelative]    Script Date: 05/02/2015 09:42:15 ******/
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
