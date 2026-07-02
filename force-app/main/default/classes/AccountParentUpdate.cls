public class AccountParentUpdate implements Queueable {
    
    private List<Account> accList;
    private Account parAcc;   
    
    public AccountParentUpdate(List<Account> accList, Account parentAcc)
    {
        this.accList = accList;
        parAcc = parentAcc;
    }
    
    public void execute(QueueableContext context)
    {
        for(Account acc:accList)
        {
            if(acc.ParentId == null)
            {
                acc.ParentId = parAcc.Id;
            }                
        }
        Update accList;
    }


}