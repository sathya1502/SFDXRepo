import { LightningElement, api } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
import State from '@salesforce/schema/Asset.State';

export default class NavDemo extends NavigationMixin(LightningElement) {
    @api recordId;
    
    HandleNavNew(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes:{
                'recordId': this.recordId,
                'objectApiName': 'Account',
                'actionName': 'new'
            }
        });

    }

    HandleNavEdit(){

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                'recordId': this.recordId, 
                'objectApiName': 'Account',
                'actionName': 'edit'
            }
        });

    }

    HandleNavView(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                'recordId': this.recordId,
                'objectApiName': 'Account',
                'actionName': 'view'
            }
        });
    }

    handleRelatedContactView(){
        this[NavigationMixin.Navigate]({
            type:'standard__recordRelationshipPage',
            attributes:{
                'recordId': this.recordId,
                'objectApiName': 'Account',
                'relationshipApiName': 'Contacts',
                'actionName':'view'

            }
        })

    }

    handleAccountRecentView(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                'objectApiName': 'Account',
                'actionName': 'list'
            },
            state: {
                filterName: '__Recent'
            }
        });

    }

    navAccountPage(){
        this[NavigationMixin.Navigate]({
            "type":"standard__objectPage",
            "attributes":{
                "objectApiName": "Account",
                "actionName": "home"
            }
        });

    }

    navContactPage(){
        this[NavigationMixin.Navigate]({
            "type":"standard__objectPage",
            "attributes":{
                "objectApiName":"Contact",
                "actionName":"home"
            }
        });

    }

    navWebPage(){
        this[NavigationMixin.Navigate]({
            "type":"standard__webPage",
            "attributes":{
                "url":"https://career.infosys.com/"
            }
        });

    }

    navHomePage(){
        this[NavigationMixin.Navigate]({
            "type":"standard__namedPage",
            "attributes":{
                "pageName":"home"
            }
        });
    }

    navChatterPage(){
        this[NavigationMixin.Navigate]({
            "type":"standard__namedPage",
            "attributes":{
                "pageName":"chatter"
            }
        })

    }
}