namespace WebApi.UnitOfWork.Interface.UnitOfWork
{
    public interface IUnitOfWork
    {
        IUnitOfWorkAdapter Create();
    }
}
