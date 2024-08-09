import { LightningElement, wire } from 'lwc';
import getHighRevenueAccounts from '@salesforce/apex/AccountController.getHighRevenueAccounts';
import getHighRevenueAccountsPerCount from '@salesforce/apex/AccountController.getHighRevenueAccountsPerCount';

export default class TopFiveAccounts extends LightningElement {
    accountsData;
    accountsDataPerCount;

    @wire(getHighRevenueAccounts)
    accountHandler(response){

        const {data, error} = response;
        if(data){
            this.accountsData = data;
        }

        if(error){
            console.log(error);
        }
    }


    connectedCallback(){
        getHighRevenueAccountsPerCount({count: 5})
        .then(data => {
            this.accountsDataPerCount = data;
        })
        .catch(error => {
            console.log(error);
        })
    }
}