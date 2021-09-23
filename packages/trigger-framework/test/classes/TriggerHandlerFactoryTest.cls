@isTest
@SuppressWarnings('PMD.ApexDoc, sf:CommentRequired, sf:MethodNamingConventions')
private class TriggerHandlerFactoryTest {

    @IsTest
    private static void should_return_instances_of_handlers() {
        TriggerHandlerFactory.setConfigProvider((HandlerConfigProvider) new MockHandlerConfigProvider());
        final List<Object> handlers = TriggerHandlerFactory.getHandlersForSObjectType('Mock');
        System.assert(handlers[0] instanceOf MockHandler, 'Instance returned not of the right type');
    }

    @IsTest
    private static void should_return_empty_list_when_config_invalid() {
        TriggerHandlerFactory.setConfigProvider((HandlerConfigProvider) new MockInvalidHandlerConfigProvider());
        final List<Object> handlers = TriggerHandlerFactory.getHandlersForSObjectType('Mock');
        System.assert(handlers.isEmpty(), 'Instance returned not of the right type');
    }

    /**
     * Note: this test method can only validate no excpetion is thrown as metadata
     * records can not be created in test methods
     */
    @IsTest
    private static void should_not_throw_excpetion_when_using_custom_metadata_provider() {

        try {
            List<Object> handlers = TriggerHandlerFactory.getHandlersForSObjectType('NotARealObject');
        } catch (Exception ex) {
            System.assert(ex == null, 'An Exception Should have been thrown');
        }
    }

    public class MockHandlerConfigProvider implements HandlerConfigProvider {
        public List<TriggerHandlerConfig> loadConfigurationBySObjectType(String sObjectType) {
            List<TriggerHandlerConfig> handlers = new List<TriggerHandlerConfig>();
            final TriggerHandlerConfig h1 = new TriggerHandlerConfig.Builder()
                .triggerHandler('TriggerHandlerFactoryTest.MockHandler')
                .description('Mock Handler')
                .build();

            handlers.add(h1);
            return handlers;
        }
    }

    public class MockInvalidHandlerConfigProvider implements HandlerConfigProvider {
        public List<TriggerHandlerConfig> loadConfigurationBySObjectType(String sObjectType) {
            List<TriggerHandlerConfig> handlers = new List<TriggerHandlerConfig>();
            final TriggerHandlerConfig h1 = new TriggerHandlerConfig.Builder()
                .triggerHandler('Invalid')
                .description('Invalid Mock Handler')
                .build();
            handlers.add(h1);
            return handlers;
        }
    }

    public class MockHandler {}
}
