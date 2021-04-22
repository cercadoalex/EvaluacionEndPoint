using System.Data;
using System.Data.SqlClient;
using WebApi.UnitOfWork.Interface.UnitOfWork;

namespace WebApi.UnitOfWork.Core.UnitOfWork

{
    public class UnitOfWorkDapperAdapter : IUnitOfWorkAdapter
    {
        private readonly IDbConnection _context;
        private readonly IDbTransaction _transaction;

        public IUnitOfWorkRepository Repositories { get; set; }

        public UnitOfWorkDapperAdapter(string connectionPostgres)
        {
            _context = new SqlConnection(connectionPostgres);
            _context.Open();
            _transaction = _context.BeginTransaction();

            Repositories = new UnitOfWorkDapperRepository(_transaction);
        }


        public void Dispose()
        {
            if (_transaction != null)
            {
                _transaction.Dispose();
            }
            if (_context != null)
            {
                _context.Close();
                _context.Dispose();
            }
            Repositories = null;
        }

        public void SaveChange()
        {
            _transaction.Commit();
        }
    }
}
