public with sharing class TeacherTriggerHandler {
    public static void onUpdateInsert(List<Contact> conList,Map<Id,Contact> oldTeacherMap){
        for(Contact con:conList){
            Teach__C teachObj=[SELECT Id FROM Teach__c WHERE Class__r.Id=:con.Id];
            if(oldTeacherMap==null && teachObj.subject__c=='Hindi'){
                con.addError('You are not allowed to update or create for Hindi class');

            }
          
            
            else if(oldTeacherMap!=null){
                Contact oldContact=oldTeacherMap.get(con.Id);
                Teach__C oldTeachObj=[SELECT Id FROM Teach__c WHERE Class__r.Id=:oldContact.Id];
                if(teachObj.subject__C!=oldTeachObj.subject__c){
                    con.addError('You are not allowed to update or create for Hindi class');
                }
            }
  
        }
    }
}