@isTest
public class StudentTriggerHandlerTest {
    
    public static testmethod void updateCounttestmethod(){
        list<class__c> classlist = new list<class__c>();
        classlist = TestUtils.createclassrecords('class',5,true);
        
        list<student__c> studentlist = new list<student__c>();
        // we want to create 5 stuents for each class so total 25 students. 
       studentlist = TestUtils.createStudentRecords('Student', 25, false);
       for(Integer i = 0; i < studentList.size(); i++)
           studentList.get(i).ClassName__c = classList.get(Math.mod(i, classList.size())).Id;
       insert studentList;  

//SO we can write tstutils.creatstudentrecords 5 times or as bewlo        
        
 /*       for(integer i=0;i<5;i++){
            studentlist.addAll(
                testutils.createstudentrecords('student'+i,5,false));
        } 
        integer studentindex=0;
        integer classindex=0;
        for(class__c c: classlist){
            system.debug('class list:'+c);
        }
        for(student__c s:studentlist)
        {
            
            if(studentindex == 0 || math.mod(studentindex, 5) != 0)
            { 
                s.ClassName__c = classlist.get(classindex).id;
                studentindex++;
            }
            else{
                classIndex++;
            }
        }
          */
  /*      insert studentlist;
        for(student__c s:studentlist){
            system.debug('list:'+s);
        }   */
        class__c c1 = new class__c();
        for(class__c c:[select Count_of_Students__c from class__c 
                        where id=:classList.get(0).id]){
            c1 = c;
        }
        system.assertEquals(c1.Count_of_Students__c,5);           
    }
   
    public static testmethod void onupdatecountTestMethod(){
       list<class__c> classlist = new list<class__c>();
        classlist = TestUtils.createclassrecords('class',5,true);
        
        list<student__c> studentlist = new list<student__c>();
        // we want to create 5 stuents for each class so total 25 students. 
       STUDENTLIST=TestUtils.createStudentRecords('Student', 25, false);
        for(Integer i = 0; i < studentList.size(); i++){
            studentList.get(i).ClassName__c = classList.get(Math.mod(i, classList.size())).Id;
        }
           
       insert studentList;
        for(student__c s : studentlist){
            system.debug('update:'+s);
        }
        for(student__c st: studentlist){
            if(st.classname__C == classlist.get(1).id
               ||st.classname__C == classlist.get(2).id ){
                   st.classname__c = classlist.get(0).id;
               }
        }
        test.startTest();
        update studentlist;
        test.stopTest();
        for(student__c s: studentlist){
            system.debug('after update:'+s);
        }
        Class__c c1 = new Class__c();
        for(Class__c c: [SELECT Count_of_Students__c
                         FROM Class__c
                         WHERE Id=:classList.get(0).Id]){
           c1 = c;
        }
        System.assertEquals(c1.Count_of_Students__c,15);
        
    }
}