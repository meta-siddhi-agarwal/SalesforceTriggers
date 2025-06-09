trigger AccountTrigger on Account (after delete,before update,after update) {
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountTriggerHandler.updateCount(Trigger.new,Trigger.oldMap);
        }
        else{
            AccountTriggerHandler.onInsertUpdate(Trigger.new,Trigger.oldMap);
            AccountTriggerHandler.updateBillingCity(Trigger.new, Trigger.oldMap);
        }
    }
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            AccountTriggerHandler.onInsertUpdate(Trigger.new,null);
        }
    }
    
}