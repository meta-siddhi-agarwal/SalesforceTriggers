public with sharing class AccountTriggerHandler {
    public static void updateCount(List<Account> accList, Map<Id, Account> oldAccMap) {
        for(Account acc:accList){
            if(acc.Update_Counts__c!=oldAccMap.get(acc.Id).Update_Counts__c)
            acc.Update_Counts__c = oldAccMap.get(acc.Id).Update_Counts__c + 1;
        }
}
public static  void onInsertUpdate(List<Account> accList,Map<Id,Account> oldAccMap){
    List<Opportunity> oppList=new List<Opportunity>();
    for(Account acc:accList){
        if((oldAccMap==null && acc.Industry=='Agriculture')||(oldAccMap!=null && acc.Industry!=oldAccMap.get(acc.Id).Industry && acc.Industry=='Agriculture')){
            Opportunity opp=new Opportunity();
            opp.Name='Test';
            opp.AccountId=acc.Id;
            opp.StageName='Prospecting';
            opp.CloseDate=Date.today();

            oppList.add(opp);
        }
        
    }
    insert oppList;
}
public static void updateBillingCity(List<Account> accList,Map<Id,Account> oldAccMap){
    List<Contact> conList=new List<Contact>();
        for(Account acc:accList){
        if(acc.BillingAddress!=oldAccMap.get(acc.Id).BillingAddress){
            acc.Update_Counts__c=1;
            Contact allContacts=[SELECT Id FROM Contact WHERE AccountId=:acc.Id];
            allContacts.MailingAddress=acc.BillingAddress;
            conList.add(allContacts);
        }
}
    update conList;
}
}
