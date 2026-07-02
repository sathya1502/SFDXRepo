public class ApexScenarios {
    
    public static void scenario1()
    {
        List<Account> accList = [SELECT Id, Name, Total_Contact__c, (SELECT Id FROM Contacts) FROM Account WHERE phone!=null];
        
        for(Account acc: accList)
        {
            system.debug('The Account '+ acc.name +' has '+ acc.Contacts.size() + ' contacts');
            acc.Total_Contact__c = acc.Contacts.size();
         }   
        update accList;
    }
    
    public static void scenario2()
    {
        
        List<Account> accList1 = [SELECT Id, Name, (SELECT Id, Amount from Opportunities) FROM Account WHERE phone!=null];
        
        If(accList1.size()>0)
        {
            for(Account acc:accList1)
        	{
                decimal total = 0;
            	for(Opportunity opp: acc.Opportunities)
            	{  
                    try{
                		total= total+opp.Amount;
                        system.debug('The Account '+ acc.Name + ' has ' + total +' worth opportunities');
                    }
                    catch(exception e)
                    {
                         system.debug('Error: ' + e.getMessage()+ 'Errored Out Details: ' + acc.name +' OppId: ' +opp.Id + ' OppAmount: ' +opp.amount);
                    }
                       
           		}            
        	}
   		}
    }
    public static void scenario3() //query all opps created this year and update description based on StageName
    {
        List<Opportunity> oppList = [SELECT Id, Name, StageName, Description, isClosed FROM Opportunity WHERE CreatedDate = THIS_YEAR];
        for(Opportunity opp: oppList)
        {
            try{
                 if(opp.IsClosed == true)
            		opp.description = 'Opportunity is '+ opp.StageName; 
            	else
                	opp.Description = 'Opportunity is Open';                
               }
            Catch(exception e){
                system.debug('ERROR!: ' + e.getMessage() + ' Opp Details: '+opp.ID);
            }
            
           
        }
        update oppList;
    }

}