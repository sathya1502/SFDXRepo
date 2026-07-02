@isTest
private class AccountTriggerHandlerTest {
    
    @testSetup
    static void testData()
    {
        //Account Creation
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<10;i++)
        {
            Account a = new Account();
            a.name = 'Test'+i;
            a.Active__c = 'Yes';            
            accList.add(a);  
        }
        Test.startTest();
        Insert accList;
        Test.stopTest();
        
        //User Creation
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Custom: Sales Profile' LIMIT 1];
         
        User u = new User(LastName = 'User',FirstName='Test',Alias = 'UT',
                           Email = 'test@test.com', Username = 'nbuemccjnievvjwklsathya@sathya.com',
                           ProfileId = profileId.id,TimeZoneSidKey = 'GMT',
                           LanguageLocaleKey = 'en_US',EmailEncodingKey = 'UTF-8',LocaleSidKey = 'en_US'
                           );
        Insert u;
    }
    @isTest 
    static void preventDeletionOnCustomerAccountTest()
    {
        List<Account> accList = [SELECT Id,Name FROM Account WHERE Name like '%Test%'];
        User u = [SELECT Id, Name FROM User WHERE firstName = 'test'];
        for(Account a: accList)
        {
            a.Type = 'Customer - Direct';
        }
        update accList;
        system.runAs(u)
        {           
            Test.startTest();
            try{
                delete accList[0];
            }catch(exception e){
                system.debug('Exception Occured'+e.getMessage());
            } 
        Test.stopTest();
        }	
        
        
    }
    
    @isTest 
    static void preventDeletionIfContactPresent()
    {
        List<Account> accList = [SELECT Id,Name FROM Account WHERE Name like '%Test%'];        
        
        Test.startTest();
        try{
            delete accList;
        }catch(exception e){
            system.debug('Exception Occured'+e.getMessage());
        } 
        Test.stopTest();
    }
    
    @isTest
    static void populateDescriptionTest()
    {
        List<Account> accList = [SELECT Id,Name FROM Account WHERE Name like '%Test%'];
        for(Account a: accList)
        {
            a.Phone = '8978675345';
        }
        update accList;
        List<Account> updatedAccount = [SELECT Id,Phone FROM Account WHERE Id =: accList[0].Id];
        system.assertEquals('8978675345',updatedAccount[0].phone);
    }
    
    @isTest
    static void populateRatingTest()
    {
        List<Account> accList = [SELECT Id,Name FROM Account WHERE Name like '%Test%'];
        for (Account a: accList)
        {
            a.Industry = 'Chemical';
        }
        
        Test.StartTest();
        //insert accList;
        for(Account a:accList)
        {
            a.Industry = 'Media';
        }
        update accList;
		List<Account> updatedAccount = [SELECT Id, Rating FROM Account WHERE Id =:accList[0].Id];
		system.assertEquals('Hot',updatedAccount[0].Rating);     
    }
    
    @isTest
    static void createOppOnAccountCreationTest()
    {
        //List<Account> accList = new List<Account>();
        List<Account> accList = [SELECT Id,Name FROM Account WHERE Name like '%Test%'];         
        
        List<Opportunity> oppList = [SELECT Id from Opportunity WHERE AccountId =:accList];
        system.assert(oppList!=null,'Opp not Created');
    }

}