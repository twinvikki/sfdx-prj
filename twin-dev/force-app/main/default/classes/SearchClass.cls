public class SearchClass {
    @auraenabled
    public static string fetchaccount(id recid){
        account acc = [select name from account where id=:recid];
        return acc.name;
    }

}