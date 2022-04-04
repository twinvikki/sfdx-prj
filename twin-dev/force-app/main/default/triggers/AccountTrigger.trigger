trigger AccountTrigger on Account (Before insert,After insert,after update,before update) {
    system.debug('trigger');
    if(trigger.isAfter && trigger.isUpdate){
        system.debug('After Update');
     apextriggerhandler.updatefeildempty(Trigger.New,Trigger.OldMap);   
    }
  //  if(trigger.isBefore && trigger.isUpdate){
  //      apextriggerhandler.updatefeildemptyBeforeupdate(Trigger.New,Trigger.OldMap);
  //  }
    
}
  //  if(trigger.isBefore && trigger.isInsert){
  //      apextriggerhandler.populateExpiration(trigger.new);
  //      apextriggerhandler.setcolorforaccountowner(trigger.new);
   //     apextriggerhandler.CopyBillingtoShipping(trigger.new);
  //  }   
 //   if(trigger.isAfter){
    //    if(trigger.isInsert){
     //     apextriggerhandler.createDefaultOpprotunity(trigger.new);  
    //    }
      //  if(constants.runAccountTrigger)
     //   {
       //     apextriggerhandler.reccursivetriggerdemo(trigger.new);
      //  }
        
  //  }
 //   if(trigger.isBefore){
 //           apextriggerhandler.UpdateBillingtoShipping(trigger.new,trigger.oldmap);  //if we declare there map then we need to use trigger.oldmap
 //   }
 /*  if(trigger.isBefore && Trigger.isUpdate){
            apextriggerhandler.UpdateBillingtoShipping(trigger.new,trigger.oldmap);  //if we declare there map then we need to use trigger.oldmap
    } */
// }

/*    if(trigger.isBefore){
        for(account acc: trigger.new){
        acc.SLAExpirationDate__c = Date.today().addDays(90);
    }
    }
    if(trigger.isAfter){
    list<opportunity> opportlist = new list<opportunity>();
    for(account acc:trigger.new){
        opportunity opp = new opportunity();
        opp.Accountid = acc.id;
        opp.name = acc.name + '_opportunity';
        opp.StageName = 'closed lost';
        opp.CloseDate = date.newInstance(Date.today().year(),12,31);  //to make date as last day of the year
        opportlist.add(opp); 
    }
    if (opportlist.size()>0){
        insert opportlist;
    }
   } 
 // code for opoortunity scenaior2
    if(trigger.isbefore){
            set<id> owneridset = new set<id>();
    map<id,string> owneridcolormap = new map<id,string>();
    for (account acc: Trigger.new){
        owneridset.add(acc.OwnerId);     
    }     
    for(user user:[select id,User_Color__c from user
                   where id in:owneridset and User_Color__c !=null]){
       ownerIdcolormap.put(user.id,user.user_Color__c);
    }
    for(Account acc:trigger.new){
           if (owneridcolormap.containskey(acc.ownerid)){
            acc.Account_User_Color__c = owneridcolormap.get(acc.ownerid);
      }
        
    }
        
    } */
  


    //apex code here is for Account after insert
 /*   list<account> AccountList = new List<account> ();
    for (Account acc:Trigger.new){
        account acctemp = new account();
        acctemp.id=acc.id;
        acctemp.SLAExpirationDate__c = Date.today().addDays(-90);
        accountlist.add(acctemp);
    }
    if(accountlist.size()> 0){
        update accountlist;
    }  */