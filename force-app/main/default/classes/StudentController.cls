public with sharing class StudentController {
    /**
     * This method return the list of all students
     * @return List<Student__c>
     */
    public static List<Class__c> getNames(Id classId){
        List<Class__c> ls=[SELECT Name From CLass__c WHERE Id=:classId];
        return ls; 	
    }

    /**
     * This method return the map of student id and it's last name
     * @return Map<Id,String>
     */
    public static Map<String,Set<Id>> getMap(){
        Map<String, Set<Id>>  classMap= new Map<String, Set<Id>>();
    Set<Id> studentId;
    for(Student__C st:[SELECT Id,Name,class__r.Name FROM student__c ]){
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

    /**
     * This method return the count of working days between two dates
     * @return Integer
     */
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

    /**
     * This method returns list of sobjects in org
     */
    public static void getList(){
        Map<String,Schema.SObjectType> sObjList=Schema.getGlobalDescribe();
        for(String key:sObjList.keySet()){
            System.debug(key);
        }   
    }

}
