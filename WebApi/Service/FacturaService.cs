using System.Collections.Generic;
using System.Data;
using WebApi.Entities;
using WebApi.UnitOfWork.Interface.UnitOfWork;
using WebApi.ViewModel;

namespace WebApi.Service
{
    public  class FacturaService
    {
        private readonly IUnitOfWork _unitOfWork;
        public FacturaService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public IEnumerable<Factura> GetAllFacturaSinEmitir()
        {
            using (var context = _unitOfWork.Create())
            {
                var result = context.Repositories.FacturaRepository.GetAllFacturasEmitidas();
                return result;
            }
        }
        public string  Create(FacturaViewModel factura)
        {
            using (var context = _unitOfWork.Create())
            {
                //Esto deberia ser en una modulo diferente, sepuede utilizar AutoMapper u otros...

                Factura factura1 = new Factura();
                factura1.Codigo = factura.Codigo;
                factura1.Serie = factura.Serie;
                factura1.Fecha = factura.Fecha;
                factura1.ClienteId = factura.ClienteId;
                factura1.VendedorId = factura.VendedorId;
                factura1.Moneda = factura.Moneda;
                factura1.FacturaDetalle = factura.FacturaDetalle;

                var result = context.Repositories.FacturaRepository.Create(factura1);
                return result;
            }
        }

    }
}
