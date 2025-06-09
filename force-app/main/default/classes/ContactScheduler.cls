public with sharing class ContactScheduler implements Database.Batchable<sObject>{
    private Id contactId;
    public ContactScheduler(Id contactId){
        contactId=contactId;
    }
    /**
    * This method return the list of all contacts
    * @return Database.QueryLocator
    */
    public Database.QueryLocator start(Database.BatchableContext bc) {
    return Database.getQueryLocator(
        [SELECT Id,AccountId 
        FROM Contact WHERE Id=:contactId]);
        }
    
    /**
     * This method update the BillToContact__c field with Manager__c field
     * @param Database.BatchableContext
     */
    public void execute(Database.BatchableContext bc, List<Contact> scope) {

        // Contact con=[SELECT Id,AccountId 
        // FROM Contact
        // WHERE Id=:contactId];

        if(scope.AccountId==null )return;

        Account acc=[SELECT Id,ContactId__c
        FROM Account
        WHERE Id=:con.AccountId];

        if(String.isBlank(acc.ContactId__c)){
            List<Contact> contactList=[SELECT Id 
            FROM Contact
            WHERE AccountId=:acc.Id];
            
            List<Id> idList=new List<Id>();
            for(Contact accountContact:contactList){
                idList.add(accountContact.Id);
            }

            acc.contactId__c=String.join(idList,',');
            update acc;
            }
        else{
            List<String> existingId=acc.ContactId__c.split(',');
            if(!existingId.contains(con.Id)){
                existingId.add(con.Id);
                acc.ContactId__c=String.join(existingId,',');
                update acc;
        }
    }
    }

    /**
     * This method is used to perform any final actions
     */
    public void finish(Database.BatchableContext bc) {}
}