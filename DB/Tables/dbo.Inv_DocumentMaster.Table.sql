USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_DocumentMaster]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_DocumentMaster](
	[TRANS_TYPE] [varchar](50) NOT NULL,
	[DOC_CODE] [varchar](20) NOT NULL,
	[DOC_DESC] [varchar](250) NOT NULL,
	[START_NO] [numeric](18, 0) NOT NULL,
	[LAST_NO] [numeric](18, 0) NOT NULL,
	[STATUS] [bit] NOT NULL,
	[COMPANY_ID] [int] NOT NULL,
	[USER_ID] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
 CONSTRAINT [PK_Inv_DocumentMaster] PRIMARY KEY CLUSTERED 
(
	[TRANS_TYPE] ASC,
	[DOC_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Inv_DocumentMaster] ADD  CONSTRAINT [DF_Inv_DocMas_START_NO]  DEFAULT ((0)) FOR [START_NO]
GO
ALTER TABLE [dbo].[Inv_DocumentMaster] ADD  CONSTRAINT [DF_Inv_DocMas_LAST_NO]  DEFAULT ((0)) FOR [LAST_NO]
GO
ALTER TABLE [dbo].[Inv_DocumentMaster]  WITH CHECK ADD  CONSTRAINT [FK_Inv_DocMas_Company] FOREIGN KEY([COMPANY_ID])
REFERENCES [dbo].[Gen_CompanyMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_DocumentMaster] CHECK CONSTRAINT [FK_Inv_DocMas_Company]
GO
ALTER TABLE [dbo].[Inv_DocumentMaster]  WITH CHECK ADD  CONSTRAINT [FK_Inv_DocMas_User] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[Gen_UserMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_DocumentMaster] CHECK CONSTRAINT [FK_Inv_DocMas_User]
GO
