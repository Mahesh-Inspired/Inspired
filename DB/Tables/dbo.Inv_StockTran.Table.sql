USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_StockTran]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_StockTran](
	[DOC_CODE] [varchar](20) NOT NULL,
	[DOC_NUM] [numeric](18, 0) NOT NULL,
	[DOC_DATE] [date] NOT NULL,
	[TRANS_TYPE] [varchar](10) NOT NULL,
	[REF_NO] [varchar](250) NULL,
	[REF_DT] [datetime] NULL,
	[NOTES] [varchar](5000) NULL,
	[ITEM_ID] [int] NOT NULL,
	[WHS_ID] [int] NOT NULL,
	[BATCH_NO] [varchar](250) NOT NULL,
	[REC_QTY] [numeric](18, 0) NULL,
	[ISS_QTY] [numeric](18, 0) NULL,
	[TRANS_VALUE] [decimal](18, 2) NULL,
	[USER_ID] [int] NULL,
	[LAST_UPDATED] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Inv_StockTran]  WITH CHECK ADD  CONSTRAINT [FK_Inv_StockTran_Item] FOREIGN KEY([ITEM_ID])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockTran] CHECK CONSTRAINT [FK_Inv_StockTran_Item]
GO
ALTER TABLE [dbo].[Inv_StockTran]  WITH CHECK ADD  CONSTRAINT [FK_Inv_StockTran_User] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[Gen_UserMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockTran] CHECK CONSTRAINT [FK_Inv_StockTran_User]
GO
ALTER TABLE [dbo].[Inv_StockTran]  WITH CHECK ADD  CONSTRAINT [FK_Inv_StockTran_Warehouse] FOREIGN KEY([WHS_ID])
REFERENCES [dbo].[Inv_WarehouseMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockTran] CHECK CONSTRAINT [FK_Inv_StockTran_Warehouse]
GO
