@isTest
private class TaskUtilityTest {
    @isTest public static void getPriorityNormalTest()
    {
        String au = TaskUtility.getPriority('AU');
        system.assertEquals('Normal',au);
    }
    
    @isTest public static void getPriorityHighTest()
    {
        String us = TaskUtility.getPriority('US');
        system.assertEquals('High', us);
    }
	@isTest public static void getPriorityInvalidTest()
    {
        String notValid = TaskUtility.getPriority('Inv');
        system.assertEquals(null, notValid);
    }
}