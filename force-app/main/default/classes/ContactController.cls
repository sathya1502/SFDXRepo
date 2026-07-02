public class ContactController {
    
    @AuraEnabled
    public static List<Contact> findAll(){
        return [SELECT Id, FirstName, lastName,Name, Phone, Email FROM Contact LIMIT 50];
    }
    
    @AuraEnabled
    public static List<Contact> findByName(string searchKey){
        string name = '%'+searchKey+'%';
        return [SELECT Id, FirstName, lastName, Name, Phone, Email FROM Contact WHERE Name LIKE:name LIMIT 50];
    }
    @AuraEnabled
    public static Contact findById(String contactId){
        return [SELECT Id, FirstName, lastName,Name, Phone, Email, Title, Account.Name FROM Contact WHERE Id=:contactId LIMIT 1];
    }
}