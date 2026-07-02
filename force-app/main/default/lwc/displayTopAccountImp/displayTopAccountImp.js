import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/AccountRevenue.getTopRevenueAccountDynamic';
export default class DisplayTopAccountImp extends LightningElement{
    accountList = [];
    n=5;

    connectedCallback(){
        getAccounts({n:this.n}).then(result =>{
            this.accountList = result;
            console.log("response received in the connectedCallback method");
        }).catch(error=>{
            console.log(error);
        })
    }

    handleKeyUp(event){
        this.n= event.target.value;
        getAccounts({n:this.n}).then(response=>{
            this.accountList = response;
            console.log("response received in the handleKeyUp Method");

        }).catch(error=>{
            console.error(error);
        })
    }
}