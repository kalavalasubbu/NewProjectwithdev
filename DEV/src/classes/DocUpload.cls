/*******************************************
*This class is extension to Docupload page *
*                                          *
*******************************************/

public class DocUpload {
      public Document_Folder__c ssa{get;set;}
    public  string accid{get;set;}
      private ApexPages.StandardController c;
    
 public DocUpload(ApexPages.StandardController stdController) {
      c = stdController;
   ssa = new Document_Folder__c();
  accid = Apexpages.currentPage().getparameters().get('id');
     ssa = [select id,Name,Description__c from Document_Folder__c where id=:accid];
     
 
 }
}