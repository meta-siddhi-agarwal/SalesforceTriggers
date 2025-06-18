trigger OpportunityTrigger on Opportunity (before update,after update) {
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            OpportunityTriggerHelper.beforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}
