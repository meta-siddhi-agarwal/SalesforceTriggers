public with sharing class OpportunityTriggerHelper {
   public static void beforeUpdate(List<Opportunity> opportunityList, Map<Id, Opportunity> oldOppMap){
    OpportunityTriggerHandler.onUpdate(opportunityList, oldOppMap);
    OpportunityTriggerHandler.updateManager(opportunityList, oldOppMap);
   }
}