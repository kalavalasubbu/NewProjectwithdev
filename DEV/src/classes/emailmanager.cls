public class emailmanager {
    
    public void sendmail(string subject,string address, string emailbody)
    {
        Messaging.SingleEmailMessage mail = new messaging.singleEmailMessage();
        string[] toaddresses = new string[] {address};
        mail.setToAddresses(toaddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(emailbody);
        messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        
    }
    
    public void createAccountOppConatct(string name)
    {
        Account a = new account();
        a.Name = name;
        a.Phone = '1234567890';
        insert a;
        
        system.debug('PIEYEI');
        
        contact c = new contact();
        c.LastName = 'for apex test';
        c.AccountId = a.id;
         insert c;
        
        opportunity opp = new opportunity();
        opp.Name='test opp';
        opp.CloseDate = system.today().adddays(10);
        opp.StageName = 'Closed subbu';
        opp.AccountId= a.Id;
        
        insert opp;
        
           
        
    }
    

}