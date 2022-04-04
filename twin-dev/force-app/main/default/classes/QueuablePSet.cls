public class QueuablePSet implements Queueable {
    list<id> Idlist = new list<id>();
    Integer r;
    public void execute(QueueableContext context)
    {
        list<PermissionSetAssignment> PermissionSetList = new list<PermissionSetAssignment>();
        for(user u:[select id,name,userrole.name from user where Profile.UserLicense.Name  = 'Salesforce Platform' 
                    and userrole.name like 'FSR%'])
        {
            system.debug('userid'+u.id);  
            Idlist.add(u.id);
        }
        for(PermissionSet ps:[select id,name from PermissionSet where name=:'Trailhead' ])
        {
            system.debug(ps);
            for(Id eachid : idlist){
                PermissionSetAssignment p = new PermissionSetAssignment();
                p.PermissionSetId=ps.id;
                p.AssigneeId = eachid;
                system.debug('p:'+p);
                PermissionSetList.add(p);
                system.debug(permissionsetlist);
                system.debug('p:'+p.ID);
            }            
            if(PermissionSetList.size()>0)
            {
                insert PermissionSetList;
            }            
        }              
    }    
}