USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialBranchSpec]    Script Date: 21/07/2014 16:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialBranchSpec](
	[Item_Id] [int] NOT NULL,
	[Branch_Id] [int] NOT NULL,
	[Spec_Id] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL
) ON [PRIMARY]

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
