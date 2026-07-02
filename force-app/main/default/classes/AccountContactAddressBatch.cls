public class AccountContactAddressBatch implements Database.Batchable<sObject>
{
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
      string query = 'SELECT Id, billingCountry, billingState, billingCity FROM Account';
      return Database.getQueryLocator(query);  
    }
    
    public void execute(Database.BatchableContext bc, List<Account> accList)
    {
        Map<Id, Account> accMap = new Map<Id, Account>(accList);
        List<Contact> conList = [SELECT Id, AccountId, mailingCity, mailingState, mailingCountry FROM Contact where AccountId in: accMap.keySet()];
        for(Contact con: conList)
        {
           if(accmap.ContainsKey(con.accountId))
           {
               if(con.MailingCity == null &&  accMap.get(con.accountId).billingCity!= null )
                   con.MailingCity = accMap.get(con.accountId).billingCity;
               if(con.MailingState == null && accMap.get(con.accountId).billingState != null)
                   con.MailingState = accMap.get(con.accountId).billingState;
               if(con.MailingCountry == null && accMap.get(con.accountId).billingCountry != null)
                   con.MailingCountry =  accMap.get(con.accountId).billingCountry;
           }           
        }
        update conList;	
    }
    
    public void finish(Database.BatchableContext bc)
    {
        
    }

}