public class AccountUtils {
    
    public static void mainProcessing()
    {
        try{
            system.debug('inside TRY');
            insertAccount();
        }
        catch(AccountException ae)
        {
            system.debug('Error Message:'+ae.getMessage());
            system.debug('Error Line Number'+ ae.getLineNumber());
            system.debug('Error Cause:'+ae.getCause());
        }
    }
    public static void insertAccount()
    {
        try
        {
            Account acc = new Account();
            insert acc;
        }catch(exception e)
        {
            throw new AccountException('Account cannot be created without required fields',e);
        }
    }
}