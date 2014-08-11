using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;

namespace Utilities.Data
{
    public static class WhereExtensions
    {
        public static IEnumerable<T> Where<T>(this IEnumerable<T> enumerable, List<String> filters)
        {
            if (filters.Count > 0)
                return enumerable.AsQueryable().Where(filters).AsEnumerable();
            else
                return enumerable;

        }

        public static IQueryable<T> Where<T>(this IQueryable<T> source, List<String> strfilters)
        {
            Type type = typeof(T);
            ParameterExpression arg = Expression.Parameter(type, "x");
            Expression expr = arg;

            // get the last filter
            String[] filter = strfilters[strfilters.Count - 1].Split('~');

            ParameterExpression parameter = Expression.Parameter(typeof(T), "x");
            Expression property = parameter;
            foreach (string prop in filter[0].Trim().Split('_'))
            {
                PropertyInfo pi = type.GetProperty(prop);
                property = Expression.Property(property, pi);
                type = pi.PropertyType;
            }
            var value = Expression.Constant(filter[2]);
            var valType = value.Type;

            var method = valType.GetMethod("StartsWith", new[] { typeof(string) }); ;
            if (filter[1].IndexOf("endswith") >= 0)
                method = valType.GetMethod("EndsWith", new[] { typeof(string) });
            else if (filter[1].IndexOf("contains") >= 0)
                method = valType.GetMethod("Contains", new[] { typeof(string) });
            else if (filter[1].IndexOf("eq") >= 0)
                method = valType.GetMethod("Equals", new[] { typeof(string) });

            MethodInfo miTL = typeof(String).GetMethod("ToLower", System.Type.EmptyTypes);
            var call = Expression.Call(property, miTL);
            call = Expression.Call(call, method, value);
            var lambda = Expression.Lambda<Func<T, bool>>(call, parameter);
            return (IQueryable<T>)source.Provider.CreateQuery(Expression.Call(typeof(Queryable), "Where",
                                    new[] { typeof(T) }, source.Expression, lambda));
        }
    }
}