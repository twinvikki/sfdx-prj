public with sharing class demoContactTableController {
    @AuraEnabled(cacheable=true)
    public static list<contact> methodName(){
        try {
            list<Contact> lCon = new list<contact>();
            lCon = [select id,name,CreatedDate,email from contact order by CreatedDate  desc limit 10];
            return lCon;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}