global class ApexBatch implements database.Batchable<sobject> {
     global integer count = 0;
    global database.QueryLocator start(database.batchablecontext bc) {
        string query = 'select id,name from account';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc, list<account> scope)
    {
        system.debug('@@@@@@@@@@@@@@@@@@@@@@@' +scope.size());
        for(account a: scope)
        {
            a.name = 'Vikranth';
            count++  ;
        }
        update scope;
    }
    global void finish(database.BatchableContext bc){
        system.debug('@@@@@@@@@@@@@@@@' +count);
    }
  
}