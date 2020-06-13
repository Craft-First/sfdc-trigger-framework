public interface AfterUpdate {
    void afterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems);
}
