public class rollUpCountAccount {

    public static void rolluponAccount(list<contact> newlist)
    {
        system.debug('newlist-->'+newlist);
        set<id> sAccId = new set<id>();
            for(contact con:newlist)
        	{ 
           		sAccId.add(con.accountId);
        	}
        map<id,integer> mRollCount = new map<id,integer>();
        system.debug('acc-->'+sAccId);
        for(contact con:[select id,accountId from contact where accountId IN: sAccId ])
        {
            if(mRollCount.containskey(con.AccountId))
            {
                integer rc = mRollCount.get(con.AccountId);
                rc++;
                mRollCount.put(con.AccountId,rc);
            }
            else
            {
                 integer rc = 1;
                 mRollCount.put(con.AccountId,rc);
            }
        }
        list<account> lAcc = new list<account>();
        for(Account acc:[select id,rollupexample__c from account where id IN:sAccId])
        {
            if(mRollCount.containskey(acc.id))
            {
                acc.rollupexample__c = mRollCount.get(acc.Id);
                lAcc.add(acc);
            }
        }
        if(lAcc.size()>0)
        {
            update lAcc;
        }
    }
}