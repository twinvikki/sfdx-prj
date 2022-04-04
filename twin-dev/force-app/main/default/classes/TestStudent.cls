public class TestStudent{
      public String Name;
      public Integer RollNo;               //Constructor also one of the way to intialize the variable
      public TestStudent(String Myname , Integer Myrollno){    
        Myname=Name;
        Myrollno=RollNo;
        system.debug('Name:' +Name);
        system.debug('RollNo' +RollNo);
      }
}