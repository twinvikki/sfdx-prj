public class SampleApprovalProcess {
    public static void sumbitProcess(){
            for(Vehicle_Product__c vr:[select id,UserForApporval__c from Vehicle_Product__c where id=:'a0K7F00000YVK8EUAX']){
            Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
            req1.setObjectId(vr.id);
            req1.setNextApproverIds(new Id[] {vr.UserForApporval__c});

            
            Approval.ProcessResult result = Approval.Process(req1);
            System.assert(result.isSuccess());
            
            System.assertEquals(
                'Pending', result.getInstanceStatus(),
                'Instance Status'+result.getInstanceStatus());            
        }

    }
}