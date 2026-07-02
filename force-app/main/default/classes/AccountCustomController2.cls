public class AccountCustomController2 {

   
    public PageReference Save()
    {
        try{
            upsert(account);
        }catch(exception e)
        {
            apexPages.addMessages(e);
        }
        PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
        return redirectSuccess;
    }
    

    public Account account {get; private set;}
    
    public accountCustomController2()
    {
        Id Id = ApexPages.CurrentPage().getParameters().get('Id');
        account = (Id==null)?new Account():[SELECT Id, Name, Active__c, Site FROM Account WHERE Id=:Id];
    }
}