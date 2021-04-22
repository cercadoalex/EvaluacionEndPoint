using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using WebApi.Entities;
using WebApi.UnitOfWork.Interface.Repository;

namespace WebApi.UnitOfWork.Core.Repository
{
    public class ClienteRepository : Repository, IClienteRepository
    {
        public ClienteRepository(IDbTransaction transaction) : base(transaction) { }

        public IEnumerable<Cliente> GetAllFacturaSinEmitir()
        {
            var result = Connection.Query<Cliente>("sp_lista_cliente_factura_sin_emitir", commandType: CommandType.StoredProcedure, transaction: Transaction).AsList();
            return result;
        }
    }
}
