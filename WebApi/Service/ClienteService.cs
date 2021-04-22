using System.Collections.Generic;
using System.Data;
using WebApi.Entities;
using WebApi.UnitOfWork.Interface.UnitOfWork;

namespace WebApi.Service
{
    public  class ClienteService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ClienteService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public IEnumerable<Cliente> GetAllFacturaSinEmitir()
        {
            using (var context = _unitOfWork.Create())
            {
                var result = context.Repositories.ClienteRepository.GetAllFacturaSinEmitir();
                return result;
            }
        }


    }
}
