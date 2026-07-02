public class SOQLDemo {
    
    public void parentToChild()
    {
        List<Account> accList = [SELECT Id, name, (SELECT Id, Firstname, LastName from Contacts) 
                                 FROM Account WHERE rating = 'hot'];
        for(Account acc: accList)
        {
           for(Contact con: acc.Contacts)
           {
               system.debug('The Contact '+con.firstname +' ' +con.lastName+ ' belongs to ' +acc.Name);
           }
           
        }
    }
    public void queryDemo()
    {
        //Aggregate Functions
        AggregateResult[] sumAmount = [SELECT Count(Amount) oppCount, AccountId FROM Opportunity GROUP BY AccountId HAVING SUM(Amount)>0];
        system.debug('The count of opps with amount>0: '+sumAmount);
        for(AggregateResult agr: sumAmount)
        {
            system.debug(agr.get('AccountId') + ' ' +agr.get('oppCount'));
        }
    }

}