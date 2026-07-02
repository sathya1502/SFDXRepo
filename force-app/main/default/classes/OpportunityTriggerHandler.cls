public class OpportunityTriggerHandler {
    
    public static void validateAmount(List<Opportunity> oppList)
    {
       for(Opportunity opp: oppList)
       {
           if(opp.Amount == null)
           {
               opp.addError('The opp should have amount present');
           }
       }
    }


}