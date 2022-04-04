public with sharing class photoCaptureControllerApex {
    @AuraEnabled
    public static String saveImageFile(String recId,String imageUrl) {
        try {
            system.debug('imGE-->'+ imageUrl);
            system.debug('recId-->'+ recId);
            // Create Salesforce File
            //Insert ContentVersion
            ContentVersion cVersion = new ContentVersion();
            cVersion.ContentLocation = 'S'; 
            cVersion.PathOnClient = recId+'.png';
            cVersion.Origin = 'H';
            cVersion.OwnerId = UserInfo.getUserId();
            cVersion.Title = recId+'.png';
            cVersion.VersionData = EncodingUtil.base64Decode(imageUrl.substring(imageUrl.indexOf(',') + 1));
            Insert cVersion;
            
            //After saved the Content Verison, get the ContentDocumentId
            Id conDocument = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cVersion.Id].ContentDocumentId;
            
            //Insert ContentDocumentLink
            ContentDocumentLink cDocLink = new ContentDocumentLink();
            cDocLink.ContentDocumentId = conDocument;
            cDocLink.LinkedEntityId = recId;
            cDocLink.ShareType = 'I';
            cDocLink.Visibility = 'AllUsers';//AllUsers, InternalUsers, SharedUsers
            Insert cDocLink;
            return 'success';
            
        }catch(Exception e){
            system.debug('---------- ' + e.getMessage());
            return JSON.serialize(e.getMessage());
        }
    }
}