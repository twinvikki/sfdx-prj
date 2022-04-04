public class Test281217 {
    public integer id;
    public string name;
    public boolean elgib = null;
    public long constant1;
    static final integer constant2 = 100;  //declaring constant
    public void clalculatemethod (){
        if (constant1 >= constant2){
            elgib = true;
            system.debug('display information');
        }
    }
    public void Test281217 (integer myid, string name2){
        myid = id;
        name2 = name;
        system.debug('name2');
        system.debug('myid');
    }
}