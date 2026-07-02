import { LightningElement } from 'lwc';
export default class FormParentComponent extends LightningElement{
    parentName='';
    parentAge='';
    show=true;
    childConfirmation='default';
    handleNameChange(event){
        this.parentName = event.target.value;
    }

    handleAgeChange(event){
        this.parentAge =event.target.value;
    }

    showHide(event){
        this.show = !this.show;
    }

    handleConfirmMessage(event){
        this.childConfirmation = event.detail.value;
        console.log( this.childConfirmation);
    }

}

