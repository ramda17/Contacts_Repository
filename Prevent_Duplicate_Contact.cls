public class Prevent_Duplicate_Contact{

     String STR_SEPARATOR = '_';
     List<Contact> existingContactRecordList;
     public Prevent_Duplicate_Contact(){
        existingContactRecordList = [SELECT AccountId
        ,    FirstName
        ,    LastName
        ,    Education__c
        ,    Email
        ,    Phone
        FROM Contact
        ];
    }
    public void preventDuplicateContact(List<Contact> contactList){
        Integer counter = 0;
        System.debug('..rd..Start' + contactList.isEmpty());
        Map<String, Contact> contactMap = new Map<String, Contact>();
        List<Contact> duplicateCont = new List<Contact>();
        for(Contact cont : contactList){
            String key = cont.Email;
            if(contactMap.containsKey(key)){
                System.debug('..rd..Map:' + key);
                contactMap.put(key,cont);
            } else{
                counter++;
                duplicateCont.add(cont);
            }

        }
        System.debug(counter);
        if(duplicateCont.size()==0){
            return;
        }

        if(duplicateCont.size()>0){
            Contact con = new Contact();
            con.addError('Error');
            // System.debug('Number of duplicate records found: '+duplicateCont.size());
            // System.debug('Email already exists');
        }
    }
 }
