public class AccountTriggerHandler {
    
    public static void invocationCheck(List<Account> accList)
    {
        if(Trigger.isExecuting)
            system.debug('Executed through APEX Class');
        else
            system.debug('Invocation: elsewhere');
    }
    public static void createOppOnAccountCreation(List<Account> accList)
    {
        list<Opportunity> oppList = new list<Opportunity>();
        for(account acc: accList)
        {
            Opportunity o = new Opportunity();
            o.name = Acc.Name + ' Renewal';
            o.stageName = 'Qualification';
            o.CloseDate = date.Today();
            o.Amount = 100;
            o.AccountId = acc.id;
            oppList.add(o);
        }
        Database.Saveresult[] srList = database.Insert(oppList, false);
        for(integer i=0;i<srList.Size();i++)
        {
            if(!srList[i].isSuccess())
            {
                string errors = '';
                for(Database.Error err: srList[i].getErrors())
                {
                    errors += err.getMessage();
                }
                accList[i].addError(errors);
            }
        }
        
        
    }
    public static void recursionDemo(List<Account> accList, Map<Id,Account> oldMap)
    {
        list<Account> acctList = new list<Account>();
        
        for(Account acc: accList)
        {
            account acct = new account();
            acct.Id = acc.id;
            acct.description += 'Recursion test';
            acctList.add(acct);
        }
        update(acctList);
    }
    
    public static void preventDeletionOnCustomerAccount(List<Account> oldList)
    {
        Profile runningUserProfile = [SELECT Id FROM Profile WHERE Name = 'System Adminstrator'];
        for(Account acc: oldList)
        {
            If((UserInfo.getProfileId() != runningUserProfile.Id) && (acc.Type == 'Customer - Direct' || acc.Type == 'Customer - Direct'))
            {
                acc.addError(label.Prevent_Account_Deletion);
            }
        }
    }
    
    public static void preventDeletionIfContactPresent(List<Account> oldList)
    {
        system.debug('Inside isDelete');
            set<Id> AccIds = new set<Id>();
            for(Account acc:oldList) // .old retrieves the acc right before the deletion
            {
                system.debug('AccountIds: '+ acc.Id);
                AccIds.add(acc.Id);
            }
            Map<Id, Account> accMap = new Map<Id, Account>([SELECT Id, Name, (SELECT Id FROM Contacts) FROM Account WHERE Id in :AccIds]);
            List<Account> accList = [SELECT Id, Name, (SELECT Id FROM Contacts) FROM Account WHERE Id in :AccIds];
            for(Account acc:oldList)
            {
                system.debug('Contact Size: '+accMap.get(acc.Id).Contacts.size());
                if(accMap.get(acc.Id).Contacts.size() > 0)
                    acc.addError('This Account cannot be deleted, It has contacts associated w it');
            }
    }
    public static void populateContactPhone(List<Account> accList, Map<Id,Account> accOldMap)
    {
        List<Contact> contList = new List<Contact>(); //created to hold the contact value and perform DML Op as DML will only work on Lists
        Map<Id,Account> accMap = new Map<Id, Account>(); //to hold the Account Details on which the phone number is changed
        for(account acc: accList)
        {
            if(acc.Phone != accOldMap.get(acc.Id).Phone) //phone number is updated
            {
                accMap.put(acc.Id, acc);
            }
        }
        for(contact con:[SELECT Id, AccountId, HomePhone from Contact where AccountId in :accMap.keySet()])//keySet - first paramter in the map
        {
            if(accMap.containsKey(con.AccountId)) //if con.accountId is present in the accMap Key
            {
                con.HomePhone = accMap.get(con.AccountId).Phone;
                contList.add(con);
            }
        }
        if(contList.size()>0)
        	update contList;
    }
    
    
    
    /*public static void populateRating(list<account> accList, Map<Id,Account> accMap)       
    {
         
         for(Account acc: accList)
         {
             if((accMap == null && acc.Industry == 'Media') //accMap = null for Insert Op
                || (accMap!= null && accMap.get(acc.Id).Industry!= acc.Industry && acc.Industry == 'Media'))//update op check
             {
              	acc.Rating = 'hot';
             	system.debug('Insert Account'+ acc.Id);
             }
         }                    
    }*/
    
    public static void populateDescription(List<Account> newAccList, Map<Id,Account> oldAccMap)
    {
        for(account acc: newAccList)
        {
            system.debug('in for');
            if(acc.Phone != oldAccMap.get(acc.id).Phone) //Check for phone number change
            {
                String dtNow = DateTime.Now().format();
                acc.Description += '\n'  + dtNow +' Phone is Updated: Old Value: '+ oldAccMap.get(acc.Id).phone + ' New Value: '+acc.Phone;
                system.debug('Description Update');
            }
        }
        //update  newAccList; -> NOT VALID
    }
    public static void createContactOnAccountCreation(List<Account> accList)
    {
        List<Contact> conToInsert = new List<Contact>();     
        for(Account acc: accList) //Trigger.new: is a list that holds newly inserted accounts
   		 	{
                Contact con = new Contact();
                con.FirstName = 'Dummy';
                con.LastName = acc.Name;
                con.AccountId = acc.Id;
                con.MailingCity = acc.BillingCity;
                con.MailingCountry = acc.BillingCountry;
                conToInsert.add(con);
    		}
    		Insert conToInsert;
    }
    public static void updateAccountInfo(List<Account> accList)
    {
        for(Account acc: accList)
            {
                if(!accList.isEmpty())
                {
                    acc.Description = 'Before Insert Trigger';
                    if(String.isBlank(acc.BillingCountry))
                        acc.BillingCountry = 'USA';
                    if(String.isBlank(acc.BillingCity))
                        acc.BillingCity = 'Dallas';
                    if(String.isBlank(acc.BillingState))
                        acc.BillingState = 'Texas';
                    
                }
               
               
            }
    }
    
}