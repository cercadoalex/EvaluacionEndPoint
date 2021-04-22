using System;

namespace WebApi.UnitOfWork.Interface.UnitOfWork
{
    public interface IUnitOfWorkAdapter : IDisposable
    {
        IUnitOfWorkRepository Repositories { get; }
        void SaveChange();
    }
}
