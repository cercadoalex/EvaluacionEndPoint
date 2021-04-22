using WebApi.UnitOfWork.Interface.Repository;

namespace WebApi.UnitOfWork.Interface.UnitOfWork
{
    public interface IUnitOfWorkRepository
    {
        IProductoRepository ProductRepository { get; }
        IClienteRepository ClienteRepository { get; }
        IVendedorRepository VendedorRepository { get; }
        IFacturaRepository FacturaRepository { get; }


    }
}
