trigger OpportunityTrigger on Opportunity (before update,after update) {
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            OpportunityTriggerHandler.onUpdate(Trigger.new, Trigger.oldMap);

        }
        else{
            OpportunityTriggerHandler.updateManager(Trigger.new, Trigger.oldMap);
        }
    }
}