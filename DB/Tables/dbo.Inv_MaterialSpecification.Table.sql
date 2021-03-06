USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialSpecification]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_MaterialSpecification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Batch_Number] [varchar](150) NULL,
	[Spec_Id] [int] NOT NULL,
	[Spec_Value] [varchar](100) NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NULL,
	[Last_Updated] [date] NULL,
 CONSTRAINT [PK_Inv_MaterialSpecification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[Inv_MaterialSpecification]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSpecIdLookup] FOREIGN KEY([Spec_Id])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialSpecification] CHECK CONSTRAINT [FK_MaterialSpecIdLookup]
GO
