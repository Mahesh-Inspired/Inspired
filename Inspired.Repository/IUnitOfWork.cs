﻿using System;
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

        void Save();

        void DisableChangeTracking();
        void EnableChangeTracking();
        void Dispose();
    }
}
