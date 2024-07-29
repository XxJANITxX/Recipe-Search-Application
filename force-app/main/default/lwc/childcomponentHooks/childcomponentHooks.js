import { LightningElement } from 'lwc';

export default class ChildcomponentHooks extends LightningElement {

    // Child component hooks
    constructor(){
        super();
        
        console.log("Child Call Recieved from Constructor");
    }

    connectedCallback(){
            console.log("Child Call Recieved from Connected Call Back");
    }

    renderedCallback(){
            console.log("Child Call Recieved from Rendered Call Back");
    }

    disconnectedCallback(){
            console.log("Child Call Recieved from Disconnected Call Back");
    }


}