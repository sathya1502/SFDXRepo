public class Calculator {
    
	public integer addition(integer a, integer b)
	{
    	return a+b;
	}
	public integer subtract(integer a, Integer b)
    {
        if(a>b)
            return a-b;
        else
            return b-a;
    }
    public integer multiply(integer a, integer b)
    {
        return a*b;
    }
    public integer divide(integer a, integer b)
    {
        if(a>b)
            return a/b;
        else
            return b/a;
        
    }
    public void result(integer a, integer b)
    {
       integer addResult = addition(a,b);
       integer subResult = subtract(a,b);
       integer mulResult = multiply(a,b);
       integer divResult = divide(a,b);
       Map<String, Integer> resultMap = new map<string, Integer>();
       resultMap.put('Addition',addResult);
       resultMap.put('Subtraction',subResult);
       resultMap.put('Multiplication',mulResult);
       resultMap.put('Division',divResult);
       system.debug('The Calculated Values of '+a+ ' and '+b+ 'are: '+resultMap);     
       
    }

}