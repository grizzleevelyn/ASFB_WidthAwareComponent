@isTest
public without sharing class GetAccountInfoTest {

    @isTest
    static void getAccount_test() {
        Account accountToInsert = new Account(Name = 'Test Account');

        insert accountToInsert;

        test.startTest();
            Account queriedAccount = GetAccountInfo.getAccount(accountToInsert.Id);
        test.stopTest();

        System.assertEquals(accountToInsert.Id, queriedAccount.Id, 'Verify that the id of the inserted account and the queried account are the same.');
    }
}
