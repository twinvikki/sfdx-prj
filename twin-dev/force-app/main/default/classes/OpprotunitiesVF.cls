public class OpprotunitiesVF {
    public list<opportunity> Selopportunity {get;set;}
    list<string> stagelist = new list<string>();
    public OpprotunitiesVF (ApexPages.StandardController OppController){
        //
    }
    
    public PageReference customCancel(){
        PageReference ref = new PageReference('/apex/Appiro1st');
        return ref;
    }     
    

}