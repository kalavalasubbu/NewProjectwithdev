trigger sendconfirmationmail on Session_Speaker__c (after insert,before insert ,before update) {
    list<id> speakerids = new list<id>();
    list<id> sesids = new list<id>();
    list<speaker__c> speakdetails = new list<speaker__c>();
    list<sessions__c> sesdetails = new list<sessions__c>();
    emailmanager email = new emailmanager();
    string address = null;
    string subject = null;
    string body = null;
    
    if(trigger.isafter&&trigger.isinsert){
    
        for(Session_Speaker__c newrec : Trigger.new)
        {
         speakerids.add(newrec.Speaker__c);
         sesids.add(newrec.Session__c);   
        }
        system.debug(sesids+'-sesids---speakerids--'+speakerids);

    speakdetails = [select Name,Email__c,First_Name__c from Speaker__c where id=:speakerids];
    sesdetails = [select Name,session_date__c from sessions__c where id =: sesids];
        system.debug(speakdetails.size()+'--------speakdetails------'+speakdetails);
        system.debug(sesdetails.size()+'--------sesdetails------'+sesdetails);
        
     subject = 'Confirmation Email about session'+sesdetails[0].Name+'';
       if(speakdetails[0].Email__c!=null){
         address = speakdetails[0].Email__c;
        }
     body = 'Dear '+speakdetails[0].first_Name__c+'\n Your Session '+sesdetails[0].Name+' is scheduled on'+sesdetails[0].session_date__c+'is confirmed.\n\n Please act accordings\n\n'+'Thanks for Speaking at conferenece';    
        if(address!=null)
        {
        email.sendmail(subject, address, body);
        }
        
    }
    
    if(trigger.isbefore)
    {
        
        list<id> speakids = new list<id>();
        list<id> seids = new list<id>();
        map<id,datetime> requestedbooking = new map<id,datetime>();
        
        for(Session_speaker__c newitem : trigger.new )
        {
            seids.add(newitem.session__c);
            speakids.add(newitem.Speaker__c);
        }
        list<sessions__c> relatedsessions = [select id,session_date__c from sessions__c where id =:seids ];
        for(sessions__c ses : relatedsessions)
        {            
         requestedbooking.put(ses.id, ses.session_date__c)   ;
        }
        
        list<session_speaker__c> relatedspeaker = [select id,speaker__c,session__c,session__r.session_date__c from session_speaker__c where speaker__c IN : speakids ];
        
        for(session_speaker__c reqses : trigger.new){
            datetime booktime = requestedbooking.get(reqses.Session__c);
                for(session_speaker__c relatedses : relatedspeaker)
                {
                 if(relatedses.Speaker__c==reqses.Speaker__c)
                 {
                   if(booktime==relatedses.session__r.session_date__c)
                   {
                    reqses.adderror('This speaker is already booked at the time');   
                   }
                 }
                    
                }
        }
        
    }
    
    
    

}