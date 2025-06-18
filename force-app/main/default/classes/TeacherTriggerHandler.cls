public with sharing class TeacherTriggerHandler {

    /**
     * Not Allow any teacher to insert/update if that teacher is teaching Hindi
     */
    public static void onUpdateInsert(List<Teach__c> conList,Map<Id,Teach__C> oldTeacherMap){
        for(Teach__c con:conList){
            if(oldTeacherMap==null && con.SubjectField__c.contains('Hindi')){
                con.addError(Label.ForError);
            }
            else if(oldTeacherMap!=null){
                if(con.SubjectField__c!=oldTeacherMap.get(con.Id).SubjectField__c && con.SubjectField__c.contains('Hindi')){
                    con.addError(Label.ForError);
                }
            }
        }
    }
}
