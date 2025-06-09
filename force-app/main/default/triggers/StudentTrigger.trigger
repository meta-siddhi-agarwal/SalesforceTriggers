trigger StudentTrigger on Student__c (before insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            StudentTriggerHandler.onUpdateInsert(Trigger.new);
        }
        }
}