@isTest
public without sharing class AccountInfoWrapperTest {

    @isTest
    static void getAccountWrapper_test() {
        Account accountToInsert = new Account(Name = 'TestAccount');
        
        insert accountToInsert;

        Contact contactToInsert = new Contact(FirstName = 'Test', LastName = 'Contact', Department = 'Test Department', Phone = '123-456-7890', AccountId = accountToInsert.Id);

        insert contactToInsert;

        test.startTest();
            AccountInfoWrapper.AccountWrapper newWrapper = AccountInfoWrapper.getAccountWrapper(accountToInsert.Id);
        test.stopTest();

        System.assertEquals(accountToInsert.Id, newWrapper.accountId, 'Verify that the id of the account inserted matches the information in the wrapper class for the appropriate account Id.');
        System.assertEquals(accountToInsert.Name, newWrapper.accountName, 'Verify that the name of the account inserted matches the information in the wrapper class for the appropriate account Name.');
        System.assertEquals(1, newWrapper.contactList.size(), 'Verify that there is only one contact associated with the inserted account, as we only inserted one contact.');
    }
}
