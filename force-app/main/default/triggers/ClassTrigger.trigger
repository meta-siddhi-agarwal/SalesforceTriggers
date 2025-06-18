trigger ClassTrigger on Class__c (after update,before delete) {
    if( Trigger.isDelete){
        if(Trigger.isBefore){
            ClassTriggerHelper.beforeDelete(Trigger.old);
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isAfter){
            ClassTriggerHandler.afterUpdate(Trigger.New, Trigger.oldMap);
        }
    }
    }
   

