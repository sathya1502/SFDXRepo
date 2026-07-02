public  class SimpleServerDemo {
    
    @AuraEnabled
    public static string echoServer(string firstName){
        string str = 'Hello from the Server side of things, APEX '+ firstName;
        return str;
    }

}