import { LightningElement } from 'lwc';

export default class ComponentHooks extends LightningElement {

    // Parent component hooks
    constructor(){
        super();

        console.log("Call Recieved from Constructor");
    }

    connectedCallback(){
        console.log("Call Recieved from Connected Call Back");
    }

    renderedCallback(){
        console.log("Call Recieved from Rendered Call Back");
    }

    errorCallback(){
        console.log("Call recieved from error callback");
    }

}