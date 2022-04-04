public class TestUtils {
    
    //this will return list<class__c>
    public static list<class__c> createclassrecords(String name,Integer Count,Boolean isInsert){
      list<class__C> classList = new list<class__C>();
        for (integer i=0;i<=count;i++)
        {
            class__c cls = new class__C();
            cls.name = name +i;
            classlist.add(cls);
        }
        if(isInsert){
            insert classList;
        }
        return classlist;
    }
    
    public static list<student__c> createstudentrecords(String Name,Integer Count,Boolean isInsert){
      list<student__C> studentList = new list<student__C>();
        for (integer i=0;i<=count;i++)
        {
            student__c stu = new student__C();
            stu.name = name +i;
            studentlist.add(stu);
        }
        if(isInsert){
            insert studentList;
        }
        return studentlist;
    }    

}