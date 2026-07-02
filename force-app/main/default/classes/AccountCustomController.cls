public class AccountCustomController {

    public Account acc;
    
    public PageReference CustomSave() 
    {
        update acc;
        return null;
    }
    
    public accountCustomController()
    {
        acc = [SELECT Id, Name, Site FROM Account WHERE Id =: apexPages.currentPage().getParameters().get('Id') ];
    } 
    
    public account getAccount() 
    {        
        return acc;
    }


  
}