public class Class22018{
//access modifiers-- Private,Public,Global,Protected 
//Private- This is default. It means method or variable is accessed only within this particular class(or in which class it is defined).
//If we dont specify any access modifiers then it is by default private.
    private string name; 
    private string PrivateMethod(string N){   
        n = name;
        system.debug('name in method:' +n);
        system.debug('name in method:' +name);
        return n;    
    }
//Public- This means the method or  variable can be used by any apex in this application or namespace
    public string color;
//Global- This means the method or variable can be used by any apexcode that has access to the class not
//just the apex code in same application.
//    global integer num;
    public integer num;
    public class22018(){
       this.color = color;
       this.num = num;
       system.debug('number num:' +num);
       system.debug('color name:' +color);
        
    }


}