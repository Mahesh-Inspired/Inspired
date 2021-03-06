USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialBranchSpec]    Script Date: 05/02/2015 09:42:15 ******/
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
