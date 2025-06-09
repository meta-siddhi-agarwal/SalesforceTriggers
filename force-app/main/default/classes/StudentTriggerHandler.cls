public with sharing class StudentTriggerHandler {
    public static void onInsert(List<Student__c> studentList) {
        for(Student__c stud:studentList){
            Student__c stuObj=[SELECT Class__r.MaxInteger__c,Class__c.NumberOfStudents__c FROM Student__c];
            if(stuObj.Class__r.MaxInteger__c==stuObj.Class__c.NumberOfStudents__c){
                stud.addError('The class has already reached it max limit');
            }
        }
}
}