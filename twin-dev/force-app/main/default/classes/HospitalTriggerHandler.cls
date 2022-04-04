public class HospitalTriggerHandler {
    public static void InvoiceInsertMethod(list<Hospital__c> newlist,map<id,Hospital__c> oldmap){
        list<Invoice__c> Invoicelist = new list<invoice__c>();
        for(Hospital__c hsptl : NewList)
        {
          if(hsptl.Hospitl_Status__c == 'active' && oldmap.get(Hsptl.id).Hospitl_Status__c =='InActive'){
            Invoice__c inv = new Invoice__c();
            inv.Invoice_Date__c = date.today();
            inv.Hospital__c = hsptl.id;
            Invoicelist.add(inv);
        }  
        }
        if(invoicelist.size()>0){
            insert invoicelist;
        }        
    }
    

}