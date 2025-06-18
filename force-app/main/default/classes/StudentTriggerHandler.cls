public with sharing class StudentTriggerHandler {
    /**
     * Not allow insert student if class already reached MaxLimit
     */
    public static void onInsert(List<Student__c> studentList) {
        Set<Id> stuId=new Set<Id>();
        for(Student__c stu:studentList){
            stuId.add(stu.Id);
        }
        Map<Id,CLASS__C> classList=new Map<Id,CLASS__C>([SELECT Id,MaxInteger__C,NumberOfStudents__c FROM CLASS__C ]);
        for(Student__c stu:studentList){
            CLASS__C classItem=classList.get(stu.Class__c);
            if(classItem!=null){
                if(classItem.MaxInteger__c<=classItem.NumberOfStudents__c){
                    stu.addError(Label.ForStudentError);
                }
            }
    }
}
    /**
     * When insert/update any student’s in class then update MyCount Accordingly
     */
    public static void onInsertUpdate(List<Student__c> studentList,Map<Id,Student__c> oldStudentMap) {
    List<Class__c> classList=new List<Class__c>();

    Set<Id> classId=new Set<Id>();

    for(Student__c stu:studentList){
        classId.add(stu.Class__c);
    }

    if(classId.isEmpty())return;
    List<AggregateResult> studentCount=new List<AggregateResult> ([SELECT class__c,count(id) studentCount FROM Student__c WHERE class__c IN:classId GROUP BY Class__c ]);

    Map<Id,Integer> classMap=new Map<Id,Integer>();

    for(AggregateResult result:studentCount){
        Id ids=(id)result.get('class__c');
        Integer count=(Integer)result.get('studentCount');
        classMap.put(ids,count);
    }

    List<Class__c> cl=new List<Class__c>([SELECT ID,MYCOUNT__C FROM Class__c WHERE ID IN:classMap.keySet()]);

    for(Class__c cls:cl){
        cls.MyCount__c=classMap.get(cls.id);
    }

    if(!cl.isEmpty()){
        update cl;
    }
        }   
}
