public class apexTriggerHandler {
    public static void populateExpiration(list<account> newlist){
        for(account acc: newlist){
        acc.SLAExpirationDate__c = Date.today().addDays(90);
    }        
    }
    public static void createDefaultOpprotunity(list<account> newlist){
       list<opportunity> opportlist = new list<opportunity>();
        for(account acc:newlist){
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
    public static void setcolorforaccountowner(list<account> newlist){
         set<id> owneridset = new set<id>();
         map<id,string> owneridcolormap = new map<id,string>();
         for (account acc:  newlist){
              owneridset.add(acc.OwnerId);     
         }     
         for(user user:[select id,User_Color__c from user
                 where id in:owneridset and User_Color__c !=null])
         {
           ownerIdcolormap.put(user.id,user.user_Color__c);
          }
         for(Account acc:newlist){
             if (owneridcolormap.containskey(acc.ownerid)){
           acc.Account_User_Color__c = owneridcolormap.get(acc.ownerid);
         }   
         }
    }
    public static  void reccursivetriggerdemo(list<account> newlist){
        list<account> accountlist = new list<account>();
        for(account acc:newlist){
            account a = new account();
            if(acc.SLAExpirationDate__c == null){
                acc.SLAExpirationDate__c = date.today();
            }
            a.id=acc.id;
            a.SLAExpirationDate__c = acc.SLAExpirationDate__c.addDays(90);
            accountlist.add(a);
        }
        if(accountlist.size()>0){
         //   constants.runAccountTrigger = false;
            update accountlist;
        }        
        
    }
    public static void updatefeildempty(list<account> newlist, map<id,account> oldmap){
        list<Note> Notes = new list<Note>();
        for(account acc:newlist){
            if(acc.TickerSymbol != null &&  acc.TickerSymbol != oldmap.get(acc.id).tickersymbol){
                Note addedntes = new Note();
                addedntes.ParentId = Acc.Id;
                addedntes.Body = Acc.TickerSymbol;
                addedntes.Title = 'Creation Note';
                Notes.add(addedntes);                
             //   acc.TickerSymbol = null;
             //   acct.add(acc);
            }    
            }
        if(Notes.size()>0){
              insert Notes; 
        }
                  
    }
    public static void updatefeildemptyBeforeupdate(list<account> newlist, map<id,account> oldmap){
        list<Note> Notes = new list<Note>();
        for(account acc:newlist){
            if(acc.TickerSymbol != null &&  (acc.TickerSymbol != oldmap.get(acc.id).tickersymbol) && (oldmap.get(acc.id).tickersymbol == null) ){
                system.debug('ticker symbol-->'+oldmap.get(acc.id).tickersymbol);
                Note addedntes = new Note();
                addedntes.ParentId = Acc.Id;
                addedntes.Body = Acc.TickerSymbol;
                addedntes.Title = 'Creation Note';
                Notes.add(addedntes); 
             //   acc.TickerSymbol = null;
             //   acct.add(acc);
            //    acc.TickerSymbol = null;
            }    
            }
        if(Notes.size()>0){
              insert Notes; 
        }
                  
    }    
 /*   public static void CopyBillingtoShipping(list<account> newlist){
        for(account acc:newlist){
            if(acc.Billingaddresstoshippingaddress__c){
                 acc.ShippingCity = acc.BillingCity;
                 acc.ShippingCountry = acc.BillingCountry;
                 acc.ShippingPostalCode = acc.BillingPostalCode;
                 acc.ShippingState = acc.BillingState;
                 acc.ShippingStreet = acc.BillingStreet;
             
        }

       
        
    }

} */	
    public static void UpdateBillingtoShipping(list<account> newlist, map<id,account> oldmap){
        for(account acc:newlist){
            if(oldmap== null ||(acc.Billingaddresstoshippingaddress__c !=
               oldmap.get(acc.id).Billingaddresstoshippingaddress__c 
               || (acc.BillingStreet !=  oldMap.get(acc.Id).BillingStreet ||
               acc.BillingCity !=  oldMap.get(acc.Id).BillingCity ||
               acc.BillingState !=  oldMap.get(acc.Id).BillingState ||
               acc.BillingPostalCode !=  oldMap.get(acc.Id).BillingPostalCode ||
               acc.BillingCountry !=  oldMap.get(acc.Id).BillingCountry) 
               || (acc.ShippingStreet !=  oldMap.get(acc.Id).ShippingStreet ||
                   acc.ShippingCity !=  oldMap.get(acc.Id).ShippingCity ||
                   acc.ShippingState !=  oldMap.get(acc.Id).ShippingState ||
                   acc.ShippingPostalCode !=  oldMap.get(acc.Id).ShippingPostalCode ||
                   acc.ShippingCountry !=  oldMap.get(acc.Id).ShippingCountry))) 
                
                //if our check box is true 
                //here its checking that record already exists or not. It shouldnt exist and checkbox should be false
            {
               if(oldmap != null && !acc.Billingaddresstoshippingaddress__c && !(acc.ShippingStreet !=  oldMap.get(acc.Id).ShippingStreet ||
               acc.ShippingCity !=  oldMap.get(acc.Id).ShippingCity ||
               acc.ShippingState !=  oldMap.get(acc.Id).ShippingState ||
               acc.ShippingPostalCode !=  oldMap.get(acc.Id).ShippingPostalCode ||
               acc.ShippingCountry !=  oldMap.get(acc.Id).ShippingCountry))
                {
                 acc.ShippingCity = null;
                 acc.ShippingCountry = null;
                 acc.ShippingPostalCode = null;
                 acc.ShippingState = null;
                 acc.ShippingStreet = null;    
                }
                else if(acc.Billingaddresstoshippingaddress__c)
                {
                 acc.ShippingCity = acc.BillingCity;
                 acc.ShippingCountry = acc.BillingCountry;
                 acc.ShippingPostalCode = acc.BillingPostalCode;
                 acc.ShippingState = acc.BillingState;
                 acc.ShippingStreet = acc.BillingStreet;                    
                }
                 
            }

            
        }
    }
    public static void NewAccountSharingMethod(){
        
    }
   
}