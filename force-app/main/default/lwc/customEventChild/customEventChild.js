import { LightningElement } from 'lwc';

export default class CustomEventChild extends LightningElement {

    sendToParent(){
        console.log("Parent Method got called");

        // Fetching input value in variable
        const inputValue = this.template.querySelector('lightning-input').value;
        // Creating custom event and sendiing it to parent
        // CustomEvent is a built-in lightning component
        // It is a constructor which takes two parameters
        // 1st parameter is event name
        // 2nd parameter is payload
        // payload is any kind of data that we want to send to parent component
        this.dispatchEvent(new CustomEvent('send', {detail: inputValue}));
    }

}