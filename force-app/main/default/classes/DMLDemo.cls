public class DMLDemo {
    
    public void updateDemo()
    {    
    List<Account> accList = new List<Account>();
    accList =  [SELECT Id, Name, AnnualRevenue, Site FROM Account WHERE Rating = 'Hot'];
    
    if(!accList.isEmpty())
    {
        for(Account acc: accList)
        {
            acc.Site= 'Sathya';
        }
        Update accList;
    }
   }
}