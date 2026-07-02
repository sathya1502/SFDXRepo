public class AuraControllerAccount {
    
    @AuraEnabled
    public static List<Account> getAccount(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name FROM Account LIMIT 10];
        system.debug('acc###'+accList);
		return accList;        
    }

}