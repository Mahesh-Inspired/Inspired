USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_MaterialNotes]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inv_MaterialNotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Accd_Key] [int] NULL,
	[Taken_By] [int] NOT NULL,
	[Entry_date] [date] NOT NULL,
	[Notes] [text] NOT NULL,
	[Type] [int] NOT NULL,
	[Expiry_Date] [date] NULL,
	[ToBe_Actioned_By] [int] NULL,
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
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_Inv_MaterialMaster] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_Inv_MaterialMaster]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_NotesType] FOREIGN KEY([Type])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_NotesType]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_PriorityFlag] FOREIGN KEY([Priority_Flg])
REFERENCES [dbo].[Gen_LookupItem] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_PriorityFlag]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_TakenBy] FOREIGN KEY([Taken_By])
REFERENCES [dbo].[Gen_UserMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_TakenBy]
GO
ALTER TABLE [dbo].[Inv_MaterialNotes]  WITH CHECK ADD  CONSTRAINT [FK_Inv_MaterialNotes_ToBeActionedBy] FOREIGN KEY([ToBe_Actioned_By])
REFERENCES [dbo].[Gen_UserMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_MaterialNotes] CHECK CONSTRAINT [FK_Inv_MaterialNotes_ToBeActionedBy]
GO
