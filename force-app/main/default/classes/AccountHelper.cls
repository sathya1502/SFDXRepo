public class AccountHelper {
    
    public static void populateRating(List<Account> accList){
        for(Account acc: accList){
            if(acc.Industry == 'Banking'|| acc.Industry == 'Finance'){
                acc.Rating = 'Cold';
            }
        }
        
    }

}