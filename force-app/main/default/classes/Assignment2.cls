public with sharing class Assignment2 implements Database.Batchable<sObject>{

  /**
   * This method return the list of all opportunities
   * @return Database.QueryLocator
   */
  public Database.QueryLocator start(Database.BatchableContext bc){
    return Database.getQueryLocator(
      [SELECT BillToContact__c,Manager__c FROM OPPORTUNITY]);
  }
  
  /**
   * This method update the BillToContact__c field with Manager__c field
   * @param Database.BatchableContext
   */
  public void execute(Database.BatchableContext bc, List<Opportunity> scope){
    List<Opportunity> listOpp = new List<Opportunity>();
    List<Id> contactId=new List<Id>();
        for(Opportunity listOpp1:scope){
          if(listOpp1.BillToContact__c!=null && listOpp1.Manager__c==null){
            listOpp.add(listOpp1);
          contactId.add(listOpp1.BillToContact__c);
          }
          
  }
  Map<Id,Contact> contactMap=new Map<Id,Contact>();
  List<Contact> contactList=[SELECT Id,Name,AccountId FROM Contact WHERE Id IN:contactId] ;
  for(Contact con:contactList){
    contactMap.put(con.Id,con);
  }
  for(Opportunity opp:listOpp){
    opp.Manager__c=contactMap.get(opp.BillToContact__c).AccountId;
    }
    update listOpp;
  }

  /**
   * This method is used to perform any final actions
   */
  public void finish(Database.BatchableContext bc){
  }
}