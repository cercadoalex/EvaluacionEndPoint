using System.Collections.Generic;
using System.Data;
using WebApi.Entities;
using WebApi.UnitOfWork.Interface.UnitOfWork;

namespace WebApi.Service
{
    public  class ProductoService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ProductoService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public IEnumerable<Producto> GetAll()
        {
            using (var context = _unitOfWork.Create())
            {
                var result = context.Repositories.ProductRepository.GetAll();
                return result;
            }
        }





    }
}
