using Dapper;
using System.Collections.Generic;
using System.Data;
using WebApi.Entities;
using WebApi.UnitOfWork.Interface.Repository;

namespace WebApi.UnitOfWork.Core.Repository
{
    public class ProductoRepository : Repository, IProductoRepository
    {

        public ProductoRepository(IDbTransaction transaction) : base(transaction)
        {

        }

        public IEnumerable<Producto> GetAll()
        {
            var result = Connection.Query<Producto>("sp_lista_productos", commandType: CommandType.StoredProcedure, transaction: Transaction).AsList();
            return result;
        }

    }
}
