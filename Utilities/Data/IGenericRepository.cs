using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Utilities.Data
{
    public interface IGenericRepository<TEntity> where TEntity:class
    {
        void Insert(TEntity entity);
        void Update(TEntity entityToUpdate);
        void Delete(object id);
        void Delete(TEntity entityToDelete);
        void InsertOrUpdateGraph(TEntity entityGraph);
        IEnumerable<TEntity> Get(Expression<Func<TEntity, bool>> filter = null,
                                 Func<IQueryable<TEntity>,
                                     IOrderedQueryable<TEntity>> orderBy = null,
                                 string includeProperties = "");
        IQueryable<TEntity> GetQ(Expression<Func<TEntity, bool>> filter = null,
                                 Func<IQueryable<TEntity>,
                                     IOrderedQueryable<TEntity>> orderBy = null,
                                 string includeProperties = "");
        TEntity GetById(object id);
    }
}
