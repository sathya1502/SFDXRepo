global class BatchAccountNumberUpdate implements Database.batchable<sObject>, Database.Stateful
{
    Integer accNum = 100000;
    global Database.queryLocator start(Database.BatchableContext BC)
    {
        string query =  'SELECT Id, AccountNumber FROM Account where AccountNumber = null LIMIT 100';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList)
    {        
        for(Account acc: accList)
        {
            if(acc.accountNumber == null)
            {
                acc.accountNumber = 'StateLess'+ String.valueOf(accNum);
                accNum++;
            }
        }
        update accList;
    }
    
    global void finish(Database.BatchableContext BC)
    {
        
    }

}