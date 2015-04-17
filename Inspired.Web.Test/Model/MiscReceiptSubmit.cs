using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Inspired.Web.ViewModel;

namespace Inspired.Web.Test.Model
{
    class MiscReceiptSubmit
    {
        public static MiscReceiptSubmitModel FilledWithData()
        {
            MiscReceiptSubmitModel MiscReceiptSubmit = new MiscReceiptSubmitModel();

            MiscReceiptSubmit.DocCode = "11";
            MiscReceiptSubmit.DocNum = 18;
            MiscReceiptSubmit.DocDate = DateTime.Now;
            MiscReceiptSubmit.TransType = "misc";
            MiscReceiptSubmit.RefNum = "1000";
            MiscReceiptSubmit.RefDate = DateTime.Now;
            MiscReceiptSubmit.ItemDetail = new List<ItemDetails> { };
            MiscReceiptSubmit.SerialNoDetail = new List<SerialNoDetails> { };

            ItemDetails MiscReceiptItemSubmit = new ItemDetails();

            MiscReceiptItemSubmit.ItemID = 11;
            MiscReceiptItemSubmit.ItemCode = "ITEM-10097";
            MiscReceiptItemSubmit.ItemDesc = "Item Description 10097";
            MiscReceiptItemSubmit.WareHouseID = 2;
            MiscReceiptItemSubmit.WareHouse = "WHS";
            MiscReceiptItemSubmit.BatchNum = "500";
            MiscReceiptItemSubmit.Quantity = 5;
            MiscReceiptItemSubmit.Notes = "-";

            SerialNoDetails MiscReceiptSerialSubmit = new SerialNoDetails();

            MiscReceiptSerialSubmit.ItemID = 11;
            MiscReceiptSerialSubmit.WareHouseID = 2;
            MiscReceiptSerialSubmit.BatchNum = "500";
            MiscReceiptSerialSubmit.SerialNo = "565587";
            MiscReceiptSerialSubmit.Quantity = 5;

            MiscReceiptSubmit.ItemDetail.Add(MiscReceiptItemSubmit);

            MiscReceiptSubmit.SerialNoDetail.Add(MiscReceiptSerialSubmit);

            return MiscReceiptSubmit;
        }

        public static MiscReceiptSubmitModel FilledWithBlankSerialNumbers()
        {
            MiscReceiptSubmitModel MiscReceiptSubmit = new MiscReceiptSubmitModel();

            MiscReceiptSubmit.DocCode = "11";
            MiscReceiptSubmit.DocNum = 18;
            MiscReceiptSubmit.DocDate = DateTime.Now;
            MiscReceiptSubmit.TransType = "misc";
            MiscReceiptSubmit.RefNum = "1000";
            MiscReceiptSubmit.RefDate = DateTime.Now;
            MiscReceiptSubmit.ItemDetail = new List<ItemDetails> { };
            MiscReceiptSubmit.SerialNoDetail = new List<SerialNoDetails> { };

            ItemDetails MiscReceiptItemSubmit = new ItemDetails();

            MiscReceiptItemSubmit.ItemID = 11;
            MiscReceiptItemSubmit.ItemCode = "ITEM-10097";
            MiscReceiptItemSubmit.ItemDesc = "Item Description 10097";
            MiscReceiptItemSubmit.WareHouseID = 2;
            MiscReceiptItemSubmit.WareHouse = "WHS";
            MiscReceiptItemSubmit.BatchNum = "500";
            MiscReceiptItemSubmit.Quantity = 5;
            MiscReceiptItemSubmit.Notes = "-";

            MiscReceiptSubmit.ItemDetail.Add(MiscReceiptItemSubmit);

            return MiscReceiptSubmit;
        }
    }
}
