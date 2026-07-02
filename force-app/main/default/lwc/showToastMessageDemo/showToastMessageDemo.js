import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ShowToastMessageDemo extends LightningElement {
    showSuccess(){
        const successToast =  new ShowToastEvent({
            title:"Success baby!",
            message:"Success Message",
            variant:"Success",
        });
        this.dispatchEvent(successToast);
    }

    showError(){
        const errorToast = new ShowToastEvent({
            title:"meh. Error",
            message:"Error Message",
            variant:"error"
        });
        this.dispatchEvent(errorToast);
    }
    showInfo(){
        const infoToast = new ShowToastEvent({
            title:"InfoBell",
            message:"Info Message",
            variant:"info"
        });
        this.dispatchEvent(infoToast);

    }

    showWarning(){
        const warnToast = new ShowToastEvent({
            title:'Amber! Amber! Warn! Warn!',
            message:"Warning Message",
            variant:"warning"
        });
        this.dispatchEvent(warnToast);

    }
}