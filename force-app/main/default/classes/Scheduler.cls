public with sharing class Scheduler implements Schedulable{

    /**
     * This method execute the scheduler
     * @param SchedulableContext
     */
    public static void execute(SchedulableContext SC) {
        EmailController M = new EmailController(); 
      List<Opportunity>  ownerList= M.getOpportunities();
      EmailController.sendMail('', 'Opportunity Not Modified for 30 Days', '', ownerList);
     }

     ScheduledMerge m = new ScheduledMerge();
    String sch = '0 0 0 * * ?';
    String jobID = System.schedule('Merge Job', sch, m);
   
}