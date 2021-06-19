public with sharing class AccountInfoWrapper {

    public static AccountWrapper getAccountWrapper(Id accountId) {
        Account queriedAccount = GetAccountInfo.getAccount(accountId);

        AccountWrapper wrapperToReturn = new AccountWrapper(queriedAccount);

        return wrapperToReturn;
    }

    public with sharing class AccountWrapper {
        @AuraEnabled public String accountId;
        @AuraEnabled public String accountName;
        @AuraEnabled public List<ContactWrapper> contactList;

        @TestVisible
        private AccountWrapper(Account accountToWrap) {
            this.accountId = accountToWrap.Id;
            this.accountName = accountToWrap.Name;
            this.contactList = new List<ContactWrapper>();
            if(accountToWrap.Contacts.size() > 0) {
                for(Contact contactToWrap : accountToWrap.Contacts) {
                    ContactWrapper wrappedContact = new ContactWrapper();
                    wrappedContact.contactId = contactToWrap.Id;
                    wrappedContact.contactName = contactToWrap.Name;
                    wrappedContact.contactDepartment = contactToWrap.Department;
                    wrappedContact.contactEmail = contactToWrap.Email;
                    wrappedContact.contactPhone = contactToWrap.Phone;

                    this.contactList.add(wrappedContact);
                }
            }
        }
    }

    public with sharing class ContactWrapper {
        @AuraEnabled public String contactId;
        @AuraEnabled public String contactName;
        @AuraEnabled public String contactDepartment;
        @AuraEnabled public String contactEmail;
        @AuraEnabled public String contactPhone;
    }
}
