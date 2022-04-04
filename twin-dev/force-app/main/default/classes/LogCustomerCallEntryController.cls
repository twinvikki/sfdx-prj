public with sharing class LogCustomerCallEntryController {

@AuraEnabled
public static string fetchCustomerLogAccount(id accountid,string accName ){
    id userId = UserInfo.getUserId();
    system.debug('id-->'+userId);
    system.debug('id-->'+accountid);
    system.debug('accName-->'+accName);
    string interactionId;
    id interactionValue;
    for(Interaction_Log__c intLog:[select id,Customer_Account__c,Name,CreatedById from Interaction_Log__c where 
                                     Customer_Account__c =:accountid and Name =: accName and CreatedById =: userId])
                                     {
                                        interactionValue= intLog.id;
                                     }
                                    interactionId=string.valueOf(interactionValue);
                                    if(!string.isBlank(interactionId))
                                    {
                                        return interactionId;
                                    }
                                    else {
                                        return null;
                                    }           
}
}