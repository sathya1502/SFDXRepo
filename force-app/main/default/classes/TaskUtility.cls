public class TaskUtility {
    
    public static string getPriority(string LeadCountry)
    {
        string taskPriority;
        if(String.IsBlank(LeadCountry) || LeadCountry.length()>2)
            return null; 
      	if(LeadCountry == 'US')
        {
            taskPriority = 'High';
        }
        else
        {
            taskPriority = 'Normal';
        }
        return taskPriority;
    }

}