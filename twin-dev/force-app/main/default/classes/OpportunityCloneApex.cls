public class OpportunityCloneApex {
    
    /**
* Method which will clone an opportunity with it's products 
* @param opp : Opportunity record which needs to be cloned
* @param sourceOppRecordId : Id of the source opportunity, we had to pass it expicitly 
*                            since it's not coming in the opp param which has page-layout field values
* */
    @AuraEnabled
    public static id CloneRecordAndChildRecords(sObject objObject,id recid){
        system.debug('sobject : '+objObject);
        system.debug('RecId : '+recid);
        //getPopulatedFeildAsMap() will avoid sObject row was retrieved via Soql without querying the feild and even without querying feilds it will fetch feilds
        set<string> PopulateFeilds = objObject.getPopulatedFieldsAsMap().keySet();           
        //Schema Is data about data. SObjectType is used to check the object type. 
        // Not dynamic ( Map<String, Schema.SObjectField> GetFeilds = Schema.SObjectType.Opportunity.fields.getMap();)
        Map<string,schema.SObjectField> GetFeilds = objObject.getSObjectType().getDescribe().fields.getMap();
        system.debug('check-->');
        return null;
    }  
    
}

/* //public static List<string> FetchOpportunityDetails(sObject objObject, string fld, id recid) 
{
system.debug('objObject --->' + objObject);
system.debug('fld --->' + fld);
Map<string,list<string>> DetailSobjPick = new Map<string,list<string>>();
List < String > allOpts = new list < String > ();
// Get the object type of the SObject.
Schema.sObjectType objType = objObject.getSObjectType();        
// Describe the SObject using its object type.
Schema.DescribeSObjectResult objDescribe = objType.getDescribe();        
// Get a map of fields for the SObject
map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();        
// Get the list of picklist values for this field.
list < Schema.PicklistEntry > values =
fieldMap.get(fld).getDescribe().getPickListValues();        
// Add these values to the selectoption list.
for (Schema.PicklistEntry a: values) {
allOpts.add(a.getValue());
}
system.debug('allOpts ---->' + allOpts);
allOpts.sort();
if(!DetailSobjPick.containskey('Pick')){
DetailSobjPick.put('Pick',allOpts);  
}

return null;
}  */