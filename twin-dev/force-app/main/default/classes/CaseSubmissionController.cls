public class CaseSubmissionController {
    @AuraEnabled
    public static void casesubmissionmethod(Case objObject){
        system.debug('entered from controller');
        map<string,id> condetails = new map<string,id>();
        list<Case> CaseList = new list<case>();
        if(objObject !=  null){
            Case wr = objObject;
            for(Contact con: [select id,name,email,Phone from contact where email=:wr.ContactEmail and phone=:wr.ContactPhone]){
                string emphone = con.email + con.Phone;
                if(!condetails.containskey(emphone)){
                    condetails.put(emphone,con.id);
                }                
            }
            string checkphonemail = wr.ContactEmail + wr.ContactPhone;
            if(!condetails.containskey(checkphonemail)){
                Contact con = new Contact();
                con.LastName = wr.Name__c;
                con.Phone = wr.ContactPhone;
                con.Email = wr.ContactEmail;
                insert con;
                wr.ContactId = con.id;
                CaseList.add(wr);
            }
            else
            {
               wr.ContactId =  condetails.get(checkphonemail);
               CaseList.add(wr);
            }
            insert CaseList;

        }               
    }
}