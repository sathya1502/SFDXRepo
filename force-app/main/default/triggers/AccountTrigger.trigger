trigger AccountTrigger on Account (after insert, before delete, before insert, before update, after update) 
{
	system.debug('Account Trigger');
   	if(Trigger.isInsert)
    {
        if(Trigger.isBefore)
        {
            /*AccountTriggerHandler.updateAccountInfo(Trigger.new);
            AccountTriggerHandler.populateRating(Trigger.new, null);
            AccountTriggerHandler.invocationCheck(Trigger.new);*/
            AccountTriggerManager.beforeInsert(Trigger.new);

        }
        if(Trigger.IsAfter)
        {            
            AccountTriggerHandler.createContactOnAccountCreation(Trigger.new); 
            AccountTriggerHandler.createOppOnAccountCreation(Trigger.new);
      	}
        system.debug('Inside is Before');
        
    }
    //checking for Update Events
    if(Trigger.isUpdate)
    {
        if(Trigger.isBefore)
        {
            //methods to call for before update
            AccountTriggerHandler.populateDescription(Trigger.new, Trigger.oldMap);
            /*AccountTriggerHandler.populateRating(Trigger.new, Trigger.oldMap);*/
           
        }
        if(Trigger.isAfter)
        {
            AccountTriggerHandler.populateContactPhone(Trigger.new, Trigger.oldMap);
            if(!PreventRecursion.firstCall)
            {
                PreventRecursion.firstCall = TRUE;
                AccountTriggerHandler.recursionDemo(Trigger.new,Trigger.oldMap);
            }
            
        }    
          
    }
    if(Trigger.isDelete)
    {
        if(Trigger.isBefore)
        {
           // AccountTriggerHandler.preventDeletionIfContactPresent(Trigger.old);
           // AccountTriggerHandler.preventDeletionOnCustomerAccount(Trigger.old);
        }
    }
    
    
}