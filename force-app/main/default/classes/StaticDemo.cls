public class StaticDemo {
    
    static Integer num1 = 10;
    Integer num2 = 20;
    
    public static void method1()
    {
        system.debug('This is a static methos: num1: ' +num1);
        //system.debug('This is a static methos: num2: ' +num2); --> This is not allowed since num2 is Non-Static member
    }
    public void method2()
    {
        system.debug('This is a non-static methos: num1: ' +num1);
        system.debug('This is a non-static methos: num2: ' +num2);
    }

}