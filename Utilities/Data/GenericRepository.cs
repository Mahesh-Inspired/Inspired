using Inspired.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Utilities.Data
{
    public class GenericRepository<TEntity> : IGenericRepository<TEntity> where TEntity : class
    {
        #region Declarations

        protected DbContext context;
        internal DbSet<TEntity> dbSet;

        #endregion

        #region Constructor

        public GenericRepository(DbContext context)
        {
            this.context = context;
            dbSet = context.Set<TEntity>();
        }

        #endregion

        #region Get

        public virtual IEnumerable<TEntity> Get(
            Expression<Func<TEntity, bool>> filter = null,
            Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
            string includeProperties = "")
        {
            return GetQ(filter, orderBy, includeProperties).ToList();
        }

        public virtual TEntity GetById(object id)
        {
            return dbSet.Find(id);
        }

        public virtual IQueryable<TEntity> GetQ(
            Expression<Func<TEntity, bool>> filter = null,
            Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
            string includeProperties = "")
        {
            IQueryable<TEntity> query = dbSet;

            if (filter != null)
            {
                query = query.Where(filter);
            }

            foreach (string includeProperty in includeProperties.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                query = query.Include(includeProperty);
            }
            return orderBy != null ? orderBy(query) : query;

        }

        #endregion

        #region Insert

        public virtual void Insert(TEntity entity)
        {
            dbSet.Add(entity);
        }

        #endregion

        #region InsertOrUpdateGraph

        public void InsertOrUpdateGraph(TEntity entityGraph)
        {
            //if (entityGraph.ObjectState == ObjectState.Added)
            //{
            //    dbSet.Add(entityGraph);
            //}
            //else
            //{
            //    dbSet.Attach(entityGraph);
            //    context.ApplyStateChanges();
            //}
        }

        #endregion

        #region Delete

        public virtual void Delete(object id)
        {
            try
            {
                TEntity entityToDelete = dbSet.Find(id);
                Delete(entityToDelete);
            }
            catch(Exception e)
            { }
        }

        public virtual void Delete(TEntity entityToDelete)
        {
            if (context.Entry(entityToDelete).State == EntityState.Detached)
            {
                dbSet.Attach(entityToDelete);
            }
            dbSet.Remove(entityToDelete);
        }

        #endregion

        #region Update

        public virtual void Update(TEntity entityToUpdate)
        {
            dbSet.Attach(entityToUpdate);
            context.Entry(entityToUpdate).State = EntityState.Modified;
        }

        #endregion

    }
}
