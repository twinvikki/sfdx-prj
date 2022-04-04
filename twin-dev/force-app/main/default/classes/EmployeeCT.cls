public class EmployeeCT {
    public employeeobj__c empobj{get;set;}
    public string name{get;set;}
    public decimal salary{get;set;}
    public string dept{get;set;}
    public EmployeeCT(){
        empobj = new employeeobj__c ();
    }

    public void save()
    {
        employeeobj__c emp = new employeeobj__c();
        emp.name = name;
        emp.employeesalary__c = salary;
        emp.employeedepartment__c = dept;
        insert emp;
    }   
    public pagereference saverecord()
    {
        insert empobj;
        return null;
    }
}