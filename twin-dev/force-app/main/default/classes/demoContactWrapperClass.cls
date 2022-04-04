public class demoContactWrapperClass {
    
    @AuraEnabled
    public static list<Contact> getContacts(Id recordId)
    {
        
        List<Contact> Conlist = [Select id,firstname,lastname from Contact where AccountId =: recordId ];
        return Conlist;
    }
    //add upto here only
    @AuraEnabled
    public static void updateRelatedList(List<Contact> Conlist)
    {
        if(Conlist!= null && Conlist.size()>0)
        {
            update Conlist;
        }
    } 
}