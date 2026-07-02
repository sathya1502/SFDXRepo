import { LightningElement, wire } from 'lwc';
import getAllContacts from '@salesforce/apex/ContactManager.getContactsWithLimit';

export default class FetchContactsWithInput extends LightningElement {
    contacts;
    contactLimit;

    handleLimitChange(event){
        this.contactLimit=event.target.value;
    }

    get responseReceived(){
        if(this.contacts){
            return true;
        }
        return false;
    }

    handleHit(){
        getAllContacts({num:this.contactLimit}).then(response=>
        {
            this.contacts=response;
        }
        ).catch(error=>{
            console.log("Error Error Erroe"+ error.body.message);
        });

    }
}