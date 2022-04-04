public class APPIRO7132018 {
    public void updateAccounts (){   //how to fetch a parent and child record
        map<id,account> accountIdtoRecordMap = new map<id,account>();
        for (contact con:[select id,account.id from contact where name like '%cont%' and account.id!= null]){
            Account acc = new Account();
            acc.id=con.account.id;
            acc.Active__c='no';
            accountIdtoRecordMap.put(acc.id,acc);  //we are putting complete acc record in to value and id into id
        }
        if (accountIdtoRecordMap.size()>0){
             update accountIdtoRecordMap.values();  //beacuse we are only updating values
             system.debug('success');
        }
        for (id accountid:accountIdtoRecordMap.keyset()) {  //to print id of map
            system.debug('Id:'+accountIdtoRecordMap.get(accountid));
        }
       
        }
 /*       list<account> accountupdatelist = new list<account>();
        set<id> accountidset = new set <id>();
        for(Contact con:[select id,account.id 
                         from contact where 
                         name like '%Cont%' 
                         and account.id != null]) {
                          if(!accountidset.contains(con.account.id)){  //initalization part is always done as Acount acc = new account (); 
                                                                       //   every time for a record 
                             Account acc = new account();             // we can intialize also listname=[select query];
                             acc.Active__c = 'yes';
                             acc.id = con.account.id;
                             accountupdatelist.add(acc);
                             accountidset.add(con.account.id); 
                             }   
                         } 
         if(accountUpdateList.size() > 0) {
            update accountUpdateList;
             system.debug('success');
             for(account acc:accountupdatelist){   //to print always we need to right for and map with list
                system.debug(acc.id); 
             }
                               
        }   
    } */
    public void updatecontactlistforAccount (){
        map<id,list<contact>> ContactUpdateAccount = new map<id,list<contact>>();
        //lets do a query on all contacts
        for(contact con:[select id,account.id,name from contact where account.id!=null]){
            if(!ContactUpdateAccount.containskey(con.account.id)){
                ContactUpdateAccount.put(con.account.id,new list<contact>());
            }
           ContactUpdateAccount.get(con.account.id).add(con);
        }
        for(id accountid:ContactUpdateAccount.keyset()){
            system.debug('id:'+ContactUpdateAccount.get(accountid));
        }

    }
}