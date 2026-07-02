public class MyControllerExtension {
    Private Final Account acct;
   
    public string getGreeting()
    {
        return 'Hello ' + this.acct.name + ' ('+this.acct.Id+')';
   
    }
    public MyControllerExtension(ApexPages.StandardController stdController) {
    
     this.acct = (Account)stdController.getRecord();

    }

}