public class AccountTablePageBlockController {
    public account acc{get;set;}
   // string Aname {get;set;}
    list<Account> Accountlist {get;set;}
    public AccountTablePageBlockController(){
      //   acc = new account();
        
      acc = [select id,name,accountnumber,fax,website from account limit 1];
      Accountlist = [select id,name from account where name =:acc.name];
     }
//    public void fetchaccount(){
      //  account a = new account();
 //       for(account a:[select name,id from account where name=:acc.name ])
 //       {
 //          Accountlist.add(a); 
 //       }
 //   }
    

}