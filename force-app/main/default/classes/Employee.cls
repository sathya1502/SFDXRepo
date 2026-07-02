/*
Employee emp1 = new Employee();
emp1.name='Sathya';
emp1.age=25;
//emp1.Salary=1500000; - calling this directly will throw error as Salary is a private data
emp1.displayData(1500000);
*/
public class Employee {
    public string name;
    public Integer age;
    integer salary;
   
    public void displayData(integer sal)
    {
        system.debug('The Name of the employee is '+name);
        system.debug('The Age of the employee is '+age);
        setSalary(sal);       
        
    }
    private void setSalary(integer sal)
    {
        salary = sal;
        system.debug('The Salary of the employee is '+salary);
    }

}