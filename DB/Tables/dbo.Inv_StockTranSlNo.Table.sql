USE [Inspired]
GO
/****** Object:  Table [dbo].[Inv_StockTranSlNo]    Script Date: 05/02/2015 09:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inv_StockTranSlNo](
	[DOC_CODE] [varchar](20) NOT NULL,
	[DOC_NUM] [numeric](18, 0) NOT NULL,
	[DOC_DATE] [date] NOT NULL,
	[ITEM_ID] [int] NOT NULL,
	[WHS_ID] [int] NOT NULL,
	[BATCH_NO] [varchar](250) NOT NULL,
	[SERIAL_NO] [varchar](250) NOT NULL,
	[REC_QTY] [numeric](18, 0) NULL,
	[ISS_QTY] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Inv_StockTranSlNo]  WITH CHECK ADD  CONSTRAINT [FK_Inv_StockTranSlNo_Item] FOREIGN KEY([ITEM_ID])
REFERENCES [dbo].[Inv_MaterialMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockTranSlNo] CHECK CONSTRAINT [FK_Inv_StockTranSlNo_Item]
GO
ALTER TABLE [dbo].[Inv_StockTranSlNo]  WITH CHECK ADD  CONSTRAINT [FK_Inv_StockTranSlNo_Warehouse] FOREIGN KEY([WHS_ID])
REFERENCES [dbo].[Inv_WarehouseMaster] ([Id])
GO
ALTER TABLE [dbo].[Inv_StockTranSlNo] CHECK CONSTRAINT [FK_Inv_StockTranSlNo_Warehouse]
GO
