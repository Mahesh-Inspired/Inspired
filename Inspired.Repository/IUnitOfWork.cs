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
        IGenericRepository<Inv_CategoryMaster> CategoryMasterRepository { get; }
        IGenericRepository<Gen_UserMaster> UserMasterRepository { get; }
        IGenericRepository<Gen_LookupItem> LookupItemRepository { get; }
        IGenericRepository<Inv_MaterialMaster> MaterialMasterRepository { get; }
        IGenericRepository<Inv_MaterialCategory> MaterialCategoryRepository { get; }
        IGenericRepository<Inv_MaterialSpecification> MaterialSpecificationRepository { get; }
        IGenericRepository<Inv_MaterialPackaging> MaterialPackagingRepository { get; }

        IGenericRepository<Inv_MaterialSpares> MaterialSparesRepository { get; }
        void Save();

        void DisableChangeTracking();
        void EnableChangeTracking();
        void Dispose();
    }
}
