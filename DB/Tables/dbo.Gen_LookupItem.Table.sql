USE [Inspired]
GO
/****** Object:  Table [dbo].[Gen_LookupItem]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gen_LookupItem](
	[Id] [int] NOT NULL,
	[LookupType_Id] [int] NOT NULL,
	[LookupGroup_Id] [int] NULL,
	[Description] [varchar](500) NOT NULL,
	[Ordinal] [int] NOT NULL,
	[IsOther] [bit] NOT NULL,
	[IsHidden] [bit] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Last_update] [date] NOT NULL,
 CONSTRAINT [PK_Gen_LookupItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gen_LookupItem] ADD  CONSTRAINT [DF_Gen_LookupItem_IsOther]  DEFAULT ((0)) FOR [IsOther]
GO
ALTER TABLE [dbo].[Gen_LookupItem] ADD  CONSTRAINT [DF_Gen_LookupItem_IsHidden]  DEFAULT ((0)) FOR [IsHidden]
GO
ALTER TABLE [dbo].[Gen_LookupItem]  WITH CHECK ADD  CONSTRAINT [FK_Gen_LookupItem_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Gen_LookupItem] CHECK CONSTRAINT [FK_Gen_LookupItem_Company]
GO
ALTER TABLE [dbo].[Gen_LookupItem]  WITH CHECK ADD  CONSTRAINT [LookupGroup_LookupItem] FOREIGN KEY([LookupGroup_Id])
REFERENCES [dbo].[Gen_LookupGroup] ([Id])
GO
ALTER TABLE [dbo].[Gen_LookupItem] CHECK CONSTRAINT [LookupGroup_LookupItem]
GO
ALTER TABLE [dbo].[Gen_LookupItem]  WITH CHECK ADD  CONSTRAINT [LookupType_LookupItem] FOREIGN KEY([LookupType_Id])
REFERENCES [dbo].[Gen_LookupType] ([Id])
GO
ALTER TABLE [dbo].[Gen_LookupItem] CHECK CONSTRAINT [LookupType_LookupItem]
GO
