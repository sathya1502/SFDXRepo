public class CreateContacts implements Queueable{
    
    private List<Account> accList;
    public createContacts(List<Account> accList)
    {
        this.accList = accList;
    }
    
    public void execute(QueueableContext qc)
    {
        List<Contact> conList = new List<Contact>();
		for(Account acc: accList)
        {
            Contact con = new Contact();
            con.FirstName = 'Sathya';
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            conList.add(con);
        }
        insert conList;
    }
    
    

}