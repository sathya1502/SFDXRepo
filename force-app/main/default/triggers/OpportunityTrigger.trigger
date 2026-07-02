trigger OpportunityTrigger on Opportunity (before insert) {
    
    If(Trigger.isInsert)
    {
        If(Trigger.isBefore)
        {
            OpportunityTriggerHandler.validateAmount(Trigger.New);
        }
    }
}