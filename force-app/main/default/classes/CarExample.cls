/*To Execute in Anonymous Window:
CarExample carInstance = new CarExample();
carInstance.make = 'Audi';
carInstance.model = 'A9';
carInstance.avgSpeed = 30;
carInstance.printOutput();*/
public class CarExample {
    public string make;
    public string model;
    public integer avgSpeed;
    
	public void printOutput()
    {
        system.debug('The make of the car is: '+make);
        system.debug('The model of the car is '+model);
        system.debug('The average speed of the car is '+avgSpeed);
    }
    private void newCarSpeed()
    {
        avgSpeed+=100;
        //return avgSpeed;
    }
    public void printOutputAfterSpeedUpdate()
    {
        newCarSpeed();
        system.debug('The new average speed is '+avgSpeed);
    }
}