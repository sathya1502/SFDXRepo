public class OppController 
{

    public ApexPages.StandardSetController opps
    {
    get{
        if(opps == null)
        {
            opps = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Name, CloseDate FROM Opportunity]));
        }
       return opps;
       }     
       set; 
    }   

    public List<Opportunity> getOppList() 
    {
        return (List<Opportunity>)opps.getRecords();
    }

}