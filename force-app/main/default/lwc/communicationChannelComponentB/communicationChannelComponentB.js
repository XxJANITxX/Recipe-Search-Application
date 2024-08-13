import { LightningElement, wire } from 'lwc';
import { publish, MessageContext, subscribe } from 'lightning/messageService';
import COMMUNICATION_CHANNEL from '@salesforce/messageChannel/CommunicationChannel__c';

export default class CommunicationChannelComponentB extends LightningElement {
    @wire(MessageContext)
    messageContext;

    subscription = null;
    receivedMessage = "No message recieved yet";

    connectedCallback(){
        if(!this.subscription){
            this.subscription = subscribe(
                this.messageContext,
                COMMUNICATION_CHANNEL,
                (payload) => this.handleMessage(payload)
             );
        }
    }

    handleMessage(payload){
        console.log('Received Payload: ', payload);
        this.receivedMessage = payload.message;
    }
}