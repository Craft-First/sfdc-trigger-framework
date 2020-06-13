public with sharing class SampleAccountTriggerHandler implements Disableable,
                                                                 BeforeInsert,
                                                                 BeforeUpdate,
                                                                 BeforeDelete,
                                                                 AfterInsert,
                                                                 AfterUpdate,
                                                                 AfterDelete,
                                                                 AfterUndelete {
    public void beforeInsert(List<SObject> newItems) {
        System.debug('Account before insert');
    }

    public void beforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        System.debug('Account before update');
    }

    public void beforeDelete(Map<Id, SObject> oldItems) {
        System.debug('Account before delete');
    }

    public void afterInsert(Map<Id, SObject> newItems) {
        System.debug('Account after insert');
    }

    public void afterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        System.debug('Account after update');
    }

    public void afterDelete(Map<Id, SObject> oldItems) {
        System.debug('Account after delete');
    }

    public void afterUndelete(Map<Id, SObject> oldItems) {
        System.debug('Account after undelete');
    }

    public Boolean isDisabled() {
        return false;
    }
}
