public class StudentTriggerHandler {
    public static void updatecount(list<student__C> newlist,map<id,student__c> oldmap){
     set<id> classidset = new set<id>();
     map<id,integer> ClassidToStudentMap = new map<id,integer>();
     list<class__c> classupdatelist = new list<class__c>();
     if(newlist !=null){   
        //iterate on trigger.new: newlist
        for(student__c student: newlist){
           if(oldmap == null || 
              (student.ClassName__c != oldmap.get(student.id).ClassName__c ))
           // Insert Condition
           {
                  if(student.className__c != null){
                     classidset.add(student.ClassName__c);  //in trigger.new parent id its give as null. As classname__c is present in student it gives id now 
                  }
            // Update condition   
               if(oldmap!=null && oldmap.get(student.id).className__c != null){
                     classidset.add(oldmap.get(student.id).className__c); 
                  }
              }    
        }
     } else
     {
         for(id studentid: oldmap.keyset()){
             if(oldmap.get(studentid).classname__c != null){
                 classIdSet.add(oldmap.get(studentid).classname__c);
             }
         }
         
     }
        for(id classid: classidset){
            ClassidToStudentMap.put(classid,0);
        }
        for(student__c student:[select id,ClassName__c from student__c where
                                ClassName__c IN: classidset])
        {
         /* if(!ClassidToStudentMap.containskey(student.ClassName__c)){
                ClassidToStudentMap.put(student.ClassName__c,0); //initially we are considering we doesnt have any value so we are hardcoding to 0;
            } */
            integer count = ClassidToStudentMap.get(student.ClassName__c);
            count++;
            ClassidToStudentMap.put(Student.ClassName__c,count);
        }
        for(id classid:ClassidToStudentMap.keyset()){    //iterating over map
           class__c c = new class__c ();
           c.id = classid;
           c.Count_of_Students__c = ClassidToStudentMap.get(classid);
           classupdatelist.add(c);
          
        }
        if(classupdatelist.size()> 0){
            update classupdatelist;
        }
    }


}