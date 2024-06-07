import { LightningElement, api, wire, track } from 'lwc';
import getContacts from '@salesforce/apex/ContactControllerSanjayGupta.getContacts';
import {refreshApex} from '@salesforce/apex';
import {updateRecord} from 'lightning/uiRecordApi';

export default class FirstLWC extends LightningElement {
    name;
    // company = 'Tech School';
    // designation = 'Founder';
    // salary = '$1000000';

    @api recordId;

    @wire(getContacts, {contactId: '$recordId'})
    contacts({data, error}){
        if(data){
            console.log('Data - ',data, typeof(data));
            this.name = data[0].Name;
        }else{
            console.log('Error - ', error);
        }
    }
    
}