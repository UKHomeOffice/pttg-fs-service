Feature: Capabilities required for platform integration and support eg healthchecks, logging, auditing

    Scenario: Health check shows DOWN when Barclays API server not reachable
        Given the barclays api is unreachable
        Then the health check response status should be 503

    @Slow
    Scenario Outline: Health check is UP only when API health check is UP
        Given the barclays response has status <api_status>
        Then the health check response status should be <ui_status>
        Examples:
            | api_status | ui_status |
            | 200        | 200       |
            | 400        | 503       |
            | 404        | 503       |
            | 503        | 503       |
