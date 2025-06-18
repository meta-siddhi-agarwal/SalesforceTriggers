trigger AccountTrigger on Account (after insert,before update,after update) {
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            AccountTriggerHelper.afterInsert(Trigger.new);
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountTriggerHelper.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
        else{
            AccountTriggerHelper.afterUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}
