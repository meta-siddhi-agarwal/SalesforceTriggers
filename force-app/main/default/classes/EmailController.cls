public with sharing class EmailController {
    List<Opportunity> ownerList;
    public List<Opportunity> getOpportunities(){
        ownerList=[select id,name,owner.email,lastmodifieddate from opportunity where lastmodifieddate<=last_n_days:30];
    }
    public void sendMail(String address, String subject, String body) {
        for(Opportunity opp:ownerList){
        // Create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        // Pass this email message to the built-in sendEmail method 
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] {opp.owner.email });
        // Call a helper method to inspect the returned results
        inspectResults(results);
        }
        
    }
}