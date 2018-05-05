@istest
public class testemailmanager {
    
    testmethod static void test_email()
    {
        
        string sub = 'TEST EMAIL';
        string address = 'test@test.com';
        string body = 'to test email body';
        string acc = 'test';
        
        emailmanager em = new emailmanager();
        em.sendmail(sub, address, body);
        em.createAccountOppConatct(acc);
        
        
    }

}