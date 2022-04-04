public class EditRequestApprovalSubmit {
    @AuraEnabled
    public static void UpdateEditReq(Id recId,string reasonforedit){
        system.debug('recid-->'+recId);
        system.debug('reasonforedit-->'+reasonforedit);
        id OwnerIdForVP;
        id managerid;
        list<Vehicle_Product__c> VehList = new list<Vehicle_Product__c>();
        Vehicle_Product__c veh = [select id,Owner.id from Vehicle_Product__c where id=:recId];
        OwnerIdForVP = veh.Owner.id;
        system.debug('OwnerIdForVP-->'+OwnerIdForVP);
        user ur = [SELECT Id,name,manager.id FROM User where id =: OwnerIdForVP];
        managerid = ur.manager.id;
        system.debug('managerid-->'+managerid);        
        for(Vehicle_Product__c vp:[select id,ApprovalSubmitted__c,EditRequestRaised__c,ReasonForEdit__c,UserForApporval__c,
                                   Owner.id from Vehicle_Product__c where id=:recId])
        {
            vp.ApprovalSubmitted__c = true;
            vp.EditRequestRaised__c = true;
            vp.ReasonForEdit__c = reasonforedit;
            vp.UserForApporval__c = managerid;
            VehList.add(vp);
            system.debug(VehList.size());
        }
        if(VehList.size()>0){
            update VehList;
            Vehicle_Product__c vr=[select id,ApprovalSubmitted__c,ReasonForEdit__c,EditRequestRaised__c,UserForApporval__c from Vehicle_Product__c where id=:recId];
             system.debug('App Subm'+vr.ApprovalSubmitted__c);
            system.debug('Edit req'+vr.EditRequestRaised__c);
            system.debug('ReasonForEdit'+vr.ReasonForEdit__c); 
            system.debug('ManagerId'+vr.UserForApporval__c);
        }
        for(Vehicle_Product__c vr:[select id from Vehicle_Product__c where id=:recId]){
            Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
            req1.setObjectId(vr.id);
            
            Approval.ProcessResult result = Approval.Process(req1);
            System.assert(result.isSuccess());
            
            System.assertEquals(
                'Pending', result.getInstanceStatus(),
                'Instance Status'+result.getInstanceStatus());            
        }                 
    } 
}