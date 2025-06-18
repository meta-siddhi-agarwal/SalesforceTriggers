public with sharing class AccountTriggerHandler {
    /**
     * will update count field whenever account object is updated
     */
    public static void updateCount(List<Account> accList, Map<Id, Account> oldAccMap) {
        List<Account> accountList=new List<Account>();
        for(Account acc:accList){
            if(acc.LastModifiedDate!=oldAccMap.get(acc.Id).LastModifiedDate){
                acc.Update_Counts__c = acc.Update_Counts__c + 1;
                accountList.add(acc);
            }
           
        }
        if(!accountList.isEmpty()){
            update accountList;
        }
}
    /**
     * create new opportunity whenever account is created or updated
    */
    public static  void onInsertUpdate(List<Account> accList,Map<Id,Account> oldAccMap){
    List<Opportunity> oppList=new List<Opportunity>();
    for(Account acc:accList){
        if((oldAccMap==null  && acc.Industry=='Agriculture')||(oldAccMap!=null && acc.Industry!=oldAccMap.get(acc.Id).Industry && acc.Industry=='Agriculture')){
            Opportunity opp=new Opportunity();
            opp.Name='Test';
            opp.AccountId=acc.Id;
            opp.StageName='Prospecting';
            opp.CloseDate=System.today();
            oppList.add(opp);
        }
    }
    if(!oppList.isEmpty()){
        insert oppList;
    }
}
    /**
     * update the mailing city whenever billing city is changed
     */
    public static void updateBillingCity(List<Account> accList,Map<Id,Account> oldAccMap){
    List<Contact> conList=new List<Contact>();
    Set<Id> accId=new Set<Id>();
    for(Account acc:accList){
        if(acc.BillingCity!=oldAccMap.get(acc.Id).BillingCity){
            accId.add(acc.Id);
    }
    if(accId.size()==0)return;
    Map<Id,Account> AccountList=new Map<Id,Account>([select id ,BillingCity from account WHERE Id In:accId]);//
    List<Contact> contactList=new List<Contact>([SELECT Id,AccountId FROM Contact WHERE AccountId in:accId]);

    for(Contact contacts:contactList){
        contacts.MailingCity=AccountList.get(contacts.AccountId).BillingCity;
            conList.add(contacts);
    }
    }
    if(!conList.isEmpty())
    update conList;
}
}
