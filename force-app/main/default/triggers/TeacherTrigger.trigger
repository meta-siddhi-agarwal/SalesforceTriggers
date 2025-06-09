trigger TeacherTrigger on Contact (before insert,before update) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            TeacherTriggerHandler.onUpdateInsert(Trigger.new,null);
        }
        }
    
    else  if(Trigger.isUpdate){
        if(Trigger.isBefore){
            TeacherTriggerHandler.onUpdateInsert(Trigger.new,Trigger.oldMap);            
        }
    }
}