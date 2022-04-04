Public class A1
    {
    
    public List<Contact> a = [Select Name,MobilePhone, Fax from Contact limit 10];
    
    public List<Contact> b = [Select Name,MobilePhone, Fax from Contact limit 10];
    
    Public list<contact> geta()
    
    {
    
    return a;
    }
    
    Public list<Contact> getb()
    
    {
    
    return b;
    }
    
    
    
    }