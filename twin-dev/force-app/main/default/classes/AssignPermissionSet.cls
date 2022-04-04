global class AssignPermissionSet {
    @future
    static void AssignPermissionSettousers()
    {
        set<id> userid;
        id useridfor;
        set<id> permision;
        list<PermissionSetAssignment> PermissionSetList = new list<PermissionSetAssignment>();
        for(user u:[select id,name,userrole.name from user])
        {
            if(u.userrole.name == 'FSR')
            {
            system.debug('userid'+useridfor);
            userid.add(u.id);
            useridfor = u.id;
            system.debug('userid'+useridfor);                
            }

        }
        for(PermissionSet ps:[select id,name from PermissionSet where name=:'Trailhead'])
        {
            system.debug(ps);
            permision.add(ps.id);
            PermissionSetAssignment p = new PermissionSetAssignment();
            p.assigneeid = useridfor;
            p.PermissionSetId=ps.id;
            system.debug('p:'+p);
            PermissionSetList.add(p);
            system.debug(permissionsetlist);
        }        
       
        if(PermissionSetList.size()>0)
        {
            insert PermissionSetList;
        }
    }

}