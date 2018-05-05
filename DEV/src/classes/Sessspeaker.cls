public class Sessspeaker {
   public string sesname{get;set;}
    public string sesdescription{get;set;}
    public string Speakerfname{get;set;}
    public string SpeakerEmail{get;set;}
    public string Speakerlname{get;set;}
    public string Speakerstatus{get;set;}
    public string ids;
    public Sessspeaker()
    {
    system.debug('-----constructer called-------');    
    }

    public pagereference save()
    {
       if(String.isEmpty(sesname) && String.isEmpty(sesdescription) && String.isEmpty(Speakerfname) && String.isEmpty(SpeakerEmail) && String.isEmpty(Speakerlname) && String.isEmpty(Speakerstatus) )
       {
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Please enter all value to continue'));
  
       }else{
           
           Sessions__c ses = new Sessions__c();
           ses.Name = sesname;
           ses.Description__c = sesdescription;
           insert ses;
           ids = string.valueof(ses.id);
           Speaker__c sep = new Speaker__c();
           sep.First_Name__c = Speakerfname;
           sep.Last_Name__c = Speakerlname;
           sep.Email__c = SpeakerEmail;
           sep.Status__c = Speakerstatus;
           insert sep;
           
           if(ses.id!=null && sep.id!=null)
           {
              ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Session and Speaker details are successfully created'));   
           }else{
               
                 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Faled.Please try later.'));
           }
       }
        
       

        
       PageReference ref = new PageReference('/'+ids);
       ref.setRedirect(true);
       return ref;
    }
       
    
}