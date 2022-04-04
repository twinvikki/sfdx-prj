public class AS4EmployeeTriggerHandler {
    public static void AS4EmployeeDeptReportCreate(list<AS4Employee__C> NewList){
        map<id,id> DepComRecId = new map<id,id>();
        set<id> Deptid = new set<id>();
        string Quarter, QuarterDeptId;
        map<string,id> DeptReptId = new map<string,id>();
        map<integer,id> QuarterReptId = new map<integer,id>();
        set<id> Employeeid = new set<id>();
        for(AS4CompanyReport__c ComRep:[select id,Department__c,Quarter__C from AS4CompanyReport__c])
        {    
           system.debug('Dept:'+ComRep.Department__c+'Quarter:'+ComRep.Quarter__C);
           Deptid.add(ComRep.Department__c);
        }
        
        for(AS4Department__c Dept:[select id,company__c from AS4Department__c ])
        {
            if(!DepComRecId.containskey(Dept.id))
            {
                DepComRecId.put(Dept.id,Dept.company__c);               
            }
        }
        for(AS4Employee__c Empl:[select id from AS4Employee__c where id != null])
        {   if(Empl.id != Null)
            {
            system.debug('id:'+Empl.id);
            Employeeid.add(empl.id);            
            }
        }
        list<AS4CompanyReport__c> AS4ReportList = new list<AS4CompanyReport__c> ();
        for(AS4Employee__c Emp: NewList)
        {
        system.debug('list:'+newlist);
        system.debug('Month:'+Emp.Joining_Date__c.month());
        system.debug('Dept__c:'+emp.Department__c);
        if(Emp.Joining_Date__c.month() == 01 || Emp.Joining_Date__c.month() == 02 || Emp.Joining_Date__c.month() == 03  ){Quarter = 'Q1';}
        else
        if(Emp.Joining_Date__c.month() == 04 || Emp.Joining_Date__c.month() == 05 || Emp.Joining_Date__c.month() == 06  ){Quarter = 'Q2';}
        else
        if(Emp.Joining_Date__c.month() == 07 || Emp.Joining_Date__c.month() == 08 || Emp.Joining_Date__c.month() == 09  ){Quarter = 'Q3';}
        else {Quarter = 'Q4'; }
        system.debug('Quarter:'+Quarter);
        QuarterDeptId = Quarter+emp.Department__c;
        system.debug('QD:'+QuarterDeptId);
        system.debug(Deptid.contains(emp.Department__c));
        system.debug(!employeeid.contains(emp.id));
        if(Deptid.contains(emp.Department__c) && !employeeid.contains(emp.id))
        {   
            for(AS4CompanyReport__c CRQuery:[Select id,Department__c,Employee_Count__c
                                                         from AS4CompanyReport__c 
                                                        where Department__c =:emp.Department__c and Quarter__c=:Quarter])
            {
               system.debug('Query:'+CRQuery);
               system.debug(!DeptReptId.Containskey(QuarterDeptId));
               if(!DeptReptId.Containskey(QuarterDeptId))
               {
                  DeptReptId.put(QuarterDeptId,CRQuery.id);
                  CRQuery.Employee_Count__c = CRQuery.Employee_Count__c + 1;
                  AS4ReportList.add(CRQuery);               
               }                                      
             }
         }
         else
         system.debug(Deptid.isEmpty());
         system.debug(!Deptid.contains(emp.Department__c));
         system.debug(!DeptReptId.Containskey(QuarterDeptId));
         system.debug(!Employeeid.contains(emp.id));
         system.debug(emp.id);
         if(!DeptReptId.Containskey(QuarterDeptId) && !Employeeid.contains(emp.id) )
         { 
            AS4CompanyReport__c CR = new AS4CompanyReport__c();
              if(DepComRecId.containskey(Emp.Department__c))
              {   
                    CR.Company__c = DepComRecId.get(Emp.Department__c);
              }  
                    CR.Department__c = Emp.Department__c;
                    CR.Year__c = Emp.Joining_Date__c.year();
                    CR.Employee_Count__c = 1;
 
              if(Emp.Joining_Date__c.month() == 01 ||Emp.Joining_Date__c.month() == 02 || Emp.Joining_Date__c.month() ==03){CR.Quarter__c = 'Q1';}
              else
              if(Emp.Joining_Date__c.month() == 05 || Emp.Joining_Date__c.month() == 04 || Emp.Joining_Date__c.month() ==06){CR.Quarter__c = 'Q2';}  
              else
              if(Emp.Joining_Date__c.month() == 07 || Emp.Joining_Date__c.month() ==08 || Emp.Joining_Date__c.month() == 09){CR.Quarter__c = 'Q3';}
              else 
              if(Emp.Joining_Date__c.month() == 10 || Emp.Joining_Date__c.month() == 11 || Emp.Joining_Date__c.month() ==12){CR.Quarter__c = 'Q4';}               
              DeptReptId.put(CR.Department__c+CR.Quarter__c,CR.id);
              AS4ReportList.add(CR);
              system.debug('true');
        }    
        }
        if(AS4ReportList.size()>0)
        {
            upsert AS4ReportList;
        }
       }
    
    
    public static void AS4EmployeeDeptReportUpdate(list<AS4Employee__c> NewList,map<id,AS4Employee__c> oldmap)
    { 
        list<AS4CompanyReport__c> ReportListUpdate = new list<AS4CompanyReport__c> ();
        map<string,id> DepReportId = new map<string,id>();
        Id NewDeptId;
        Id OldDeptId;
        string Quarter;
       
        for(AS4CompanyReport__c CR: [select id,Department__c,Quarter__c from AS4CompanyReport__c])
        {  
           system.debug('Cr id:'+cr.id);
           system.debug('Dept:'+CR.Department__c+'Quart:'+CR.Quarter__c);
           DepReportId.put(CR.Department__c,CR.id);
           system.debug(DepReportId.get(CR.Department__c));
        }
        for(AS4Employee__c EmpRec: NewList)
        {   system.debug('Emprec id:');
            if(EmpRec.Joining_Date__c.month() == 01 || EmpRec.Joining_Date__c.month() == 02 || EmpRec.Joining_Date__c.month() == 03  ){Quarter = 'Q1';}
            else
            if(EmpRec.Joining_Date__c.month() == 04 || EmpRec.Joining_Date__c.month() == 05 || EmpRec.Joining_Date__c.month() == 06  ){Quarter = 'Q2';}
            else
            if(EmpRec.Joining_Date__c.month() == 07 || EmpRec.Joining_Date__c.month() == 08 || EmpRec.Joining_Date__c.month() == 09  ){Quarter = 'Q3';}
            else {Quarter = 'Q4'; }
            
            system.debug('Quarter:'+Quarter);
            system.debug('Depat:'+Emprec.department__c);
            system.debug(oldmap.containskey(Emprec.id));
            
            if(oldmap.containskey(Emprec.id))
            { 
             system.debug(oldmap.get(Emprec.id).Joining_Date__c == Emprec.Joining_Date__c);
             system.debug(oldmap.get(Emprec.id).department__c != Emprec.Department__c);
             if(oldmap.get(Emprec.id).department__c != Emprec.Department__c &&
                oldmap.get(Emprec.id).Joining_Date__c == Emprec.Joining_Date__c)
                {
                  NewDeptId = Emprec.Department__c;  
                  system.debug('New Dept id'+NewDeptId);
                  OldDeptId = oldmap.get(Emprec.id).department__c; 
                  system.debug('Old Dept id'+OldDeptId);
                } 
            }
            
            system.debug(DepReportId.containskey(OldDeptId));
            system.debug(DepReportId.containskey(NewDeptId));
            
            if(DepReportId.containskey(OldDeptId))
            { 
                for(AS4CompanyReport__c CR: [select Employee_Count__c from AS4CompanyReport__c where Department__c =:OldDeptid 
                                             and Quarter__c =:Quarter ])
                {   system.debug('Before:'+CR.Employee_Count__c);
                    system.debug('After:'+CR.Employee_Count__c);
                    CR.Employee_Count__c = CR.Employee_Count__c - 1;
                    system.debug('After:'+CR.Employee_Count__c);
                    reportlistupdate.add(cr);
                }
            }
            
            if(DepReportId.containskey(NewDeptId))
            {
                for(AS4CompanyReport__c CR: [select Employee_Count__c from AS4CompanyReport__c where Department__c =:NewDeptId 
                                             and Quarter__c =:Quarter])
                {   system.debug('Before:'+CR.Employee_Count__c);
                    CR.Employee_Count__c = CR.Employee_Count__c + 1;
                    system.debug('After:'+CR.Employee_Count__c);
                    reportlistupdate.add(cr);
                }
            }            
        }
        
        if(ReportListUpdate.size()>0)
        {
           update ReportListUpdate;
        }        
    }
    public static void AS4EmployeeDelete(list<AS4Employee__c> OldList)
    {
        string Quarter;
        list<AS4CompanyReport__c> CompReport = new list<AS4CompanyReport__c>();
        for(AS4Employee__c EmpRec: OldList)
        {   system.debug('Emprec id:');
            if(EmpRec.Joining_Date__c.month() == 01 || EmpRec.Joining_Date__c.month() == 02 || EmpRec.Joining_Date__c.month() == 03  ){Quarter = 'Q1';}
            else
            if(EmpRec.Joining_Date__c.month() == 04 || EmpRec.Joining_Date__c.month() == 05 || EmpRec.Joining_Date__c.month() == 06  ){Quarter = 'Q2';}
            else
            if(EmpRec.Joining_Date__c.month() == 07 || EmpRec.Joining_Date__c.month() == 08 || EmpRec.Joining_Date__c.month() == 09  ){Quarter = 'Q3';}
            else {Quarter = 'Q4'; }
            for(AS4CompanyReport__c CR:[select id,department__c,Quarter__c,Employee_Count__c from AS4CompanyReport__c 
                                        where Department__c =: EmpRec.Department__c and Quarter__c =: Quarter])
            {  system.debug('id:'+CR.id);
               CR.Employee_Count__c = CR.Employee_Count__c - 1;
               CompReport.add(CR);
            }
         if(CompReport.size()>0)
         {
             update CompReport;
         }
        }
    }
    public static void AS4EmployeeUnDelete(list<AS4Employee__c> NewList)
    {
        string Quarter;
        list<AS4CompanyReport__c> CompReport = new list<AS4CompanyReport__c>();
        for(AS4Employee__c EmpRec: NewList)
        {   system.debug('Emprec id:');
            if(EmpRec.Joining_Date__c.month() == 01 || EmpRec.Joining_Date__c.month() == 02 || EmpRec.Joining_Date__c.month() == 03  ){Quarter = 'Q1';}
            else
            if(EmpRec.Joining_Date__c.month() == 04 || EmpRec.Joining_Date__c.month() == 05 || EmpRec.Joining_Date__c.month() == 06  ){Quarter = 'Q2';}
            else
            if(EmpRec.Joining_Date__c.month() == 07 || EmpRec.Joining_Date__c.month() == 08 || EmpRec.Joining_Date__c.month() == 09  ){Quarter = 'Q3';}
            else {Quarter = 'Q4'; }
            for(AS4CompanyReport__c CR:[select id,department__c,Quarter__c,Employee_Count__c from AS4CompanyReport__c 
                                        where Department__c =: EmpRec.Department__c and Quarter__c =: Quarter])
            {  system.debug('id:'+CR.id);
               CR.Employee_Count__c = CR.Employee_Count__c + 1;
               CompReport.add(CR);
            }
         if(CompReport.size()>0)
         {
             update CompReport;
         }
        }
    }

  
}