trigger HospitalTrigger on Hospital__c (after update,after insert) 
{  //check status of customer record after udate
    if(trigger.isAfter && trigger.isUpdate){   //isafter - fires after all the record method is saved, Update existing records updated
        HospitalTriggerHandler.InvoiceInsertMethod(trigger.new,trigger.oldmap);
    }
   

}