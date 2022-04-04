public class MapCustomObjectidlist {
    public void mapfetch(){
        map<id,list<apexsqldemo__c>> mapaccidcustomobject = new map<id,list<apexsqldemo__c>> ();
        for (account acc: [select id,name,(select id,name,account__c from ApexSqlDemos__r) from account ]) {
            mapaccidcustomobject.put(acc.id,acc.ApexSqlDemos__r);
            }
        for(id accid:mapaccidcustomobject.keyset()){
           system.debug('key value:'+mapaccidcustomobject.get(accid));
        }
    }

}