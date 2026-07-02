@isTest 
public class TemperatureConvertorTest {
    
    @isTest public static void checkfahrenheitToCelsius()
    {
        Decimal result = TemperatureConvertor.fahrenheitToCelsius(100);
        system.assertEquals(37, result);
    }

}