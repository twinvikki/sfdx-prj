global class batchNotifiyInactive implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'select id,profile.name,name,isactive,CreatedDate,email,LastLoginDate from user';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC,list<User> scope)
    {
        datetime dt = system.today();
        List<Messaging.SingleEmailMessage> allMsg = new list<Messaging.SingleEmailMessage>();
        for(User u:scope)
        {
            if(u.isactive !=  false)
            {
              // Integer noOfDays = u.LastLoginDate.daysBetween(dt);
               // system.debug('noOfDays->'+noOfDays);
                system.debug('noOfDays-->'+u.LastLoginDate);
                Decimal days;
                if(u.LastLoginDate != null )
                {
                     days = Integer.valueOf((dt.getTime() - u.LastLoginDate.getTime())/(1000*60*60*24));
                }
                else
                {
                     days = Integer.valueOf((dt.getTime() - u.CreatedDate.getTime())/(1000*60*60*24));
                }
				System.debug('Days : ' + days);
                if(days >= 7)
                {
                    list<string> toAddress = new list<string>();
                    list<string> ccEmailIds = new list<string>();
                    toAddress.add(u.email);
                    Emailtemplate tpl = [select id,subject,DeveloperName, body,HtmlValue from EmailTemplate where DeveloperName ='inActive' limit 1];
                    string simpleBody = tpl.body;
                     String htmlBody = tpl.HtmlValue;
                    ccEmailIds.add('vikranth.karollu@mindtree.com');
                    Messaging.SingleEmailMessage ml = new Messaging.SingleEmailMessage();
                    ml.setTemplateId(tpl.Id);
                    ml.setToAddresses(toAddress);
                    ml.setTargetObjectId(u.Id);
                    ml.setSubject(tpl.Subject);
                    ml.setPlainTextBody(simpleBody);
                    ml.setHtmlBody(htmlBody);
                    ml.setBccSender(false);
                    ml.setSaveAsActivity(false);
                    ml.setUseSignature(false);
                    ml.setCcAddresses(ccEmailIds);
                    allmsg.add(ml);
                    
                }
            }
        }
        List<Messaging.SendEmailResult> results = Messaging.sendEmail(allmsg,false);
        system.debug('results--->'+results);
    }
    global void finish(Database.BatchableContext BC) {
        
    }

}