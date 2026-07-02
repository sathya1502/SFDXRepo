public class Student {
    
  string name;
  integer age;
   public student()
   {
       
   }
   public student(string n, integer a)
   {
       name = n;
       age = a;
   }
   public void displayStudentInfo()
   {
       system.debug('The name is '+ name);
       system.debug('The age is '+ age);
   }
   

}