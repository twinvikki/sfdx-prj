public class VFDemo3AcountExtension {
 //whenever we use Standard contoller and extensions we need to define a constructor.
    Account acc = new Account();
    public string message{get;set;}
    //any controller we need to access any thing on page we use get and set.
    public VFDemo3AcountExtension(ApexPages.StandardController stdController){ 
        
        //this Apexpages.standardController will provide the standard fucntionality
        message='Enter Value';
        acc=(Account) stdController.getRecord();
        if(acc.Name != null){
            message = 'Welcome'+acc.Name;
        }
        //Whatever id we pass it will come and save in this Acc
    }
    //Page refernce method is for 
    public PageReference customCancel(){
        PageReference ref = new PageReference('/apex/Appiro1st');
        return ref;
    }
}