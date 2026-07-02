public class ExceptionHandlingDemo {
    public static void dmlMethodExceptionDemo()
    {
        Account[] accList = new List<Account>();
        try{
          
        	Account a1 = new Account(name = 'My Fault London');
            Account a2 = new Account();
            Account a3 = new Account();
            
            accList.add(a1); accList.add(a2); accList.add(a3);
            Insert accList;
            
        }
        catch(exception e){  
            system.debug('No. of Errored Records '+e.getNumDML());
            for(integer i=0; i<e.getNumDML();i++)
            {
                system.debug('Error on Field: '+e.getDMLFieldNames(i));
                system.debug('Error on Id: '+e.getDMLId(i));
                system.debug('Error Message: '+ e.getDMLMessage(i));
            }
        }
    }
    
    public static void exceptionMethodDemo(){
        try{
            Account acc = [SELECT Name FROM Account LIMIT 1];
            string accDesc = acc.description;            
        }
        catch(exception e){
            system.debug('Error Type: '+e.getTypeName());
            system.debug('Error Message: ' +e.getMessage());
            system.debug('Error Stack Trace: '+ e.getStackTraceString());
            system.debug('Error Cause:'+e.getCause());
            system.debug('Error Line Number: '+e.getLineNumber());
        }
      
        
    }
    public static void sObjectExceptionDemo(){
        try{
            Account acc = new Account(Name = 'Sete');
            Insert acc;
            Account a = [SELECT Name FROM Account WHERE Id =:acc.Id];
            String s = a.Description; //sObjectException 
            system.debug('Testing sObject Exceptions' +a);            
        }
        catch(SObjectException e)
        {
            system.debug('Error occured: '+e.getMessage());
        }
           
    }
    
    public static void nullPointerExceptionDemo(){
        String s ='satz';
        Boolean b;
        try{
            system.debug(' inside TRY 1');
            b = s.contains('abc');
            system.debug(' inside TRY 2');
        }
        catch(exception e){
            system.debug('Error Occured '+e.getMessage());
        }
    }
    public static void listExceptionDemo()
    {
        List<Integer> li = new List<Integer>();
        Integer first;
        Integer check;
        try{
            li.add(15);
            li.add(30);
            first = li[0];
            check = li[6]; //System.ListException: List index out of bounds: 6
        }
        Catch(ListException le)
        {
            system.debug('List Exception has occured: '+le.getMessage());
        }
        system.debug('The element at 0th index is: '+first);
        system.debug('The element at 6th index is: '+check);
        
    }
    public static void dmlExceptionDemo()
    {
        try{
            lead l = new lead();
        	insert l;
        }
        catch(DMLexception e)
        {
           system.debug('Exception Occured: '+e.getMessage());
           system.debug('In catch block');
        }
        
        system.debug('Trying to insert the lead record');
    }

}