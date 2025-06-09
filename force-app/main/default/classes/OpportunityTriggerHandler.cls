public with sharing class OpportunityTriggerHandler {
    public static void onUpdate(List<Opportunity> opportunityList, Map<Id, Opportunity> oldOppMap) {
        for(Opportunity opp:opportunityList){
            if((opp.StageName!=oldOppMap.get(opp.Id).StageName) && (opp.StageName=='Closed Won' || opp.StageName=='Closed Lost')){
                opp.CloseDate=System.today();
            }
            }
        }
        public static void updateManager(List<Opportunity> opportunityList, Map<Id, Opportunity> oldOppMap){
            //check if value is updated or not
            List<Opportunity> oppList=new List<Opportunity>();
            for(Opportunity opp:opportunityList){
                Contact conList=[SELECT Id,AccountId FROM Contact WHERE Id=:opp.BillToContact__r.Id];
                Account accList=[SELECT Id FROM Account WHERE Id=:conList.AccountId];
                // Account accList=[SELECT Id FROM Account WHERE Id IN:conList.AccountId];
                if(accList!=null){
                  Contact con=  [SELECT Id, Name FROM Contact WHERE Account.Id=:accList.Id];
                  opp.Manager__r.Name=con.Name;
                  oppList.add(opp);
                }
            }
           update oppList;
        }
}
