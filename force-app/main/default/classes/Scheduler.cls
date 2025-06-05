public with sharing class Scheduler implements Schedulable{
    global void execute(SchedulableContext SC) {
        EmailController M = new EmailController(); 
     }

     ScheduledMerge m = new ScheduledMerge();
String sch = '0 0 0 10 2 ?';
String jobID = System.schedule('Merge Job', sch, m);
    // public Database.QueryLocator start(Database.BatchableContext bc){
    //     return Database.getQueryLocator([SELECT Id,Name FROM OPPORTUNITY]);
    // }
    // public void execute(Database.BatchableContext bc, List<Opportunity> scope){
        
    // }
    // public void finish(Database.BatchableContext bc){
        
    // }
    // public Scheduler() {

    // }
}