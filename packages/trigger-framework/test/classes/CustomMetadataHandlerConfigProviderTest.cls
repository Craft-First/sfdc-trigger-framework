@IsTest
private class CustomMetadataHandlerConfigProviderTest {

    @IsTest
    private static void should_throw_an_exception_for_unknown_handler() {
        final HandlerConfigProvider configProvider = new CustomMetadataHandlerConfigProvider();

        try {
            configProvider.loadConfigurationBySObjectType('non existing sObject');
        } catch (Exception ex) {
            System.assert(ex != null, 'Exception should have been thrown');
        }
    }

    @IsTest
    private static void build_should_return_trigger_handler_config() {
        CustomMetadataHandlerConfigProvider configProvider = new CustomMetadataHandlerConfigProvider();

        TriggerHandler__mdt metadata = new TriggerHandler__mdt();
        metadata.MasterLabel = 'Test';
        metadata.HandlerClass__c = 'TestHandlerClass';
        metadata.HandlerDescription__c = 'TestHandlerClass';

        TriggerHandlerConfig config = configProvider.buildConfiguration(
            metadata
        );

        System.assert(config == null, 'No Config Should have Been Created');
    }
}
