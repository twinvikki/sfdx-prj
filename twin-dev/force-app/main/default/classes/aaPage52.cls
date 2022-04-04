public class aaPage52 {
    public Integer X { get; set; }
    public Integer X2 { get; set; }
    public static void checkingSchema(sObject sop){
        sObject objObject = sop;
        system.debug('sobject : '+objObject);
        //system.debug('RecId : '+recid);
        //getPopulatedFeildAsMap() will avoid sObject row was retrieved via Soql without querying the feild and even without querying feilds it will fetch feilds
        set<string> PopulateFeilds = objObject.getPopulatedFieldsAsMap().keySet();           
        //Schema Is data about data. SObjectType is used to check the object type. 
        // Not dynamic ( Map<String, Schema.SObjectField> GetFeilds = Schema.SObjectType.Opportunity.fields.getMap();)
        Map<string,schema.SObjectField> GetFeilds = objObject.getSObjectType().getDescribe().fields.getMap();        
        
        system.debug('GetFeilds-->'+GetFeilds);

      /*  SObjectType accountType = Schema.getGlobalDescribe().get('Account');
        Map<String,Schema.SObjectField> mfields = accountType.getDescribe().fields.getMap();
        system.debug('Map-->'+mfields);
        String commaSepratedFields = '';
        for(String mfieldsName : mfields.keyset()){
            if(commaSepratedFields == null || commaSepratedFields == ''){
                commaSepratedFields = mfieldsName;
            }else{
                commaSepratedFields = commaSepratedFields + ', ' + mfieldsName;
            }
        }
        
       string query = 'select ' + commaSepratedFields + ' from ' + 'Account' + ' Limit 1';
       list<sObject> AccList = new list<sObject>(); 
        accList = Database.query(query);
        system.debug('accList-->'+accList); */
    }
    public aaPage52() {
        X = 0;
        X2 = 0;
    }
    public PageReference TestX() {
        String strX = ApexPages.currentPage().getParameters().get('X');
        if (strX != null) {
            this.X = Integer.ValueOf(strX);
        }
        return null;
    }
    public PageReference TestX2() {
        return null;
    }
}