public class CreateOppTaskReminder implements Schedulable 
{
    public void execute(SchedulableContext sc)
    {
        List<Opportunity> oppList = [SELECT Id, Name,stageName, OwnerId, isClosed, CloseDate FROM Opportunity WHERE IsClosed = FALSE and CloseDate < TODAY];
        List<Task> taskToCreate = new List<Task>();
        for(Opportunity opp: oppList)
        {
            Task t = new Task();
            t.subject = 'The CloseDate is overdue, Please review immediately';
            t.OwnerId = opp.ownerId;
            t.Status = 'Not Started';
            t.whatId = opp.Id;
            taskToCreate.add(t);                
        }
        if(!taskToCreate.isEmpty())
        {
            Insert taskToCreate;
        }
        
    }

}