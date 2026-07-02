public class AccountUtility {

    public void createSingleAccount(string accName, string accBillingCity)
    {
        Account accToInsert = new Account(name=accname, billingcity=accBillingCity);
        Insert accToInsert;
        system.debug('Single Account Inserted Suuccessfully '+accToInsert.Id);
    }
    
    public void createMultipleAccounts(Integer countOfAccts, String nameTemplate)
    {
        List<Account> accListToInsert = new List<Account>();
        for(integer i=1;i<=countOfAccts;i++)
        {
            Account acc = new Account(name = nameTemplate+i, billingCity = 'Bengaluru');
            accListToInsert.add(acc);
        }
        Insert accListToInsert;
    }
    public void UpdateSingleAccount(string accName, string APIFieldName, integer fieldValue)
    {
        List<Account> accList = [Select Id, Name, AnnualRevenue from Account where name =: accName];
        
        
        if(accList.size()>0)
        {
            Map<Id, Account> accMap =  new Map<Id, Account>(accList);
            Account acc = accMap.get(accList[0].Id);
            acc.put(APIFieldName, fieldValue);
            update acc;
        	system.debug('Succesfully Updated 1 Account!!!');
        	system.debug('Id: '+acc.Id +' APIFieldName: ' + APIFieldName +' FieldValue: ' +fieldValue);
        }
        
    }
    

}