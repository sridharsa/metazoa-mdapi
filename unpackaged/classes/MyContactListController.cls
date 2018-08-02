public class MyContactListController {
    @AuraEnabled
    public static List<Contact> getContacts() {
        return [Select Id, Name, Email, Title, Phone From Contact];
    }
    
    public static List<Lead> getLeads() {
        return [Select Id, Name, Email, Title, Phone From Lead];
    }
}