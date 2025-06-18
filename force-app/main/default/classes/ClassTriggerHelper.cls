public with sharing class ClassTriggerHelper {
    public static void afterUpdate(List<Class__c> classList,Map<Id,Class__c> oldClassMap) {
        ClassTriggerHandler.onUpdate(classList, oldClassMap);
    }
    public static void beforeDelete(List<Class__c> classList){
        ClassTriggerHandler.onDelete(classList);        
    }    
}