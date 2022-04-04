public class FutureClassExample {

    public static void MethodForMixedDML(){
        Account a = new account(Name='TestDML');
        
        profile p = [select id from profile limit 1];
        User u = new User(Alias = 'sta123', Email='standarduser123@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='standarduse12312r@testorg.com');
        insert u;
        insert a;
    }
}