public class DynamicApexDemo {
    
    public static void displayRequiredFieldsOnOpportunity()
    {
        //will have all objects
    	Map<String, Schema.sObjectType> m = Schema.getGlobalDescribe();
        //get for specific object: Opportunity 
        Schema.sObjectType opp = m.get('Opportunity');
        //Describe Opportunity
        Schema.DescribeSObjectResult descOpp  =opp.getDescribe();
        Map<String, Schema.SObjectField> fields = descOpp.fields.getmap();
        List<String> requiredFields = new List<String>();
        for(String f: fields.keySet())
        {
           Schema.DescribeFieldResult descField =  fields.get(f).getDescribe();
            if(descField.isCreateable() && !descField.isNillable() && !descField.isDefaultedOnCreate())
            {
                requiredFields.add(f);
            }
        }
        system.debug('The Required Fields on Opp are: '+requiredFields);       
    }
    
    public static void fetchTabsOnSpecificApps()
    {
        List<Schema.DescribeTabSetResult> tabSetDesc = Schema.describeTabs();
        for(Schema.DescribeTabSetResult res: tabSetDesc)
        {
            String appLabel = res.getLabel();
            if(appLabel == 'Sales')
            {
                List<Schema.DescribeTabResult> tabDesc = res.getTabs();
                system.debug('-----------Tabs associated with Sales Application----------');
                for(Schema.DescribeTabResult tab: tabDesc)
                {
                    system.debug('Label: '+tab.getLabel());
                }
            }
        }
    }
    
    public static void fetchChildRelationsipsForAccounts()
    {
        integer count = 0;
        Schema.DescribeSObjectResult   describeresult = Account.SObjectType.getDescribe();
        //it gives Account  object properties or describe results;
        List<Schema.ChildRelationship>   lstchildrelationships =describeresult.getChildRelationships();
        //It gives you all the childrelationships associated with the account.To get relationship names from the above list;
        for(Schema.ChildRelationship relname:lstchildrelationships)
        {
            if(relname.getrelationshipname()!=null)
            {
				System.debug('Relationshipname:'+relname.getrelationshipname());  
                count++;
            }
            	
        }
        system.debug('No. of Child Objects for Account:' +count);
    }
    
    Public Static void displayAccountFields()
    {
        Schema.DescribeSObjectResult a_desc = Account.sObjectType.getDescribe(); 
        //for the Account object, you can replace that with any object you have, standard or custom
        Map<String, Schema.SObjectField> a_fields = a_desc.fields.getMap();
        for(Schema.sObjectField fld:a_fields.values()){ 
            system.debug(fld);
        }
    }
    
    Public Static void displaySchemaDetails()
    {
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().values(); //will hold the list of objectNames
        system.debug('outside:'+gd);
        
        //iterating through the list of object names and displaying
        for(Schema.SObjectType so: gd) 
        {
            system.debug('Fields Associated with '+so.getDescribe().getName()+' Object are: ');
            
            // retrieves the list of fields associated with sObject
            system.debug(so.getDescribe().fields.getMap().values()); 
        }
        
    }
    
}