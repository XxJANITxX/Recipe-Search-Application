import { LightningElement, api, wire} from 'lwc';

// Importing required functions from lightning/uiRecordApi
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

// Importing references to fields (Video 8)
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';

export default class WireDemo extends LightningElement {
    
    // Using api decorator to fetch record id
    @api recordId;
    
    // Video 8
    // Importing references to fields
    // Using wire decorator to fetch the data
    /*
    @wire(getRecord, {recordId: '$recordId', fields: [NAME_FIELD, PHONE_FIELD]})
    record;

    // Returning required fields if record data is present using get field value function
    get name(){
        return this.record.data ? getFieldValue(this.record.data, NAME_FIELD): ''; 
    }
    
    // Returning required fields if record data is present using get field value function
    get phone(){
        return this.record.data ? getFieldValue(this.record.data, PHONE_FIELD): '';
    }
    */

    // Importing through objects - using fields through strings ( Video 8)
    @wire(getRecord, {recordId: '$recordId', fields:['Account.Name', 'Account.Phone']})
    record;

    get name(){
        // Either we can use if condition to handle error here
        return this.record.data ? getFieldValue(this.record.data, 'Account.Name'): '';
        
        // Or we can simply get the data like this, and use if condition in template itself
        // return this.record.data.field.Name.value;
    }
    
    get phone(){

        // return this.record.data.field.Phone.value;
        return this.record.data ? getFieldValue(this.record.data, 'Account.Phone'): '';
    }

}