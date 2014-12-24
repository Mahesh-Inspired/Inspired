using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Data;
using Inspired.Data;

namespace Inspired.Repository
{
    public interface IUnitOfWork
    {
        
        IGenericRepository<Gen_UserMaster> UserMasterRepository { get; }
        IGenericRepository<Gen_LookupItem> LookupItemRepository { get; }
        IGenericRepository<Gen_LookupType> LookupTypeRepository { get; }
        IGenericRepository<Gen_LookupGroup> LookupGroupRepository { get; }
        IGenericRepository<Gen_BranchMaster> BranchRepository { get; }

        IGenericRepository<Inv_CategoryMaster> CategoryMasterRepository { get; }
        IGenericRepository<Inv_MaterialMaster> MaterialMasterRepository { get; }
        IGenericRepository<Inv_MaterialCategory> MaterialCategoryRepository { get; }
        IGenericRepository<Inv_MaterialSpecification> MaterialSpecificationRepository { get; }
        IGenericRepository<Inv_MaterialPackaging> MaterialPackagingRepository { get; }
        IGenericRepository<Inv_MaterialSpares> MaterialSparesRepository { get; }
        IGenericRepository<Inv_MaterialAlternateRelative> MaterialAltRelativeRepository { get; }
        IGenericRepository<Inv_MaterialSupplier> MaterialSupplierRepository { get; }
        IGenericRepository<Inv_MaterialNotes> MaterialNotesRepository { get; }
        IGenericRepository<Inv_WarehouseMaster> WarehouseRepository { get; }
        
        IGenericRepository<FAS_AccountMaster> AccountMasterRepository { get; }
        IGenericRepository<Inv_MaterialDocument> MaterialDocumentRepository { get; }
        void Save();

        void DisableChangeTracking();
        void EnableChangeTracking();
        void Dispose();
    }
}
