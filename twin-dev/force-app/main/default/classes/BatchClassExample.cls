global class BatchClassExample implements Database.Batchable<sobject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
       return null; 
    }
    global void execute(Database.BatchableContext BC,List<sobject> scope){
        
    }
    global void finish(Database.BatchableContext BC){
        
    }
}