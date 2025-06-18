trigger StudentTrigger on Student__c (before insert,after insert,after update) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            StudentTriggerHelper.beforeInsert(Trigger.new);
        }
        else{
            StudentTriggerHelper.afterInsert(Trigger.new,null);
        }
        }
        if(Trigger.isUpdate){
            if(Trigger.isAfter){
                StudentTriggerHelper.afterUpdate(Trigger.new,Trigger.oldMap);
            }
        }
}
