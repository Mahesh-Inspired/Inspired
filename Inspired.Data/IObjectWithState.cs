using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inspired.Data
{
    public interface IObjectWithState
    {
        ObjectState ObjectState { get; set; }
    }
}
