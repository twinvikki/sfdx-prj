@istEST
public class AccouBillinShippinngTest {
    @istest
    public static void billingShippingTestMethod(){
        account acc = new Account();
        acc.Name = 'Test class Account';
        acc.Billingaddresstoshippingaddress__c =true;
        acc.BillingCountry = 'india';
        acc.BillingPostalCode = '500087';
        acc.BillingState = 'telangana';
        acc.BillingStreet = 'santosh nagar';
        insert acc;
        
        AccounBillinShippinng ab = new AccounBillinShippinng(); 
        ab.BillingShipping();
        
        account newAcc= new Account();
        for(account a: [select shippingCountry from account where id = :acc.id and CreatedDate = LAST_N_DAYS:15]){
            newacc = a;
        }
        system.assertEquals(acc.shippingCountry,acc.BillingCountry);
    } 

}