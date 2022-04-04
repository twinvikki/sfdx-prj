import { LightningElement,track,wire,api } from 'lwc';
import searchCustomerData from '@salesforce/apex/CustomerSearchLWCController.searchCustomerData';
import fetchQuestions from '@salesforce/apex/CustomerSearchLWCController.fetchQuestions';
import { NavigationMixin } from 'lightning/navigation';
//import SVG_URL from '@salesforce/resourceUrl/svg_url';
export default class CustomerData extends NavigationMixin(LightningElement) {
    @track custEmail;
    @track custPhone;
    @track custId;
    @track contactInfo;
    @track contactPass;
    @track questionsInfo;
    @track showresetScreen = false;

    enableButtons(event)
    {
        console.log('check input');
        this.isButtonDisabled = false;
    }
    handleSubmit(){
        console.log('handle submit');
        var inp = this.template.querySelectorAll("lightning-input");
        console.log('inp-->'+inp);
        inp.forEach(function(element){
            console.log(element.name);
            console.log(element.value);
            if(element.name =="inpEmail")
            {
                this.custEmail = element.value;
            }
         if(element.name == "inpPhone")
            {
                this.custPhone = element.value;
            } if(element.value == "inpID")
            {
                console.log('inpId');
                this.custId = element.value;
            }

        },this);  
        console.log('search-->'+ this.custId);     
        searchCustomerData({emailValue : this.custEmail,
                            phoneValue : this.custPhone,
                            idValue: this.custId})
        .then(result =>{
            if(result == null)
            {
                console.log('null Value');
            }
            else
            {
                this.contactInfo = result;
                this.showresetScreen = true;
                console.log('coninfp:-->'+JSON.stringify(this.contactInfo));
            }
          
        })
        .catch(error =>{
          this.error = error;
        });
    }
    refreshScreen(){
       // this.contactPass = this.contactInfo;
        this.contactInfo = null;
        this.showresetScreen = false;
    }
    fetchQuestions(){
       // console.log('con'+this.contactInfo);
        fetchQuestions({
            pubConId : this.contactInfo.Id
        })
        .then(result=>{
          if(result == null)
          {
            
          }
          else
          {
            this.contactPass = this.contactInfo;
            this.contactInfo = null;
            this.questionsInfo = result;
          }
        })
        .catch(error=>{

        });
    }
    launcCustomerScreen(){
        console.log('contactinfo-->'+this.contactPass);
       var compDefinition = {
            componentDef:"c:customerDisplayScreen",
            attributes:{
                contactId:this.contactPass.Id
             }
       };
       //Base64 encode the compDefinition JS object
       var encodedCompDef = btoa(JSON.stringify(compDefinition));
       console.log('encodedCompDef-->'+encodedCompDef);
       this[NavigationMixin.Navigate]({
           type: 'standard__webPage',
           attributes:{
               url : 'https://vikranth-dev-ed.lightning.force.com/one/one.app#' + encodedCompDef
           }

       });
    }
}