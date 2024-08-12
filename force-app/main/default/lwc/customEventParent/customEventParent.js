import { LightningElement } from 'lwc';

export default class CustomEventParent extends LightningElement {
    latestMessage = '';

    storeMessage(event){
        console.log(event.detail);
        this.latestMessage = event.detail;
    }
}