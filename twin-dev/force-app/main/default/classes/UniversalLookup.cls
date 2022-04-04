public with sharing class UniversalLookup {
    /* This class can be used as lookup in any component where we want to create the custom lookup */
@AuraEnabled
    //This is an dynamic method
    public static list<sObject> FetchGivenValues(string searchkeyword, string ObjectName){
        system.debug('searchkey-->'+searchkeyword);
        system.debug('object-->'+ObjectName);
        string searchkey = searchkeyword + '%'; //this is used when we use select statement using like
        system.debug(searchkey); 
        List<sObject> returnList = new List <sObject>();	
        string squery = 'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        for(sobject obj:lstofrecords){
            returnList.add(obj);
        }
        return returnList;
    }
}