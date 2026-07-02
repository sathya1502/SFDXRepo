public class DatabaseDemo {
   
    
    public void demo(){
    List<Contact> conList = new List<Contact>{ 
        new contact(firstName = 'Sathya', lastName = 'Rupa', MobilePhone = '9086460395', Phone ='9086460395', email = 'test@test.com'),
        new contact(firstName = 'Sathya', lastName = 'Rupa1', MobilePhone = '9086460395', Phone ='9086460395', email = 'test@test.com'),
        new contact(firstName = 'Sathya', lastName = 'Rupa2', MobilePhone = '9086460395', Phone ='9086460395', email = 'test@test.com'),
        new contact()      
  };
  Database.saveResult[] insertConList = Database.insert(conList, False); //Insert conList
        
   for(Database.SaveResult dbs:insertConList)
   {
       if(dbs.isSuccess())
           system.debug('successfully Inserted'+dbs.getId());
       else
       {
           for(DataBase.Error err: dbs.getErrors() )
           {
               system.debug('The error details are: '+ err.getStatusCode()+ ' ' + err.getMessage());
               system.debug('The field errored out is: '+err.getFields());
           }
       }
   }
}
}