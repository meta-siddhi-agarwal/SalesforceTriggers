public with sharing class ClassTriggerHandler {
    public static void onDelete(List<Class__c> classList){
        for(Class__c cls:classList){
           List<Student__c> stuList=[SELECT id FROM Student__c WHERE Class__r.Id=:cls.Id AND Sex__c='Female'];
            if(!stuList.isEmpty() && stuList.size()>1){
                cls.addError('Female students are not allowed to delete this class');
            }
        }
    }
    public static void onUpdate(List<Class__c> classList,Map<Id,Class__c> oldClassMap){
        List<Student__c> stuList=new List<Student__c>();
        for(Class__c cls:classList){
            if(cls.Custom_Status__c!=oldClassMap.get(cls.Id).Custom_Status__c && cls.Custom_Status__c=='Reset'){
                Student__c stuObj=[SELECT Id FROM Student__c WHERE Class__r.Id=:cls.Id];
                stuList.add(stuObj);
            }
    }
            if(!stuList.isEmpty()){
                delete stuList;
            }
        }
    }