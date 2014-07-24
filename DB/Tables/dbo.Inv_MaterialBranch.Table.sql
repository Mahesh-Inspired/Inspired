USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialBranch]    Script Date: 24/07/2014 11:11:00 ******/
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
	[Last_Updated] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
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
