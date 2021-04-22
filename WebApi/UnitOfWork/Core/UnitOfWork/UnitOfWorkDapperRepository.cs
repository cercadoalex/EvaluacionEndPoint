using System.Data;
using WebApi.UnitOfWork.Core.Repository;
using WebApi.UnitOfWork.Interface.Repository;
using WebApi.UnitOfWork.Interface.UnitOfWork;

namespace WebApi.UnitOfWork.Core.UnitOfWork
{
    public class UnitOfWorkDapperRepository : IUnitOfWorkRepository
    {

        public IProductoRepository ProductRepository { get; }

        public IClienteRepository ClienteRepository { get; }

        public IVendedorRepository VendedorRepository { get; }

        public IFacturaRepository FacturaRepository { get; }

        public UnitOfWorkDapperRepository(IDbTransaction transaction)
        {
            ProductRepository = new ProductoRepository(transaction);
            ClienteRepository = new ClienteRepository(transaction);
            VendedorRepository = new VendedorRepository(transaction);
            FacturaRepository = new FacturaRepository(transaction);
        }

    }
}
