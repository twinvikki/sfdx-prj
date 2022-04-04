global class AutocreatedRegHandler1578652046700 implements Auth.SamlJitHandler {
    private class JitException extends Exception{}
    private void handleUser(boolean create, User u, Map<String, String> attributes,
        String federationIdentifier, boolean isStandard) {
        if(create && attributes.containsKey('User.Username')) 
		{
            u.Username = attributes.get('User.Username');
        }
        if(create) 
		{
            if(attributes.containsKey('User.FederationIdentifier')) {
                u.FederationIdentifier = attributes.get('User.FederationIdentifier');
            } else {
                u.FederationIdentifier = federationIdentifier;
            }
        }
        /*if(attributes.containsKey('User.ProfileId')) 
		{
            String profileId = attributes.get('User.ProfileId');
            Profile p = [SELECT Id FROM Profile WHERE Id=:profileId];
            u.ProfileId = p.Id;
        }*/
		    //u.ProfileId = '00e7F000000qgonQAA';
				//u.UserRoleId =  '00E7F000001Lmk5UAC';
u.Username = u.federationIdentifier+ '@m1community.dev';
      u.LastName = 'ABC';
      u.FirstName = 'XYZ';	
u.Email = u.federationIdentifier+ '@m1.sg.com';
u.Alias = 'Dummy';
        String uid = UserInfo.getUserId();
        User currentUser = 
        [SELECT LocaleSidKey, LanguageLocaleKey, TimeZoneSidKey, EmailEncodingKey,ProfileId,UserRoleId FROM User WHERE Id=:uid];
            User ProFileUser = [SELECT ProfileId,UserRoleId FROM User WHERE Alias='Chatter' limit 1];
         
            u.ProfileId = ProFileUser.ProfileId;
			u.UserRoleId =  ProFileUser.UserRoleId;
        if(attributes.containsKey('User.LocaleSidKey')) {
        u.LocaleSidKey = attributes.get('User.LocaleSidKey');
        } else{
        u.LocaleSidKey = currentUser.LocaleSidKey;
        }
        if(attributes.containsKey('User.LanguageLocaleKey')) {
        u.LanguageLocaleKey = attributes.get('User.LanguageLocaleKey');
        } else{
        u.LanguageLocaleKey = currentUser.LanguageLocaleKey;
        }  
		if(attributes.containsKey('User.TimeZoneSidKey')) {
        u.TimeZoneSidKey = attributes.get('User.TimeZoneSidKey');
        } else{
        u.TimeZoneSidKey = currentUser.TimeZoneSidKey;
        }
        if(attributes.containsKey('User.UserRoleId'))
		{
            String userRole = attributes.get('User.UserRoleId');
            UserRole r = [SELECT Id FROM UserRole WHERE Id=:userRole];
           u.UserRoleId = r.Id;
        }
        if(attributes.containsKey('User.Phone')) 
		{
            u.Phone = attributes.get('User.Phone');
        }
        if(attributes.containsKey('User.Email')) {
            u.Email = attributes.get('User.Email');
        }
u.EmailEncodingKey = currentUser.EmailEncodingKey;
 
        //Handle custom fields here
 
        if(!create) {
            update(u);
        }
            u.IsActive = true;
		System.debug('!!!!Insert User::::'+u);
    }
 
    private void handleJit(boolean create, User u, Id samlSsoProviderId, Id communityId, Id portalId,
        String federationIdentifier, Map<String, String> attributes, String assertion) {
        if(communityId != null || portalId != null) {
            //String account = handleAccount(create, u, attributes);
            //handleContact(create, account, u, attributes);
            handleUser(create, u, attributes, federationIdentifier, false);
        } else {
            handleUser(create, u, attributes, federationIdentifier, true);
        }
    }
 
    global User createUser(Id samlSsoProviderId, Id communityId, Id portalId,
        String federationIdentifier, Map<String, String> attributes, String assertion) {
        User u = new User();
        handleJit(true, u, samlSsoProviderId, communityId, portalId,
            federationIdentifier, attributes, assertion);
        return u;

    }

 

    global void updateUser(Id userId, Id samlSsoProviderId, Id communityId, Id portalId,

        String federationIdentifier, Map<String, String> attributes, String assertion) {

        User u = [SELECT Id FROM User WHERE Id=:userId];

        handleJit(false, u, samlSsoProviderId, communityId, portalId,

            federationIdentifier, attributes, assertion);

    }
/* testUser = new User(Username='testvaliduser' +'@dell.com',
                                    Alias = 'Test', 
                                    Email='Test'+'@dell.com',            
                                    LastName='Test',
                                    ProfileId = profile.Id, 
                                    LanguageLocaleKey='en_US', 
                                    LocaleSidKey='en_US', 
                                    EmailEncodingKey='UTF-8', 
                                    TimeZoneSidKey='America/Los_Angeles',
                                    Badge_Number__c='Test'+System.currentTimeMillis());
        insert testUser; */
}