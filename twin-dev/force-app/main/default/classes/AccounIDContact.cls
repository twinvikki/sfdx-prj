public class AccounIDContact {
    public static void accountidcontact(){
        list<contact> contactlist = new list<contact>();
        set<id> accountid = new set<id>();
        for(account a:[select id from account]){
            accountid.add(a.id);
 
        
  //      Contactlist = [select id,name,account.name from contact where account.id in: accountid];
        for(contact con:[select id,name,account.name from contact where account.id in: accountid]) {
            contactlist.add(con);
        }  
         for(contact c:contactlist)
         {
           system.debug('list of contact:' +contactlist);
         } 
        }
        
        // to run a static method in anonymous use classname.staticmethodname();     
    }

}