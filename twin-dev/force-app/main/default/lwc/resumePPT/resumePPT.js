import { LightningElement } from 'lwc';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';
import jspdf from '@salesforce/resourceUrl/jspdf';
export default class ResumePPT extends LightningElement {
    myVal = '**Hello**';
    formats = ['font', 'size', 'bold', 'italic', 'underline',
       'strike', 'list', 'indent', 'align', 'link',
       'image', 'clean', 'table', 'header', 'color'];

    renderedCallback(){
        Promise.all([
            loadScript(this, jspdf+'/jspdf/jspdf.umd.min.js'),
        ])
    }
    savePDF(event)
    {
        console.log('pdf-->');
        console.log('this.jspdf'+JSON.stringify(window.jspdf));
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();
        doc. text(10, 10, 'Hello world! ');
        doc. save('hello-world. pdf');
    }
       
}