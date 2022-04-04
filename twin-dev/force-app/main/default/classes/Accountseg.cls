public class Accountseg {
    public list<account> Act;
    public Accountseg(Apexpages.StandardController controller) {
        
    }
    public list<account> gettech() {
        act = [select id,name,phone,fax,industry from account limit 10];
        return act;
    }
}