public class AppiroClassDMLCRUD {
    public void readRecords (){
        list<account> AccountList = new list<account> ();
        AccountList = [SELECT ID,Name,Email_id__c  FROM Account WHERE Active__c = 'yes' or Name != Null LIMIT 10];
        for (Account acc:AccountList)
        {
            System.debug('Name:'+acc.Name+''+'ID:'+acc.ID);
        }
    }
    public void insertRecords (){
        list<account> AccountinsertList = new list<account> ();
        for(integer i=0;i<200;i++){
            account acc = new account();
            acc.name='Appiro'+i;
            acc.Email_id__c = 'appiro'+i+'@gmail.com';
            AccountinsertList.add(acc);
        }
        if (AccountinsertList.size()>0){
            insert AccountinsertList;      
        }
        for(account acc:AccountinsertList){
            system.debug('list:'+AccountinsertList);
        }
    }
    public void updaterecords(){
        list<account> updateaccountlist = new list<Account>();
        for(account acc:[select name from account where name like '%appiro%' ]){
            acc.Active__c = 'yes';
            updateaccountlist.add(acc);
        }
        if (updateaccountlist.size()>0){
            update updateaccountlist;
        } 
    }
    public void deleterecords(){
        list<AS4CompanyReport__c> deleteAS4Employeetlist = new list<AS4CompanyReport__c>();
        deleteAS4Employeetlist = [select name from AS4CompanyReport__c where name like '%CR%'];
        delete deleteAS4Employeetlist;
        
       
    }
}