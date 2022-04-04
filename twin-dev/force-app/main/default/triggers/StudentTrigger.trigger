trigger StudentTrigger on Student__c (after insert,after update,after delete,after undelete) {
     StudentTriggerHandler.updatecount(trigger.new,trigger.oldmap);
}