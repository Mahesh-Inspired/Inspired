USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialNotes]    Script Date: 09/09/2014 21:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_MaterialNotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Accd_Key] [int] NOT NULL,
	[Taken_By] [varchar](50) NOT NULL,
	[Entry_date] [date] NOT NULL,
	[Notes] [text] NOT NULL,
	[Type] [varchar](1) NOT NULL,
	[Expiry_Date] [date] NULL,
	[ToBe_Actioned_By] [varchar](50) NULL,
	[Action_Date] [date] NULL,
	[Priority_Flg] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_Updated] [date] NOT NULL,
 CONSTRAINT [PK_Inv_MaterialNotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_FAS_AccountMaster] FOREIGN KEY([Accd_Key])
REFERENCES [dbo].[FAS_AccountMaster] ([Accd_Key])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_FAS_AccountMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_Gen_CompanyMaster] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_Gen_CompanyMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_Gen_LookupItem] FOREIGN KEY([Priority_Flg])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_Gen_LookupItem]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_Inv_MaterialMaster]
GO
