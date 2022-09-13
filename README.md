# Lightweight trigger framework

![Build](https://github.com/Craft-First/sfdc-trigger-framework/actions/workflows/build.yml/badge.svg)
![badge](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/nbatterham/37875c31d8b3c3c04cf1f1980778a67d/raw/trigger-framework-test.json)

Lightweight metadata driven trigger framework for Salesforce.

## Motivation

There are many trigger frameworks out there that look to overcomplicate how we handle dml changes on our records. This library allows us   to avoid writing boilerplate code in the triggers, providing the beginning of a clear separation of concern.

This library defines several interfaces that can be implemented in isolation.
## Installation Urls <a id="installation-url"></a>

- [Production/Developer](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5f000000NrjHAAS)
- [Sandbox](https://test.salesforce.com/packaging/installPackage.apexp?p0=04t5f000000NrjHAAS)

## Example

**AccountTrigger.trigger**
~~~java
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    TriggerDispatcher.dispatch(new SampleAccountTriggerHandler(), Trigger.operationType);
}
~~~

**SampleAccountTriggerHandler.cls**
```java
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

```

## `Disableable` interface

When a trigger handler implements this interface, it informs the
dispatcher wether or not it should be executed.

## Why so many interfaces

Several reasons
* By looking at the declaration of the handler, one can clearly see what events it is responding to
* It avoid having empty methods in the body of the handler
