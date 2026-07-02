public class thisDemo {
    string greeting='Class';
    integer num=5;
	public void display(string greeting)
    {
        //this.greeting = greeting; //class level greeting <-- method param greeting
        system.debug('This is class level variable ' +this.greeting);
        system.debug('This is a local variable '+greeting);
    }
    
    public static void area(integer num)
    {
     	integer squareNum = num*num;
        system.debug('The square number for '+num +'is: '+ num);
    }
}