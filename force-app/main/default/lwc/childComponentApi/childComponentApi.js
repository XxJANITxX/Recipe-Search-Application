import { api, LightningElement } from 'lwc';

export default class ChildComponentApi extends LightningElement {
    @api childProperty1;
    @api childProperty2;
}