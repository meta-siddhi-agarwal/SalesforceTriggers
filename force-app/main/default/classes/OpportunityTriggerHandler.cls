public with sharing class OpportunityTriggerHandler {
    /**
     * If the stage is changed from another value to CLOSED_WON or CLOSED_LOST, populates the Close Date field with Today().
     */
    public static void onUpdate(List<Opportunity> opportunityList, Map<Id, Opportunity> oldOppMap) {
        for(Opportunity opp:opportunityList){
            if((opp.StageName!=oldOppMap.get(opp.Id).StageName) && (opp.StageName=='Closed Won' || opp.StageName=='Closed Lost')){
                opp.CloseDate=System.today();
            }
            }
        }

    /**
     * update manager based on related account 
     */
    public static void updateManager(List<Opportunity> opportunityList, Map<Id, Opportunity> oldOppMap){
            List<Opportunity> oppList=new List<Opportunity>();
            Set<Id> oppIds=new Set<Id>();
            for(Opportunity opp:opportunityList){
                if(opp.BillToContact__c!=oldOppMap.get(opp.Id).BillToContact__c)
                oppIds.add(opp.BillToContact__c);
            }

            Map<Id,Contact> contactMap=new Map<Id,Contact>([SELECT Id,Name,AccountId FROM Contact WHERE Id IN: oppIds]);
            Set<Id> contactId=new Set<Id>();

            for(Contact con:contactMap.values()){
                contactId.add(con.AccountId);
            }
            Map<Id,Account> accMap=new Map<Id,Account>([SELECT Id,Name FROM Account WHERE Id IN:contactId]);
                
            for(Opportunity opp:opportunityList){
                    Contact con=contactMap.get(opp.BillToContact__c);
                    Account acc=accMap.get(con.AccountId);
                    opp.Manager__c=acc.Id;
                    oppList.add(opp);

                }
            }    
    }
