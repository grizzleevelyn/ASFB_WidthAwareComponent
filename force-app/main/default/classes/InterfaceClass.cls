public with sharing class InterfaceClass {
    @AuraEnabled(cacheable=true)
    public static AccountInfoWrapper.AccountWrapper getAccountInfoWrapper(Id accountId){
        try {
            return AccountInfoWrapper.getAccountWrapper(accountId);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
