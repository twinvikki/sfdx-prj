public class VFDemo5Controller {
    id accid;
    //We need to use this acc refernce directly in our page 
    public Account acc{get;set;}
    public VFDemo5Controller(){
        //initalize the account
        acc = new account();
        accid= ApexPages.currentPage().getParameters().get('recId');
        if(accid!=null)
        {
            for(Account a:[select name,rating from account where id=:accid])
            {
                acc = a;
            }  
        }
    }
 //   public void save(){
 //     upsert acc;  
 //   }
    public PageReference save(){
       upsert acc;  
       PageReference ref = new PageReference('/'+acc.id);
       return ref;
    }

    public PageReference cancel(){
       PageReference ref = new PageReference('/001/o');
       return ref;
    }

}