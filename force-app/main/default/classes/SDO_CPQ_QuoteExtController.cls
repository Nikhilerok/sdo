public with sharing class SDO_CPQ_QuoteExtController {
    private Id quoteId;
    public SBAA__Approval__c[] approvals { get; set; }
    public SDO_CPQ_QuoteExtController(ApexPages.StandardController stdController) {
        quoteId = stdController.getId();
    }
    public String[] quoteUrl {
        get {
            String truncId = quoteId;
            if (truncId.length() > 15) {
                truncId = truncId.substring(0, 15);
            }
            String fullId = quoteId;
            return new String[]{
                    fullId, truncId
            };
        }
        private set;
    }
    public PageReference onSubmit() {
        if (quoteId != null) {
            SBAA.ApprovalAPI.submit(quoteId, SBAA__Approval__c.Quote__c);
        }
        return new PageReference('/' + quoteId);
    }
    public PageReference onRecall() {
        if (quoteId != null) {
            SBAA.ApprovalAPI.recall(quoteId, SBAA__Approval__c.Quote__c);
        }
        return new PageReference('/' + quoteId);
    }
    public PageReference onPreview() {
        if (quoteId != null) {
            approvals = SBAA.ApprovalAPI.preview(quoteId, SBAA__Approval__c.Quote__c);
        }
        return null;
    }
}