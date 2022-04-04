public class TestCheck2 {
    public string myname;
    public integer age;
    public string comname;
    public integer elgibility;
    list<string> mylist = new list<string> {'deal','deded'};
    public TestCheck2() {
       myname = 'Vikranth';
        age = 23;
        comname = 'wipro technologies';
        elgibility = 3;
        mylist.add('Vikki');
        mylist.get(0);
        mylist.set(2,'la');
        system.debug('Test');
        system.debug('myls	it' +mylist[2]);
        system.debug('myls	it' +mylist);
    }
    
    public string CheckElgibility(){
        string myname = mylist.get(0);
         system.debug('myls	it' +myname);
        System.debug('You elgible');
        if (elgibility >=3) {
            mylist.add('myname');
            System.debug('You elgible');
            system.debug('mylsit2' +mylist);
           
        }
        return myname;
    }

  
}