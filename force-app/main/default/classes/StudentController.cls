public with sharing class StudentController {
    

    public static List<Class__c> getNames(Id classId){
        List<Class__c> ls=[SELECT Name From CLass__c WHERE Id=:classId];
        return ls; 	
    }
public static Map<String,Set<Id>> getMap(){
    Map<String, Set<Id>>  classMap= new Map<String, Set<Id>>();
List<Student__C> studentList=[SELECT Id,Name,class__r.Name FROM student__c ]; 
Set<Id> studentId;

for(Student__C st:studentList){
String className=st.class__r.Name;
if(classMap.containsKey(className)){
    studentId=classMap.get(className);
    studentId.add(st.Id);
    classMap.put(className,studentId);
}else{
    studentId=new Set<Id>();
    studentId.add(st.Id);
    classMap.put(className,studentId);
}
}
return classMap;
}
public static Integer getWorkingDays(Date startDate,Date endDate){
    Integer count=0;
    Date currentDate=startDate;
    DateTime dtObj=DateTime.newInstance(currentDate,Time.newInstance(0, 0, 0, 0));
    while(currentDate<=endDate){
        if(dtObj.format('EEEE')!='Saturday' && dtObj.format('EEEE')!='Sunday'){
            count++;
        }
        currentDate=currentDate.addDays(1);

    }
return count;



}

// public static void getList(){
//     Map<String,Schema.SObjectType> sObjList=Schema.getGlobalDescribe();
//     for(Integer listIndex=0;listIndex<sObjList.size();listIndex++){
//       String key=  sObjList.getKey(listIndex);
//       System.debug(key);
//         System.debug(sObjList.getValue(key));
//     }
// }
}
