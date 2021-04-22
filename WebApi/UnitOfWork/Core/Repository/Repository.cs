using System.Data;

namespace WebApi.UnitOfWork.Core.Repository
{
    public abstract class Repository
    {
        protected IDbTransaction Transaction { get; private set; }
        protected IDbConnection Connection { get { return Transaction.Connection; } }

        public Repository(IDbTransaction transaction)
        {
            Transaction = transaction;
        }



    }
}
