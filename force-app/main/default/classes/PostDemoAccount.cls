@RestResource(urlMapping = '/PostDemoAccount/')
global class PostDemoAccount{    
    @httpPost
    global static string createAccountAndContact(AccountContactWrapper accConWrap){        
      Account accRecord = accConWrap.accList;
      Contact conRecord = accConWrap.conList;
        try{
            insert accRecord;
            conRecord.accountId = accRecord.Id;
            insert conRecord;
            return 'Account and Contact created successfully';
        }catch(exception e)
        {
            return e.getMessage();
        } 
    }    
    global class AccountContactWrapper{
        global Account accList;
        global Contact conList;
    }   
}