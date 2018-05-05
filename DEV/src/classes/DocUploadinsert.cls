public class DocUploadinsert {
     public Document_Folder__c ssa{get;set;}
      public  string accid ;
      private ApexPages.StandardController c;
    public DocUploadinsert(ApexPages.StandardController stdController)
    {
       c = stdController;
      ssa = new Document_Folder__c();
    }
    
     public PageReference Save()
      {
          try{                      
         insert ssa;
           PageReference navpage = new Pagereference('/apex/DocUpload?id='+ssa.id);
            navpage.setRedirect(true);
            return navpage;
              
          }catch(Exception e)
          {
             system.debug('Exception********-------'+e);
			string exc = string.valueOf(e);
			 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Info,'Error occured '+exc+'  Please try again.');
                ApexPages.addMessage(myMsg);
              return null;
          }        
      }
     public PageReference Cancel()
      {
           PageReference Cancelpage = new Pagereference('/home/home.jsp');
               Cancelpage.setRedirect(true);
               return Cancelpage; 
      }

}