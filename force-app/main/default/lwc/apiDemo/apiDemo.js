import { LightningElement, api } from 'lwc';

export default class apiDemo extends LightningElement {
    // Private Property
    message = 'Private Property';
    // Public property
    @api recordId;
}