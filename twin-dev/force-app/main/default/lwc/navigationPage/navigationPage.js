import { LightningElement } from 'lwc';
export default class NavigationPage extends LightningElement {

    showHomePage = true;
    homeButton(event) {
        console.log('event--->');
        this.showHomePage = true;
    }
}