/*import { LightningElement, wire } from 'lwc';
import getAllContacts from '@salesforce/apex/ContactManager.getContacts';

export default class FetchContactsViaApex extends LightningElement {
    @wire(getAllContacts) contacts;

    get responseReceived(){
        if(this.contacts){
            return true;
        }
            return false;
    }
}*/
import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class ImperativeExample extends LightningElement {
    accounts;
    limit = 5;
    error;

    handleLimitChange(event) {
        this.limit = Number(event.target.value);
    }

    fetchAccounts() {
        getAccounts({ recordLimit: this.limit })
            .then(result => {
                this.accounts = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.accounts = undefined;
                console.error(error);
            });
    }
}
