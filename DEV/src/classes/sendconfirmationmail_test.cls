@isTest
public class sendconfirmationmail_test {
    
  static testmethod void testconfirmationmail()
  {
      
      Sessions__c ses = new Sessions__c();
      ses.Name = 'Testing trigger';
      ses.Description__c = 'Used for code covarege ';
      ses.Level__c='Advanced';
      ses.Session_date__c = system.now();
      
      insert ses;
      
      Speaker__c sep = new Speaker__c();
      sep.Last_Name__c = 'Test';
      sep.Status__c ='Active';
      sep.Email__c = 'xyz@gmail.com';
      
      insert sep;
      
      
      Session_Speaker__c ss = new Session_Speaker__c();
      ss.Session__c = ses.id;
      ss.Speaker__c = sep.id;
      
      insert ss;
  }

    static testmethod void testconfirmationmail2()
  {
      
      Sessions__c ses1 = new Sessions__c();
      ses1.Name = 'Testing trigger1';
      ses1.Description__c = 'Used for code covarege1 ';
      ses1.Level__c='Advanced';
      ses1.Session_date__c = system.now();
      
      insert ses1;
      
      Sessions__c ses2 = new Sessions__c();
      ses2.Name = 'Testing trigger1';
      ses2.Description__c = 'Used for code covarege1 ';
      ses2.Level__c='Advanced';
      ses2.Session_date__c = system.now();
      
      insert ses2;
      
      Speaker__c sep1 = new Speaker__c();
      sep1.Last_Name__c = 'Test2';
      sep1.Status__c ='Active';
      sep1.Email__c = 'xyzabc@gmail.com';
      
      insert sep1;
      
      
      Session_Speaker__c ss1 = new Session_Speaker__c();
      ss1.Session__c = ses1.id;
      ss1.Speaker__c = sep1.id;
      
      insert ss1;
      
      Session_Speaker__c ss2 = new Session_Speaker__c();
      ss2.Session__c = ses2.id;
      ss2.Speaker__c = sep1.id;
      
      insert ss2;
      
  }

    
    
    
}