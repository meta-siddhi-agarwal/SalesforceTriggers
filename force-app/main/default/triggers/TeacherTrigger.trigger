trigger TeacherTrigger on Teach__C (before insert,before update) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            TeacherTriggerHelper.beforeInsert(Trigger.new,null);
        }
        }
    
    else  if(Trigger.isUpdate){
        if(Trigger.isBefore){
            TeacherTriggerHelper.beforeUpdate(Trigger.new,Trigger.oldMap);
        }
    }
}
