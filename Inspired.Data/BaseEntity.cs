using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inspired.Data
{
    class BaseEntity:IObjectWithState
    {
        public ObjectState ObjectState { get; set; }

    }

    public enum ObjectState
    {
        Unchanged,
        Added,
        Modified,
        Deleted
    }
}
