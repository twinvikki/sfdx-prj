public class FetchAllObjectsInOrg {
    @AuraEnabled
    public static list<string> FetchAllObject(){
       list<string> lsobj = new list<string>();
       Map<string, Schema.SObjectType> sobj = Schema.getGlobalDescribe();
       for(schema.SObjectType thisobj : sobj.values()){
            Schema.DescribeSObjectResult objResult = thisobj.getDescribe();
            lsobj.add(objResult.getLabel());            
        }
        system.debug('size-->'+lsobj);     
        return lsobj;   
/*    for(schema.SObjectType thisobj : Schema.getGlobalDescribe().values()){
            Schema.DescribeSObjectResult objResult = thisobj.getDescribe();
            alllist.add(objResult.getName());            
        }
return alllist; */
    }
    @AuraEnabled
    public static list<string> FetchAllProfile(){
        list<string> lsProfileName = new list<string>();
        for(Profile pr:[select name from Profile]){
            lsProfileName.add(pr.name);
        }
        return lsProfileName;
    }
}