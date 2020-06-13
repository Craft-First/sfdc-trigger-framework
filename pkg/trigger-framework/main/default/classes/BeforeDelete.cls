public interface BeforeDelete {
    void beforeDelete(Map<Id, SObject> oldItems);
}
