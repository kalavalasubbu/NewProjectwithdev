global class createaccountschedule implements schedulable {
    
    global void execute(SchedulableContext SC)
    {
        system.debug('-----started------');
       list<Account> allaccounts = new list<Account>(); 
        for(integer i = 0;i<5;i++)
        {
            Account a = new Account();
            a.Name = 'TEST'+i+'';
            
          allaccounts.add(a);
        }
        system.debug('----+all accounts--'+allaccounts);
         insert allaccounts;
    }

}