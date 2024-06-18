import { LightningElement, api, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController2SanGup.getContacts';

import { getRecord } from 'lightning/uiRecordApi';

export default class WireDemo2 extends LightningElement {
    
    // Fetching recordId using public api
    @api recordId;

    // These are the two ways to fetch the data from salesforce database as properties
    
    // 1- Using uiRecordApi
    @wire(getRecord, {recordId:'$recordId', fields:'Account.Name'})
    record;     // Property will have both Data and Error

    get name(){
        return this.record.data.fields.Name.value;
    }

    // 2- Using apex controller in the back and fetching data by passing recordId from frontend
    @wire(getContacts, {accId: '$recordId'})
    contacts;   // Property will have both Data and Error

    // Variables to store the list of contacts retrieved
    contactsData;
    error;

    // To fetch data as method -
    @wire(getContacts, {accId:'$recordId'})
    contactsMethod({error, data}){
        if(data){
            this.contactsData = data;
            this.error = undefined;
        }else if(error){
            this.error = error;
            this.contactsData = undefined;
        }
    }
}