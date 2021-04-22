using Microsoft.Extensions.Configuration;
using WebApi.UnitOfWork.Interface.UnitOfWork;

namespace WebApi.UnitOfWork.Core.UnitOfWork

{
    public class UnitOfWorkDapper : IUnitOfWork
    {
        private readonly IConfiguration _configuration;
        public UnitOfWorkDapper(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public IUnitOfWorkAdapter Create()
        {
            var connection = _configuration.GetConnectionString("Conection");
            return new UnitOfWorkDapperAdapter(connection);

        }
    }
}
