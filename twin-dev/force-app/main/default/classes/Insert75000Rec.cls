global class Insert75000Rec implements Database.Batchable<sObject> 
{
        global string query;
   global Database.QueryLocator start(Database.BatchableContext BC)
   {
      return Database.getQueryLocator(query); 
   }

   global void execute(Database.BatchableContext BC, List<EmployeeObj__c> scope){
       for(integer i=0;i<75000;i++)
       {
           employeeobj__c s = new employeeobj__c();
           s.name = 'Vikranth'+i;
           s.EmployeeDepartment__c = 'ACS'+i;
           scope.add(s);
       }
    insert scope;
   }
   global void finish(Database.BatchableContext BC)
   {
   }
}