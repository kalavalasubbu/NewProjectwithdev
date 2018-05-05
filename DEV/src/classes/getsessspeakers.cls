public class getsessspeakers {
    string ids{get;set;}
    public list<Session_Speaker__c> sesspeak{get;set;}

    public getsessspeakers()
    {
      ids = ApexPages.currentPage().getParameters().get('ids') ;
        system.debug('------ids------'+ids);
        list<string> allids = new list<string>();
        allids = ids.split(',');
        system.debug(allids.size()+'-----after split---------'+allids);
        list<Sessions__c> ses = [select id,Name from Sessions__c where id=:allids];
        system.debug('---ses---'+ses);
        sesspeak = new list<Session_Speaker__c>();
        sesspeak = [select id,Name,Session__c,Session__r.Name,Speaker__c,Speaker__r.Name from Session_Speaker__c where Session__c =: allids ];
        system.debug(sesspeak.size()+'----sesspeak-----'+sesspeak);
        
        
        
    }
    
}