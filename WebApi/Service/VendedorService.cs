using System.Collections.Generic;
using System.Data;
using WebApi.Entities;
using WebApi.UnitOfWork.Interface.UnitOfWork;

namespace WebApi.Service
{
    public  class VendedorService
    {
        private readonly IUnitOfWork _unitOfWork;
        public VendedorService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public IEnumerable<Vendedor> GetAllFacturaSinEmitir()
        {
            using (var context = _unitOfWork.Create())
            {
                var result = context.Repositories.VendedorRepository.GetAllByYear();
                return result;
            }
        }


    }
}
