public class AccountController {
    
    @AuraEnabled
    public static List<Account> getAccount()
    {
        List<Account> accList = [SELECT Id, Name, OwnerId FROM Account LIMIT 100];
        return accList;
    }

}