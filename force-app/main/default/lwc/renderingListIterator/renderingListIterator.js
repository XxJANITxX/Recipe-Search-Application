import { LightningElement, api, wire} from 'lwc';
import getContacts from '@salesforce/apex/ContactController2SanGup.getContacts';
export default class RenderingListIterator extends LightningElement {
    @api
    recordId;

    contacts;
    error;

    // Fetching data from getContacts function and displaying it on  a record page
    @wire(getContacts, {accId:'$recordId'})
    contacts({data, error}){
        if(data){
            this.contacts = data;
            this.error = undefined;
            console.log(this.contacts);
        }else if(error){
            this.error = error;
            this.contacts = undefined;
        }

    }
}