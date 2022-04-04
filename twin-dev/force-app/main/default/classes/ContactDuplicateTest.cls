@isTest 
public class ContactDuplicateTest {
  @isTest
    public static void CheckContactDuplicateMethod(){
        contact con = new contact();
        con.LastName = 'Vijahag';
        con.FirstName = 'ahdhbfo';
        con.Email = 'fdjhadn@gmail.com';
        con.Birthdate = Date.newInstance(2016, 12, 9);
        insert con;
        contact con1 = new contact();
        con1.LastName = 'Vijahag';
        con1.FirstName = 'ahdhbfo';
        con1.Email = 'fdjhadn@gmail.com';
        con1.Birthdate = Date.newInstance(2016, 12, 9);
        insert con1;
        ContactDuplicate c = new ContactDuplicate();
        c.checkcontact();
        
        
    }
}