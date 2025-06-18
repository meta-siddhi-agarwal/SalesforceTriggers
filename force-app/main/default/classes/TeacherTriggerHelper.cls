public with sharing class TeacherTriggerHelper {
    public static void beforeInsert(List<Teach__c> teacherList,Map<Id,Teach__c> oldTeacherMap) {
        TeacherTriggerHandler.onUpdateInsert(teacherList,oldTeacherMap);
    }
    public static void beforeUpdate(List<Teach__c> teacherList,Map<Id,Teach__c> oldTeacherMap){
        TeacherTriggerHandler.onUpdateInsert(teacherList,oldTeacherMap);            
    }
}