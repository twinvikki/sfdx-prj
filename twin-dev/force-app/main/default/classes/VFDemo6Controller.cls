public class VFDemo6Controller {
    public boolean Showpanel{get;set;}
    public list<account> acc{get;set;}
    public VFDemo6Controller(){
        showpanel = false;
        acc = new list<account>();
        acc = [select id,name,accountnumber,ownerid from account limit 10];
    }
    public void save(){
        
    }
    public void cancel(){
        
    }
}