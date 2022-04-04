import { LightningElement } from 'lwc';

export default class DemoInput extends LightningElement {
    inputValue;
    outputValue;

    handleChange(event)
    {
        this.outputValue = event.detail.value;
    }
}