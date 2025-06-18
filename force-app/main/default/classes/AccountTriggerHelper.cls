public with sharing class AccountTriggerHelper {
    public static void afterInsert(List<Account> accList) {
        AccountTriggerHandler.onInsertUpdate(accList, null);
    }
    public static void beforeUpdate(List<Account> accList,Map<Id,Account> oldAccMap){
          AccountTriggerHandler.updateCount(accList, oldAccMap);        
    }
    public static void afterUpdate(List<Account> accList,Map<Id,Account> oldAccMap){
        AccountTriggerHandler.onInsertUpdate(accList, oldAccMap);
        AccountTriggerHandler.updateBillingCity(accList, oldAccMap);
    }
}