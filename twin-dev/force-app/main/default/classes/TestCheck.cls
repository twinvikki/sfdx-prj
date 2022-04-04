public class TestCheck {
    public String name;
    public Integer age;
    public Decimal sal;
    public Decimal bonus;
    public Long accno;
    public Decimal bal;
    
    public TestCheck (){
       system.debug('name:'+name);
       system.debug('age:'+age);
       system.debug('sal:'+sal);
       system.debug('accno:'+accno);
       system.debug('bal:'+bal);
    }

}