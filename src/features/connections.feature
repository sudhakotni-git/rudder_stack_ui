Feature:
    Login to application and navigate to Connections page
    connect source to destination
    Check if a connection exists between source and destination


    Scenario: Login to application
        Given I open the url "https://app.rudderstack.com/login"
        When I set "jexawac276@othao.com" to the inputfield "#text-input-email"
        And I set "RudderStack@123" to the inputfield "#text-input-password"
        And I click on the button "button.ant-btn"
        And I wait for the element "div=Add an extra layer of security" becomes displayed
        And I load the url "https://app.rudderstack.com/addmfalater"
        And I wait for the element "div=You can still enable 2FA in Settings" becomes displayed
        And I click on the button "button.ant-btn"
        Then I expect that element "h3=Connections" becomes displayed

    Scenario: Connect source and destination
        Given the element "span=RudderStack" is displayed
        When I click on the element "span=RudderStack"
        And I wait for the element "h3=RudderStack" becomes displayed
        And I click on the element "div=Overview"
        And I wait for the element "span=Add Destination" becomes displayed
        And I move to element "span=Add Destination"
        And I move to element "span=Use Existing Destination"
        And I click on the element "span=Use Existing Destination"
        And I wait for the element "h3=Connect destinations" becomes displayed
        And I click on the element "div=RudderStack_Destination"
        And I click on the button "span=Continue"
        And I wait for the element "h4=Connection Settings" becomes displayed
        And I click on the button "span=Continue"
        Then I expect that element "div.ant-table-content" becomes displayed
        * I expect that element "div=RudderStack_Destination" becomes displayed
        * I expect that element "div=Enabled" becomes displayed

    Scenario: Check if connection exists between source and destination
        Given I open the url "https://app.rudderstack.com"
        When I wait for the element "div.m-b-lg" becomes displayed
        Then I expect that element "svg.leader-line" becomes displayed

    Scenario: Cleanup connection after test
        When I click on the element "span=RudderStack"
        And I wait for the element "h3=RudderStack" becomes displayed
        And I click on the element "div=Overview"
        And I click on the element "[aria-label='Context menu']"
        And I move to element "span=Disconnect Destination"
        And I click on the element "span=Disconnect Destination"
        And I wait for the element "h4=Confirm" becomes displayed
        And I click on the button "span=Confirm"
        Then I expect that element "div.ant-table-content" becomes not displayed



