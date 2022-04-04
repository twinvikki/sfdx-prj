public class VehicleProductRecordTypeAssign {
    @InvocableMethod
    public static void ChangePageLayout(list<id> ids){
        system.debug(ids);
        id recid = ids[0];
       // for( rt:[SELECT Id,SobjectType FROM RecordType])
        for(Vehicle_Product__c vp :[select id,name,RecordTypeId,ApprovalSubmitted__c,EditRequestRaised__c,
                                    EditReqAccepted__c from Vehicle_Product__c where id=: recid]){
            
        } 
    }
}