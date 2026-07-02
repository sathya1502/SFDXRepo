public class AccountTriggerManager {
    
    public static void beforeInsert(List<Account> accList){
        AccountHelper.populateRating(accList);        
    }
}