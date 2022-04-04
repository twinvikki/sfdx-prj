public class PharmaProductCustomExtension { /*
    public string InputText {get;set;}
    public list<Pharma_Product__c> Pharmalist{get;set;}
    public id paramValue {get; set;}
    public Id Idvalue;
    public boolean recordsfound {get;set;}
    public PharmaProductCustomExtension()
    {
        system.debug(apexpages.currentpage().getparameters().get('InputValue'));
        InputText = apexpages.currentpage().getparameters().get('InputValue');
        system.debug(InputText);
        if(InputText == null)
        { 
            recordsfound = false;
            Apexpages.Message myMsg = new Apexpages.Message(ApexPages.Severity.ERROR,'No records to display');
            ApexPages.addMessage(myMsg);            
        }
        else
        {
         system.debug(InputText);
         string val = '%'+InputText+'%';  
         system.debug(val);
         Pharmalist = new list<Pharma_Product__c>();
         if(val.containsOnly('%'))
         {
            Apexpages.Message myMsg = new Apexpages.Message(ApexPages.Severity.ERROR,'No records to display');
            ApexPages.addMessage(myMsg);              
         }
         else
         {
           for(pharma_product__c p:[select id,name,price__c from Pharma_product__c where name Like :val])
            {
              recordsfound = true;
              system.debug(p);
              Pharmalist.add(p);
            }               
         }                            
       }           
    }

    Public PageReference CopyPageRecordId(){
        system.debug('paramValue'+paramValue);
        pagereference pr = new pagereference('/apex/PharmaDetailPage?Recordid='+paramValue);
        pr.setRedirect(True);
        return pr;
    }  */
}