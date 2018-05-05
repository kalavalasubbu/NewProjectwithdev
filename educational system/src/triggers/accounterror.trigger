trigger accounterror on Account (before delete) {
    
    for(account acc:trigger.old)
    {
        acc.adderror('you cant delete');
    }
    
}