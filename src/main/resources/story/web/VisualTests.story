Scenario: Authorization
Given I am on a page with the URL 'https://www.imdb.com/ '
When I click on element located `By.xpath(//a[div[text()="Sign In"]])`
Then the page with the URL 'https://www.imdb.com/registration/signin?ref=nv_generic_lgin&u=%2F' is loaded
