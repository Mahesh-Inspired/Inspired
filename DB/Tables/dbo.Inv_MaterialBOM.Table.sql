USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialBOM]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialBOM](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Parent_Id] [int] NOT NULL,
	[Child_Id] [int] NOT NULL,
	[Notes] [text] NULL,
	[Quantity] [int] NOT NULL,
	[In_Out_Flag] [bit] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialBOM] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Inv_MaterialBOM]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBOM_Child] FOREIGN KEY([Child_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBOM] CHECK CONSTRAINT [FK_Inv_MaterialBOM_Child]
GO
ALTER TABLE [dbo].[Inv_MaterialBOM]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBOM_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBOM] CHECK CONSTRAINT [FK_Inv_MaterialBOM_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialBOM]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialBOM_Parent] FOREIGN KEY([Parent_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialBOM] CHECK CONSTRAINT [FK_Inv_MaterialBOM_Parent]
GO
