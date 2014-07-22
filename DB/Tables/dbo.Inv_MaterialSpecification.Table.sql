USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialSpecification]    Script Date: 21/07/2014 16:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_MaterialSpecification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Spec_Group] [varchar](150) NULL,
	[Batch_Number] [varchar](150) NULL,
	[Spec_Code] [varchar](50) NULL,
	[Spec_Description] [varchar](250) NULL,
	[Spec_Value] [varchar](100) NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NULL,
	[Last_Updated] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Inv_MaterialSpecification]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSpecification_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSpecification] CHECK CONSTRAINT [FK_Inv_MaterialSpecification_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialSpecification]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialSpecification_Material] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSpecification] CHECK CONSTRAINT [FK_Inv_MaterialSpecification_Material]
GO
