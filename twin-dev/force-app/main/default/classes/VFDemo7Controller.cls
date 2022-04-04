public class VFDemo7Controller {
    public boolean ShowEdit{get;set;}
    public Account acc{get; set;}
    Id accId;
    public VFDemo7Controller()
    {
        acc = new Account();
        accId = apexpages.currentPage().getParameters().get('recId');
        if(accId != null)
        {

            for(Account a :[SELECT Name,Rating
                            FROM Account
                            WHERE Id = :accId])
            {
                acc = a;
            }
        }
        if(accId!=null)
        {
           ShowEdit = false;
        }
        else
        {
           ShowEdit = True;
        }
    }
    public void save()
    {
        upsert acc;
        ShowEdit=false;
    }
    public PageReference cancel()
    {
        PageReference ref = new PageReference('/001/o');
        return ref;
    }
    public void Edit()
    {
      showedit = true;
    }
}