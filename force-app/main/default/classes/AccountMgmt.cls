@restResource(urlMapping = '/Accounttest/*')
global class AccountMgmt {
    
    @httpDelete
    global static string deletAccount()
    {
        Map<String, String> accMap = RestContext.request.params;
        List<Account> accList = [SELECT Id FROM Account WHERE Id =:accMap.get('accId')];
        try{
            delete accList;
            return 'Deletion Successful';
        }catch(exception e){
            return e.getMessage();
        }
    }    

    @httpPost
    global static string createAccount(string accName, string accRating, string accIndustry, string accActive)
    {
        Account acc = new Account();
        acc.Name = accName;
        acc.Rating = accRating;
        acc.Industry = accIndustry;
        acc.Active__c = accActive;
        
        try{
            insert acc;
            return 'Account Created Successfully';
        }catch(exception e)
        {
            return e.getMessage();
        }
        
    }
    
    @httpGet
    global static AccountWrapper getTop10Accounts()
    {
        Map<String, String> fieldMapping = RestContext.Request.params;
        //string industryValue = fieldMapping.get('Industry');
        
        List<Account> accList = [SELECT Id, Name, Rating, Industry, AnnualRevenue FROM Account WHERE AnnualRevenue != null Order By AnnualRevenue Desc LIMIT 10];
        Map<Id,Account> accMap = new Map<Id,Account>(accList);
        List<Contact> conList = [SELECT Id, firstName, lastName, Email, Phone FROM Contact WHERE AccountId in: accMap.keySet()];
        List<Case> caseList = [SELECT id, CaseNumber, Priority FROM Case WHERE AccountId in: accMap.keySet()];
        
        AccountWrapper accWrapper = new AccountWrapper();
        accWrapper.accList = accList;
        accWrapper.conList = conList;
        accWrapper.caseList = caseList;
        
        return accWrapper;
       
    }    
    global class AccountWrapper{
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        List<Case> caseList = new List<Case>();
    }
}