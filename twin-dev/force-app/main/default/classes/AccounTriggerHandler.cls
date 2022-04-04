public class AccounTriggerHandler {
 /*   public static void UpdateCheckBox(List<Account> newList)
    {
        String text;
        List<Contact> conList= new List<Contact>();
        set<id> accId= new set<id>();                           
        for(Contact con: [select AccountId,Account.Communication__c,Email__c,Phone__c
                                                     from contact where AccountId= :newList]){
                               system.debug('Inside Contact -----');
                              text= con.Account.Communication__c;
                              if(text.contains('Email'))
                              {
                                  system.debug('Inside Email -----');
                                 con.Email__c= true;
                                  conList.add(con);
                              }
                              if(text.contains('Phone'))
                              {
                                  system.debug('Inside Phone -----');
                            /*      con.Phone__c= true;
                                  conList.add(con);
                              }
 
                           system.debug('List:'+conList);   
                          }
        if(conList.size()>0)
        {
           update conList;
        }
                                                               

    }
    
} */

   public static void UpdateContact(list<account> newlist){
       list<contact> Contactlist = new list<contact>();
       set<id> accountset = new set<id>();
       map<id,string> AccountMap = new map<id,string>();
       string communication;
        for(account acc:newlist)
        {   
            system.debug('Communication__c'+acc.Communication__c);
            if(acc.Communication__c != '')
                Accountset.add(acc.id);
                AccountMap.put(acc.id,acc.communication__c);  
            {
               for(contact con:[select id,name,email__c,phone__c,accountid from contact 
                                where accountid in: Accountset 
                                and email__c = False
                                and phone__c = False])
               {
                   system.debug(con);
                   if(accountmap.containsKey(con.accountid))
                   {
                       communication = accountmap.get(con.accountid);
                       system.debug(communication);
                       if(communication.contains('Phone'))
                       {
                           con.phone__c = true;
                       }
                       if(communication.contains('Email'))
                       {
                           con.email__c = true;
                       }
                   }
                system.debug(con.phone__c);
                system.debug(con.email__c);
                contactlist.add(con);
               }                
               }                   
           
        }
        if (contactlist.size()>0){
           update contactlist;
           system.debug(contactlist.get(0));
    }
    }
}