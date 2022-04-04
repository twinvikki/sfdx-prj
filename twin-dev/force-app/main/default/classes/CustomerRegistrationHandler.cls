public without sharing class CustomerRegistrationHandler {

    @AuraEnabled(cacheable=true)
    public static void createAccountContact(string name,string email){
        List<contact> lemailcheck = [select id,email from contact where email =: email];
        if(lemailcheck.size()<0)
        {
              
        }
        else {
            
        }
                    
    }
}