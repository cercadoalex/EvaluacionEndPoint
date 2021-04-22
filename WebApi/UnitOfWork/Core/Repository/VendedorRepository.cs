using Dapper;
using System.Collections.Generic;
using System.Data;
using WebApi.Entities;
using WebApi.UnitOfWork.Interface.Repository;

namespace WebApi.UnitOfWork.Core.Repository
{
    public class VendedorRepository : Repository, IVendedorRepository
    {
        public VendedorRepository(IDbTransaction transaction) : base(transaction) { }

        public IEnumerable<Vendedor> GetAllByYear()
        {
            var result = Connection.Query<Vendedor>("sp_vendedor_por_anio", commandType: CommandType.StoredProcedure, transaction: Transaction).AsList();
            return result;
        }
    }
}
