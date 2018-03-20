trigger SetActiveWhenNewAccountCreated on Account (after insert) {
    List<Account> accounts = null;
    for (Account account: Trigger.new) {
        account.Active__c = 'Yes';
        
        accounts.add(account);
    }
    
    update(accounts);
}