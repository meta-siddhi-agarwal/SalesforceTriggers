public with sharing class ClassTriggerHandler {

    /**
     * Not allow any class to delete if there are more than one Female students
     */
    public static void onDelete(List<Class__c> classList){
        Set<Id> classId=new Set<Id>();
        for(Class__c cls:classList){
            classId.add(cls.Id);
         }
         Map<Id,Class__c> classMap=new Map<Id,Class__c>([SELECT id,(SELECT id FROM Students__r where Sex__c='Female') from Class__c WHERE id In:classId]);

        for(Class__c cls:classList){
            Integer size=classMap.get(cls.id).Students__r.size();
            if(size!=null && size>1){
                cls.addError('Since there are more than 1 female students in the class, therefore you cannot delete it');
            }            
        }
        }
    

    /**
    * When “Custom Status” picklist field changed and value is “Reset” now then delete all associated students with related Class.
    */
    public static void onUpdate(List<Class__c> classList,Map<Id,Class__c> oldClassMap){
        List<Id> stuListId=new List<Id>();
        for(Class__c cls:classList){
            if(cls.Custom_Status__c!=oldClassMap.get(cls.Id).Custom_Status__c && cls.Custom_Status__c=='Reset'){
                 stuListId.add(cls.Id);
             }
        }
        List<Student__c> stuObj=[SELECT Id FROM Student__c WHERE Class__r.Id IN:stuListId];
        if(!stuObj.isEmpty()){
            delete stuObj;
        }
         }
            
    }
