public class VFDemoController10 { 
    boolean isErrorOccured= false;
    public Account acc{get; set;}
    Id accId;
    public VFDemoController10(){
        acc = new Account();
        accId = apexpages.currentPage().getParameters().get('recId');
        if(accId != null){
            for(Account a :[SELECT Name,Rating
                            FROM Account
                            WHERE Id = :accId]){
                acc = a;
            }
        }
    }
    public void save(){
        if(acc.rating == null || acc.rating=='')
        {
            string Error = 'Rating is required to Create an Account';
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,error);
            ApexPages.addMessage(myMsg);  
            isErrorOccured = true;
        }
        if(!isErrorOccured)
        {   
            string confirmMessage='';
            if(acc.id!=null)
            {
                confirmMessage='Record Updated';
            }
            else
            {
                confirmMessage='Record Inserted';   
            }
            string Success = 'Account added sucessfull';
            try
            {
                upsert acc;
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Confirm,confirmMessage);
                ApexPages.addMessage(myMsg);
            }
            catch(Exception e)
            {
                ApexPages.Message myExceptionMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'OOPS Something wrong happened');
                ApexPages.addMessage(myExceptionMsg);
            }
            
          //  upsert acc;
        }
        
  //       PageReference ref = new PageReference('/'+acc.Id);
 //       return ref;
    }
    public PageReference cancel(){
        PageReference ref = new PageReference('/001/o');
        return ref;
    }

}