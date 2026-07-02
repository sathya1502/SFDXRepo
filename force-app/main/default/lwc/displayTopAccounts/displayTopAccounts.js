import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountRevenue.getTopRevenueAccounts'; 
export default class DisplayTopAccounts extends LightningElement{
 accountstoDisplay = [];
    
@wire(getAccounts)   
wiredAccounts(response){
        const {data, error} = response;
        if(error){
            console.error(error);
        }
        else if(data){
            this.accountstoDisplay = data;
        }

    }

}