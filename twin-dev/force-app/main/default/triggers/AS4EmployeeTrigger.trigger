trigger AS4EmployeeTrigger on AS4Employee__c (Before insert,Before Update,After delete,After Undelete) {
    if(trigger.isInsert && trigger.isBefore)  
    {
        AS4EmployeeTriggerHandler.AS4EmployeeDeptReportCreate(Trigger.new);
    }
    if(trigger.isUpdate && trigger.isBefore) 
    {
        AS4EmployeeTriggerHandler.AS4EmployeeDeptReportUpdate(Trigger.new,Trigger.oldmap);
    }
    if(trigger.isdelete && trigger.isAfter)
    {
        AS4EmployeeTriggerHandler.AS4EmployeeDelete(Trigger.old);
    }
    if(trigger.isundelete && trigger.isAfter)
    {
        AS4EmployeeTriggerHandler.AS4EmployeeUnDelete(Trigger.new);
    }
}