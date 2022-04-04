public class VFDemo4AccountExtension {
    string recordTypeid;
    string rtAdded;
    public VFDemo4AccountExtension(ApexPages.StandardController stdController)
    {
        recordTypeid = ApexPages.currentPage().getParameters().get('RecordType');
    }
    
    public PageReference checkRecordType()
    {
        id SampleRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Sample').getRecordTypeId();
        id BrokerRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Broker').getRecordTypeId();
        PageReference ref;
        if(SampleRecordTypeId == recordTypeId && rtAdded == null)
        {
           ref = new PageReference('/apex/VFDemo4Account?rtAdded=true&recordtypeid='+recordtypeid);
        }
        if(SampleRecordTypeId == recordTypeId && rtAdded != null){
            return null;
        }
        if(recordTypeId == brokerRecordTypeId)
        {
           ref = new PageReference('/apex/VFDemo4AccountBroker?recordtypeid='+recordtypeid);
        }
    //    ref.setRedirect(true);
        return ref;
    }
}