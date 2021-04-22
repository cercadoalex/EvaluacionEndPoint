using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.ViewModel;

namespace WebApi.UnitOfWork.Interface.Repository
{
    public interface IFacturaRepository
    {
        IEnumerable<Factura> GetAllFacturasEmitidas();
        string Create(Factura factura);
    }
}
