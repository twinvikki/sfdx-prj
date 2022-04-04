public class AccounBillinShippinng {
    public void BillingShipping(){

 /*     map<id,account> listAccount = new map<id,account>();
  
        for(account acc:[select id,name,BillingCity,BillingCountry,BillingPostalCode,BillingState,BillingStreet,Billingaddresstoshippingaddress__c from account where CreatedDate = LAST_N_DAYS:15 ]){
       if(!listAccount.containskey(acc.id)){
                if(acc.Billingaddresstoshippingaddress__c == true){
                  acc.ShippingCity = acc.BillingCity;
                  acc.ShippingCountry = acc.BillingCountry;
                  acc.ShippingPostalCode = acc.BillingPostalCode;
                  acc.ShippingState = acc.BillingState;
                  acc.ShippingStreet = acc.BillingStreet;
                 
                  listAccount.put(acc.id,acc);
                }
              if(listAccount.size()>0){
                    update listAccount.values(); 
                }  

              
           }
        }
    } above code is not optimized let optimize the code    */
   
        list<account> listAccount = new list<account>();
        for(account acc:[select id,name,BillingCity,BillingCountry,BillingPostalCode,BillingState,BillingStreet from 
                         account where CreatedDate = LAST_N_DAYS:15 
                         and Billingaddresstoshippingaddress__c = true]){
              
                  acc.ShippingCity = acc.BillingCity;
                  acc.ShippingCountry = acc.BillingCountry;
                  acc.ShippingPostalCode = acc.BillingPostalCode;
                  acc.ShippingState = acc.BillingState;
                 acc.ShippingStreet = acc.BillingStreet;
                  listAccount.add(acc);

        }

               if(listAccount.size()>0){
                    update listAccount;
                }  
                for(Account acc1:listAccount) {
            System.debug(acc1.Name+'>>>>>'+acc1.Id);
        }
           
        }   
        

    }