public with sharing class GetAccountInfo {

    public static Account getAccount(Id accountId){
        Account accountToReturn = [
            SELECT
                Id,
                Name,
                (SELECT Id, Name, Department, Email, Phone FROM Contacts)
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        return accountToReturn;
    }
}
