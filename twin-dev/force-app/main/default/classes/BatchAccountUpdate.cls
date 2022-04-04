global class BatchAccountUpdate implements Database.Batchable<sObject>
{
    global string query;
    global string s_Object;
    global string value;
    global string field;
    global BatchAccountUpdate(string a, string b,string c,string d){
        query = a;
        s_Object = b;
        value = c;
        field = d;
        }
    global database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc, list<sObject> records){
        for(sobject s:records){
            s.put(Field,Value);
        }
        update records;
    }
    global void finish(database.BatchableContext bc){
        
    }


}