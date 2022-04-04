trigger TriggerContact on Contact (after insert,after update,after delete,before delete) {
    //   contacttriggerhandler.preventduplicatecontact(trigger.new,trigger.oldmap);
    //  contacttriggerhandler.preventduplicationforupdate(trigger.new,trigger.oldmap);
    // contacttriggerhandler.preventduplicationforupdate(trigger.new,trigger.oldmap);
    
    if(trigger.isafter)
    {
        if(trigger.isInsert)
        {
            
            ContactSalary.contactSalaryUpdate(trigger.new);
        }
        if(trigger.isUpdate)
        {
            
            ContactSalary.contactSalaryUpdate(trigger.new);
        }  
    }
    
    if(trigger.isdelete && trigger.isafter)
    {
        //system.debug('isDelete');
        // rollUpCountAccount.rolluponAccount(trigger.old);
    } 
}