trigger ContactTrigger on Contact ( after delete, after undelete) {
    
    if(Trigger.isDelete)
    {
        if(Trigger.isAfter)
        {
            ContactTriggerHandler.calculateContactsCount(Trigger.old);
                
        }
    }
    if(Trigger.isUndelete)
    {
        if(Trigger.isAfter)
        {
            ContactTriggerHandler.calculateContactsCount(Trigger.new);
        }
    }

}