public class LightningTreeControllerClass {
    // public static list<item> getObjectTree(Object ParentObj,Object ChildObj){
    @AuraEnabled
    public static list<item> getObjectTree(){
        list<item> items = new list<item>();
        list<Account> Acclist = new list<Account>();
        //  string query = 'select id,name,'+'(select id,name from'+ChildObj+') from'+ParentObj+'LIMIT 10';
        // objectlist = Database.query(query);
        Acclist = [SELECT Id, Name, (SELECT Id, Name From Contacts) From Account LIMIT 10];
        for(Account obj:Acclist){
            list<item> conitems = new list<item>();
            for(contact c:obj.contacts){
                item conitem = new item(c.name, string.valueOf(c.id), false, null);
                conitems.add(conitem);
            }
            item accitem = new item(obj.name, string.valueOf(obj.id),false,conitems);
            items.add(accitem);
        }
        return items;
    }
    //We need to create a private class whic we will be returning to Lightning
    public class item{
        @AuraEnabled
        public string label{get;set;}
        @AuraEnabled
        public string name{get;set;}
        @AuraEnabled
        public boolean expanded{get;set;}
        @AuraEnabled
        public list<item> items{get;set;}
        public item(string label, string name, boolean expanded,list<item> items){
            this.label = label;
            this.name = name;
            this.expanded = expanded;
            this.items = items;            
        }
    }
}