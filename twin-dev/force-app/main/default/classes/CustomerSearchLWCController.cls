public with sharing class CustomerSearchLWCController {

    @AuraEnabled
    public static CustomerContact__c searchCustomerData(string emailValue,string phoneValue,string idValue) {
         // list<wrapperCustomerSearch> lWrCusSearch = new list<wrapperCustomerSearch>();
          //map<id,public_Contact__x> mPubCont = new map<id,public_Contact__x>();
          CustomerContact__c objPubCon;
          system.debug('idValue-->'+idValue);
          if(!string.isBlank(emailValue) || !string.isBlank(idValue))
          {
              for(CustomerContact__c pc:[select id,Contact_Type__c,Email__c,FirstName__c,Name,Salutation__c,Customer_Account__c,Customer_Account__r.ID_Type__c from CustomerContact__c 
              where Email__c =:emailValue or Customer_Account__r.Id_Number__c  =: idValue limit 1])
              {
                objPubCon =pc;
                system.debug('pc');
              }
          }
          else if(!string.isBlank(phoneValue)) {
                system.debug('Phone no');
          }
          return objPubCon;
    }
    @AuraEnabled
    public static CustomerQuestions__c fetchQuestions(id pubConId)
    {
        CustomerQuestions__c cquestions;
        for(CustomerQuestions__c cq:[select id,CustomerContact__c,What_is_your_Mothers_Maiden_Name__c from CustomerQuestions__c where CustomerContact__c =: pubConId ])
        {
            cquestions = cq;
        }
        return cquestions;
    }
    @AuraEnabled(cacheable=true)
    public static wrapperCustDetails fetchCustomerDetails(id accountId){
        system.debug('id-->'+accountId);
        WrapperCustDetails wrCust= new WrapperCustDetails();
       // Customer_Account__c lCustAccount = new Customer_Account__c();
       // CustomerContact__c  lCustContact = new CustomerContact__c();
        if(schema.sObjectType.Customer_Account__c.isAccessible())
        {
            for(Customer_Account__c custAcc : [select id,ID_Expiry_Date__c,Id_Number__c,ID_Type__c,Name
            from Customer_Account__c where id=:accountId])
            {
                wrCust.lWrapperAccount = custAcc;
            }   
        }
        if(schema.sObjectType.CustomerContact__c.isAccessible())
        {
            for(CustomerContact__c custCont :[select id,Customer_Account__c,Email__c,Name,FirstName__c,Salutation__c from CustomerContact__c where Customer_Account__c =: accountId])
            {
                wrCust.lWrapperContact = custCont;
            }
        }
        return wrCust;
        
    }
    public class WrapperCustDetails{
        @AuraEnabled
        public Customer_Account__c lWrapperAccount{get;set;}
        @AuraEnabled
        public CustomerContact__c lWrapperContact{get;set;}  
       /* public WrapperCustDetails(Customer_Account__c custAccount, CustomerContact__c custContact) {
            this.custAccount = custAccount;
            this.custContact = custContact;
        } */   
    }
  /*  public class wrapperCustomerSearch{
        @AuraEnabled
        publi
        c public_Contact__x pubContact;

            
        public wrapperCustomerSearch(public_Contact__x pubContact,public_Account__x pubAccount)
        {
            this.pubContact = pubContact;
            this.pubAccount = pubAccount;
        }
    }*/
}