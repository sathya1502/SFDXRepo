public class OppAuraController {
    
    @AuraEnabled
    public static List<Opportunity> getOpportunities(){
        return [SELECT Id, Name, Owner.name FROM Opportunity LIMIT 10];
        
    }

}