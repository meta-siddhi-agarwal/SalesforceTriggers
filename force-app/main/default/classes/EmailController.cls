public with sharing class EmailController {

    /**
     * This method return the list of all opportunities
     * @return List<Opportunity>
     */
    public static List<Opportunity> getOpportunities(){
        List<Opportunity> ownerList=[select id,name,owner.email,lastmodifieddate from opportunity where lastmodifieddate<=last_n_days:30 ];
        return ownerList;
    }

    /**
     * Will send email to opp. owner
     */
    public static  void sendMail(String address, String subject,String body,List<Opportunity> ownerList) {
        List<Messaging.SingleEmailMessage > allMails=new List<Messaging.SingleEmailMessage >();
        for(Opportunity opp:ownerList){
        // Create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        // String[] toAddresses = new String[] {opp.owner.email};
                String[] toAddresses = new String[] {'siddhi.agarwal@metacube.com'};

        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody('Hi ' + opp.Name + ',\n\n' + 'It has been more than 30 days since the stage of this opportunity is not changed.');
        // Pass this email message to the built-in sendEmail method 
        // of the Messaging class
        // Messaging.SendEmailResult[] results = Messaging.sendEmail(
        //                          new Messaging.SingleEmailMessage[] {mail });
        allMails.add(mail);
        }
        if(!allMails.isEmpty()){
            // for(Messaging.SingleEmailMessage mail:allMails)
            // Messaging.SendEmailResult[] results = Messaging.sendEmail(
            //                      new Messaging.SingleEmailMessage[] {allMails});
                                 Messaging.sendEmail(allMails);
        }
        Integer invocations = Limits.getEmailInvocations();
System.debug('Email Inviked'+invocations);
    }
}
