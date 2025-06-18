public with sharing class StudentTriggerHelper {
    public static void beforeInsert(List<Student__c> stuList) {
        StudentTriggerHandler.onInsert(classList);
    }
    public static void afterInsert(List<Class__c> stuList,Map<Id,Student__c> oldStuList){
        StudentTriggerHandler.onInsertUpdate(stuList,oldStuList);        
    }
    public static void afterUpdate(List<Class__c> stuList,Map<Id,Student__c> oldStuList){
        StudentTriggerHandler.onInsertUpdate(stuList,oldStuList);        
    }
    
}