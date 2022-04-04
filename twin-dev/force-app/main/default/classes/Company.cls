public class Company {
    private string Emp_name;  
    private Integer Emp_number;
    Private String Emp_BloodGrp;
    Public void setEmp_name(string Emp_Name)
    {
        this.Emp_Name=Emp_Name;
    }
    Public void setEmp_number(integer Emp_number)
    {
        this.Emp_number=Emp_number;
    }
    Public void setEmp_BloodGrp(string Emp_BloodGrp)
    {
        this.Emp_BloodGrp=Emp_BloodGrp;
    }
    public string getEmp_name()
    {
        return Emp_Name;
    }
    Public integer getEmp_number()
    {
        return Emp_number;
    }
    Public string getEmp_BloodGrp()
    {
        return Emp_BloodGrp;
    }
    public void Details()
    {
        system.debug('This is Companys employee data');
    }     
}