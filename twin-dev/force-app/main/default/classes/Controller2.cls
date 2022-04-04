public class Controller2 {
    public String inputText2 {get;set;}
    public Controller2(){
        system.debug(inputText2);
        system.debug(apexpages.currentpage().getparameters().get('att'));
        inputText2 = apexpages.currentpage().getparameters().get('att');
        system.debug(inputText2);
   }
}