import { LightningElement, api } from 'lwc';

export default class ContactCreateEdView extends LightningElement {
    @api recordId;

    handleSuccess(event){
        this.recordId=event.detail.id;
    }
}