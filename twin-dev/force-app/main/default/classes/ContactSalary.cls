public class ContactSalary {
    
    public static void contactSalaryUpdate(list<contact> newlist)
    {
        set<id> accId = new set<id>();
        list<Account> accnames = new list<Account>();
        for(contact con:newlist)
        {
            accId.add(con.accountid);
        }
        List<Account> accs=new List<Account>([select id, Average_Salary__c,(select id,Name,Salary__c from contacts) from Account where id in:accId]);
        decimal n=0.00;
        for(Account a:accs){
            for(Contact c1:a.Contacts){
                n=n+c1.Salary__c ;
            }
            a.Average_Salary__c=n;
            accnames.add(a);
        }
        if(accnames.size()>0)
        {
            update accnames;
        }
        
    }
    public static void contactSalaryUpdate(list<contact> newlist,map<id,contact>oldMap)
    {
        set<id> oldaccId = new set<id>();
        set<id> newaccId = new set<id>();
        list<Account> accnames = new list<Account>();
        for(contact con:newlist)
        {
            if(oldmap.get(con.id).AccountId != con.accountId)
            {
                newaccId.add(con.accountid);
                oldaccId.add(oldmap.get(con.id).AccountId);
            }
            if(oldmap.get(con.id).Salary__c != con.Salary__c) 
            {
                newaccId.add(con.accountid);
            }
        }
        if(newaccId.size()>0)
        {
            List<Account> accs=new List<Account>([select id, Average_Salary__c,(select id,Name,Salary__c from contacts) from Account where id in:newaccId]);
            decimal n=0.00;
            for(Account a:accs){
                for(Contact c1:a.Contacts){
                    n=n+c1.Salary__c ;
                }
                a.Average_Salary__c=n;
                accnames.add(a);
            }
            if(oldaccId.size()>0)
            {
                List<Account> Oldaccs=new List<Account>([select id, Average_Salary__c,(select id,Name,Salary__c from contacts) from Account where id in:oldaccId]);
                decimal n1=0.00;
                for(Account a1:Oldaccs){
                    for(Contact c2:a1.Contacts){
                        n1=n1+c2.Salary__c ;
                    }
                    a1.Average_Salary__c=n1;
                    accnames.add(a1);
                }            
            }
            
            if(accnames.size()>0)
            {
                update accnames;
            }
            
        }
    }
}