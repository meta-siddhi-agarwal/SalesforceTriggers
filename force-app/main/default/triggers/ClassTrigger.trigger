trigger ClassTrigger on Class__c (before insert,after update) {
    if( Trigger.isDelete){
        if(Trigger.isBefore){
            ClassTriggerHandler.onDelete(Trigger.old);
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isAfter){
            ClassTriggerHandler.onUpdate(Trigger.New, Trigger.oldMap);
        }
    }
    }


