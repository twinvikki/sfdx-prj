trigger Cop on Account (after insert,after update) {
    list<opportunity> opp = new list<opportunity>();
    for(account a:trigger.new){
        if(a.annualrevenue > = 6000){
            opportunity o = new opportunity();
            o.name = a.name;
            o.CloseDate = system.today()+30;
            o.stagename = 'Qualification';
            o.AccountId = a.id;
           
            opp.add(o);
        }
        
    }
insert opp;
}