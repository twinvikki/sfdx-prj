public class ContAcco {
    public list<account>SelectAccount{get;set;}
    public string SelectContact {get;set;}
    public list<wrapdata>wrapdata{get;set;}
    public contacco(){
        wrapdata = new list<wrapdata>();
        SelectAccount = new list<account> (); 
        Selectaccount = [select Name,Email_id__c,Industry,fax, (Select Id, FirstName, LastName From Contacts) from account limit 10];
        list<account> selectaccountforwrapper = [select Name,Email_id__c,Industry,fax from account limit 10];
        List<Contact> ContWrapper;
        account a;
        if(selectaccountforwrapper != null && !selectaccountforwrapper.isEmpty()){
           a = selectaccountforwrapper.get(0);
            ContWrapper = [Select Id, FirstName, LastName From Contact Where AccountId =:a.Id];
        }
        if(ContWrapper != null){
            wrapdata b = new wrapdata(a, ContWrapper);
            this.wrapdata.add(b);
        }
    }          
    public void selectedprocess(){
        selectaccount = new list<account>();
         for(wrapdata q: wrapdata){
            if(q.checkbox == true)
            {
                selectaccount.add(q.accn);
            }
        }
    }
    public class wrapdata{
        public account accn{get;set;}
        public List<Contact> cont{get;set;} 
        boolean checkbox{get;set;}
        public wrapdata(account a,List<Contact> c){
            cont = c;
            a = accn;
            checkbox = false;
        } 
    }
}