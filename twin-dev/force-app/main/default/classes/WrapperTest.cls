public class WrapperTest {
    public list<wrapaccount> wrapaccountList{get; set;}
    public list<account> selectedaccount{get; set;}
    public wrapperTest(){
        wrapaccountlist = new list<wrapaccount>();
        for (account a:[select Name,Email_id__c,Industry, fax from account limit 10]){
         wrapaccountlist.add(new wrapaccount(a));    
        }
        
    }
    public void processselected(){
        selectedaccount = new list<account>();
        for(wrapaccount b: wrapaccountlist){
            if(b.checkbox == true)
            {
                selectedaccount.add(b.accn);
            }
        }
    }
    public class wrapaccount{
        public account accn{get; set;}
        public boolean checkbox{get;set;}
        public wrapaccount(account a) {
            accn = a;
            checkbox = false;
        }
        
    }
}