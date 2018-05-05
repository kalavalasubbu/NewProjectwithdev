global class BatchSepeakerdetails implements schedulable,Database.Batchable<sObject>,Database.stateful  {
    global string query;
    
    public BatchSepeakerdetails()
    {
        
    }
    
    global void execute(SchedulableContext sc)
    {
        database.executeBatch(this);
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        string strsql = 'select id,name,last_name__c,first_name__c,email__c,status__c from speaker__c';
        query = strsql;
        
        return Database.getQueryLocator(this.query);
    }
    
    global void execute(database.BatchableContext bc, sObject[] speakerdetails)
    {
        
        map<id,string> swithemail = new map<id,string>();
        list<string> activespeakers = new list<string>();
        list<string> inactivespeakers = new list<string>();
        list<id> speakids = new list<id>();
        
        
        
        for(speaker__c sp : (list<speaker__c>) speakerdetails)
        {
          swithemail.put(sp.id, sp.email__c);
            speakids.add(sp.id);
            
            if(sp.status__c == 'Active')
            {
              string name = sp.first_name__c+''+sp.last_name__c;
               activespeakers.add(name) ;
            }
            
             if(sp.status__c == 'Inactive')
            {
              string name = sp.first_name__c+''+sp.last_name__c;
               inactivespeakers.add(name) ;
            }
            
        }
        system.debug(activespeakers.size()+'-------activespeakers-------'+activespeakers);
        system.debug(inactivespeakers.size()+'-------inactivespeakers-------'+inactivespeakers);
        system.debug(speakids.size()+'------speakids--------'+speakids);
        
        list<Messaging.SingleEmailMessage> allmails = new list<Messaging.SingleEmailMessage>();
        
        for(integer i =0;i<speakids.size();i++)
        {
         Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject('Complete Active and Inactive Speaker details ');
            string ebody ='Dear All,<br/><br/> Please check the details of active and inactive speakers of our orginaztion <br/> so Active Speakers are '+activespeakers+'<br/><br/> Inactive Speakers are '+ inactivespeakers+'<br/><br/> If you found any information is wrong . Please conatct admin. <br/<br/> Regards,<br/>Admin>';
            email.setHtmlBody(ebody);
            list<string> emailaddress = new list<string>();
            emailaddress.add(swithemail.get(speakids[i]));
            email.setToAddresses(emailaddress);
            list<string> ccadd = new list<string>();
            ccadd.add('subbu.kalavala@gmail.com');
            email.setCcAddresses(ccadd);
            email.setSaveAsActivity(false);
            
            allmails.add(email);
        }
        system.debug('----allmails-----'+allmails);
        messaging.sendEmail(allmails);
        
    }
    
    public pagereference executeAnnualBatch()
    {
       ID batchprocessid = database.executeBatch(this);
        return null;
    }
    
    global void finish(Database.BatchableContext bc)
    {
        //
    }

}