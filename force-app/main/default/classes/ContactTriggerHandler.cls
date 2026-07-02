public class ContactTriggerHandler {
    
    public static void calculateContactsCount(list<Contact> conList)
    {
        set<Id> accIds = new set<Id>();
        List<Account> accList = new List<Account>();
        for(contact con:conList)
        {
            accIds.add(con.AccountId);
        }
        for(Account acc: [SELECT Id, Total_Contact__c, (SELECT Id from Contacts) FROM Account WHERE Id IN :accIds])
        {
            acc.Total_Contact__c = acc.Contacts.size();
            accList.add(acc);            
        }
        if(!accList.isEmpty())
            update accList;
        
    }

}