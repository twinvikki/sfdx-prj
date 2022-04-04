/*
MIT License

Copyright (c) 2020 Playground, https://www.playg.app

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
import { LightningElement, track } from 'lwc';

export default class LightningSpinnerDemo extends LightningElement {
    @track size = 'small';
    @track variant = 'brand';
    @track spinnerText = 'Loading...';
    @track textPosition = 'bottom';

    get sizeOptions() {
        return [
            { label: 'Small', value: 'small' },
            { label: 'Medium', value: 'medium' },
            { label: 'Large', value: 'large' },
        ];
    }

    get variantOptions() {
        return [
            { label: 'None', value: '' },
            { label: 'Brand', value: 'brand' },
            { label: 'Inverse', value: 'inverse' },
        ];
    }

    get positionOptions() {
        return [
            { label: 'Bottom', value: 'bottom' },
            { label: 'Top', value: 'top' },
        ];
    }

    handleVariantChange(event) {
        this.variant = event.detail.value;
    }

    handleTextChange(event) {
        this.spinnerText = event.detail.value;
    }

    handleSizeChange(event) {
        this.size = event.detail.value;
    }

    handlePositionChange(event) {
        this.textPosition = event.detail.value;
    }
}