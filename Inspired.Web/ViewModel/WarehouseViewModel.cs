using Inspired.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Inspired.Web.ViewModel
{
    public class WarehouseViewModel
    {
        public List<Inv_WarehouseMaster> warehouseList;
        public String warehouseCode { get; set; }
        public String warehouseDescription { get; set; }
        public Int32 warehouseId { get; set; }
        public String warehouseLocation { get; set; }
        public SelectList WarehouseTypes { get; set; }
        public SelectList Branches { get; set; }
        
        #region constructor
        public WarehouseViewModel(IEnumerable<Gen_LookupItem> types, List<Inv_WarehouseMaster> warehouses, List<Gen_BranchMaster> branches)
        {
            if (types == null) throw new ArgumentNullException("WarehouseTypes");
            WarehouseTypes = new SelectList(types.ToList(), "Id", "Description");
            
            warehouseList  = warehouses;
            Branches = new SelectList(branches.ToList(), "Id", "Description");
        }
        #endregion
    }
}