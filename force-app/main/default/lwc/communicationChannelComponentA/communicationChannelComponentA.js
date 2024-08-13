import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import COMMUNICATION_CHANNEL from '@salesforce/messageChannel/CommunicationChannel__c';

export default class CommunicationChannelComponentA extends LightningElement {
    @wire(MessageContext)
    messageContext;

    handleButtonClick(){
        const messageInput = this.template.querySelector('lightning-input').value;
        const payload = {message: messageInput};
        publish(this.messageContext, COMMUNICATION_CHANNEL, payload);
    }
}