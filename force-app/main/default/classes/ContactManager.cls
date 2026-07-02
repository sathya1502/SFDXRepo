public with sharing class ContactManager {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        return [SELECT Id, lastName, Phone FROM Contact LIMIT 20];
    }

    @AuraEnabled
    public static List<Contact> getContactsWithLimit(integer num){
        return [SELECT Id, LastName, Phone, Email FROM Contact LIMIT :num];
    }
}