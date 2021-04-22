using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;

namespace WebApi.UnitOfWork.Interface.Repository
{
    public interface IVendedorRepository
    {
        IEnumerable<Vendedor> GetAllByYear();
    }
}
