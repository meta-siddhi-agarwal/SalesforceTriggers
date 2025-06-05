public with sharing class ContactScheduler {
    public static void updateAccountContactIds(Id contactId) {

        Contact con = [
            SELECT Id, AccountId 
            FROM Contact 
            WHERE Id = :contactId 
            LIMIT 1
        ];

        if (con.AccountId == null) return;

        Account acc = [
            SELECT Id, ContactId__c 
            FROM Account 
            WHERE Id = :con.AccountId 
            LIMIT 1
        ];

        if (String.isBlank(acc.ContactId__c)) {
          
            List<Contact> contacts = [
                SELECT Id 
                FROM Contact 
                WHERE AccountId = :acc.Id
            ];

            List<String> ids = new List<String>();
            for (Contact c : contacts) {
                ids.add(c.Id);
            }

            acc.ContactId__c = String.join(ids, ',');
        }
        else {
            List<String> existingIds = acc.ContactId__c.split(',');
            if (!existingIds.contains(contactId)) {
                existingIds.add(contactId);
                acc.ContactId__c = String.join(existingIds, ',');
            }
        }

        update acc;
    }

}