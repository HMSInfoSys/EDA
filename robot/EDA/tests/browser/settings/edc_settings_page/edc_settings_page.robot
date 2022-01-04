*** Settings ***
Documentation   Validate Education Cloud Settings home page
Resource        robot/EDA/resources/EDA.robot
Library         cumulusci.robotframework.PageObjects
...             robot/EDA/resources/EducationCloudSettingsPageObject.py
...             robot/EDA/resources/ReleaseManagementPageObject.py
...             robot/EDA/resources/EDASettingsPageObject.py

Suite Setup     Open Test Browser
Suite Teardown  Capture screenshot and delete records and close browser

*** Test Cases ***
Verify products tools and resources tiles are displayed
    [Documentation]         Validates the products, tools and resources tiles are displayed.
    [tags]                  rbt:high        W-9549044
    Go to education cloud settings home
    Current page should be                  Home        Education Cloud Settings
    Verify app tiles displayed
    ...                                     Tools=Settings Health Check
    ...                                     Resources=Trailhead
    ...                                     Resources=Trailblazer Community
    ...                                     Resources=YouTube

Verify release management page is displayed when user clicks on go to release management button
    [Documentation]         Validates 'Release Management' page is displayed after clicking on the Go to Release Management
    [tags]                  rbt:high        W-10059978
    Go to education cloud settings home
    Current page should be                  Home        Education Cloud Settings
    Click app in edc home                   Go to Release Management
    Current page should be                  Home        Release Management

Verify EDA product card is displayed
    [Documentation]         Validates the EDA product card is displayed.
    [tags]                  rbt:high        W-10073560
    Go to education cloud settings home
    Current page should be                  Home        Education Cloud Settings
    Verify app tiles displayed  Products=Education Data Architecture
    Verify product card avatar displayed  EDA
    Verify product card description displayed  Education Data Architecture (EDA) is the foundation of the Education Cloud.
    Verify product card button displayed  Go to EDA Settings.
    verify product card button displayed  Go to the EDA documentation.
    Verify product card button displayed  Go to EDA Trailhead modules.

Verify mocked SAL product card is displayed
    [Documentation]         Validates the mocked sal product card is displayed.
    [tags]                  rbt:high        W-10073560
    Go to education cloud settings home
    Current page should be                  Home        Education Cloud Settings
    Verify app tiles displayed  Products=Advisor Link (Mocked)
    Verify product card avatar displayed  TAL
    Verify product card description displayed  dvisor Link (Mocked) gives advisors and advisees new tools to help foster focused conversations about education success.
    Verify product card button displayed  Go to Advisor Link (Mocked) Settings
    verify product card button displayed  Go to Advisor Link (Mocked) Documentation
    Verify product card button displayed  Go to Advisor Link (Mocked) Trailhead

Verify EDA settings page is displayed when user clicks on the settings button under Education Data Architecture product tile
    [Documentation]         Validates 'EDA Settings' page is displayed after clicking on the settings button under Education Data Architecture product tile
    [tags]                  rbt:high        W-10073560
    Go to education cloud settings home
    Current page should be                  Home        Education Cloud Settings
    Sleep                       2
    Click product card button in edc home   Go to EDA Settings.
    Current page should be                  Home        EDA Settings

Verify EDA documents page is displayed when user clicks on the documentation button under Education Data Architecture product tile
    [Documentation]         Validates EDA documents page is displayed after clicking on the documentation button under Education Data Architecture product tile
    [tags]                  rbt:high        W-10073560
    Go to education cloud settings home
    Current page should be                  Home        Education Cloud Settings
    Click product card button in edc home   Go to the EDA documentation.
    ${handles}=    Get Window Handles
    Switch Window    locator=NEW
    Verify eda documentation  powerofus.force.com/s/article/EDA-Documentation   

Verify Trailhead page is displayed when user clicks on the trailhead button under Education Data Architecture product tile
    [Documentation]         Validates EDA trailhead page is displayed after clicking on the trailhead button under Education Data Architecture product tile
    [tags]                  rbt:high        W-10073560
    Go to education cloud settings home
    Current page should be                  Home        Education Cloud Settings
    Click product card button in edc home   Go to EDA Trailhead modules.
    ${handles}=    Get Window Handles
    Switch Window    locator=NEW
    Verify eda documentation  trailhead.salesforce.com/en/content/learn/trails/highered_heda          
