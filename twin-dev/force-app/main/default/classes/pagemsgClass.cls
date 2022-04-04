public class pagemsgClass { 
    public string name{get;set;}
    student__C stu= new student__C();
    public pagereference save()
    {
        
        stu.Name=name;
        if(string.isNotBlank(stu.Name))
        {
        insert stu;
        }
        else
        {
            Apexpages.Message myMsg = new Apexpages.Message(ApexPages.Severity.ERROR,'Error:Enter Student name');
            ApexPages.addMessage(myMsg);
        }
        return null;
            
    }
}