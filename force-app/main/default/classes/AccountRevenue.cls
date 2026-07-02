public with sharing class AccountRevenue{
    @AuraEnabled(cacheable=true)   
    public static List<Account> getTopRevenueAccounts(){
        try{
            return [SELECT Id, Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC NULLS LAST LIMIT 5 ];
        }
        catch(exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
   public  static List<Account> getTopRevenueAccountDynamic(integer n){
     try{
        return [SELECT Id, Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC NULLS LAST LIMIT :n];
     }
     catch(Exception e){
         throw new AuraHandledException(e.getMessage());
     }

   }

   public static void checkMetho(){
    string str;
    str.capitalize();

   }
}

