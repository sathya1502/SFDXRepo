public class TemperatureConvertor {
    
    public static decimal fahrenheitToCelsius(integer n)
    {
        decimal fTemp = (n-32)*5/9;
        system.debug('The Temperature in C: '+fTemp + 'C');
        return fTemp.setScale(2);
    }

}