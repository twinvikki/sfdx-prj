public class RecordTypesSelection {
    
  /*  @AuraEnabled
    public static string FetchRecordTypesId(id recValue){
        system.debug('recId-->'+recValue);
       // string RecTypeName;
        Map<id,string> MapRecType = new Map<id,string>();
        product__c pr = [select recordTypeId from product__c where id=: recValue limit 1];
        id recTypeId = pr.recordTypeId;
        RecordType rt = [Select Id, Name From RecordType Where id =: recTypeId];       
        string RecTypeName = rt.Name;  
        system.debug('RecTypeName-->'+RecTypeName);
        return RecTypeName; 
    } */
}

//select Id from recordType where id='0127F000000SQ2mQAG'
/*for(RecordType rt:[Select Id, Name From RecordType Where SobjectType =: ObjDetail]){
   if(!MapRecType.containsKey(recTypeId)){
   MapRecType.put(rt.id,rt.Name);
   } 
} */
/*for(product__c pr : [select recordTypeId from product__c where id=: recId limit 1]){
   id recTypeId = pr.recordTypeId;
}  */