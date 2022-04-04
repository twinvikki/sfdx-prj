public class AS3CollegeUpdation {
     public void CollegeUpdationMethod()
   {
       Set<id> Collegesid = new set<id>();
       map<id,id> studentcollegeid = new map<id,id>();
       for(AS3college__c collid:[select id,name,(select id,name,score__c from as3students__r) from as3college__c])
       {
           Collegesid.add(collid.id);
       
       }
       
       for(AS3student__c studid:[select name,score__c,id,college__c from as3student__c  where 
                                 college__c  in : Collegesid order by score__c desc nulls last])
       {
        if(!studentcollegeid.containskey(studid.college__C)){
               studentcollegeid.put(studid.college__C,studid.id);    
          }
        }
       
       list<AS3college__c> Collegelist = new list<as3college__C> ();
       for(AS3college__c as3:[select id,name,topper__c from as3college__c where id in: Collegesid])
       {
           if(studentcollegeid.containskey(as3.id)){
           { 
            as3.topper__c = studentcollegeid.get(as3.id);  
            collegelist.add(as3);                    
           }

           }           
       } 
       if(collegelist.size()>0){
           update collegelist;
       }

   } 
}