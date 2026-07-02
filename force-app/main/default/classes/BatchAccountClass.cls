// Anonymous Window: Id jobId = Database.executebatch(new BatchAccountClass(), 50);
global class BatchAccountClass implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        system.debug('Inside Start');
        string query = 'SELECT Id, Name, BillingCity, BillingState, BillingCountry, BillingStreet FROM Account where BillingCity = null OR BillingState = null OR BillingCountry = null OR BillingStreet = null';
        
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList)
    {
        system.debug('Inside Execute');
        for(Account acc: accList)
        {
            if(acc.billingCountry == null)
                acc.billingCountry = 'India';
            if(string.IsBlank(acc.billingState))
                acc.billingState = 'Karnataka';
            if(string.isBlank(acc.billingCity))
                acc.billingCity = 'Bangalore';
        }
        update accList;
    }
    
    global void finish(Database.BatchableContext BC)
    {
        system.debug('Inside Finish');
    }
    
    
    

}