trigger RollupOpp on Opportunity (after insert,after update,after delete) {
     list<opportunity> opprt = new list<opportunity>();
     list<account> acc = new list<account>();
    set<id> idset = new set<id>();
    if(trigger.isinsert){
        for(opportunity opp : trigger.new)
        {
            idset.add(opp.accountid);
        }
    }
    if(trigger.isupdate){
        for(opportunity opp: trigger.old)
        {
            idset.add(opp.accountid);
        }
    }
}