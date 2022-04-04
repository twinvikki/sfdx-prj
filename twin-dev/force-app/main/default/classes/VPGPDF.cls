public class VPGPDF {
    public list<account> a;
    public list<contact> b;
    public VPGPDF(Apexpages.StandardController controller){
        
    }
    public list<Account> getdetail(){
        a = [select id,name,fax,industry,phone from account  limit 10];
        return a;
    }
   public list<Contact> getAll(){       
        b = [select name,leadsource,phone from contact limit 10 ];
        return b;
    }
}