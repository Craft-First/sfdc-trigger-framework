public interface BeforeUpdate {
    void beforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems);
}
