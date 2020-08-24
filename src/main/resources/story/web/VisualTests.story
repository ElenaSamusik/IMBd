Scenario: Authorization
Given I am on a page with the URL 'https://www.imdb.com/'
When I click on element located `By.xpath(//a[div[text()="Sign In"]])`
When I click on element located `By.xpath(//span[text()="Sign in with IMDb"])`
When I enter `<Email>` in field located `By.xpath(//*[@id="ap_email"])`
When I enter `<Password>` in field located `By.xpath(//*[@id="ap_password"])`
When I click on element located `By.xpath(//*[@id="signInSubmit"])`
Then the page with the URL 'https://www.imdb.com/?ref_=login' is loaded
Examples:
|Email                |Password|
|samusik_elena@mail.ru|12345678|

Scenario: Perform search for movie by search box
Given I am on a page with the URL 'https://www.imdb.com/?ref_=login'
When I enter `The chroniles of narnia` in field located `By.xpath(//input[@id="suggestion-search"])`
When I click on element located `By.xpath(//button[@id="suggestion-search-button"])`
Then the page with the URL containing 'https://www.imdb.com/find?q=' is loaded

Scenario: Open page for one of the found products
Given I am on a page with the URL 'https://www.imdb.com/find?q=The+chronicles+of+narnia&ref_=nv_sr_sm'
When I click on element located `By.xpath(//table[@class="findList" and preceding-sibling::h3[text()="Titles"]]/tbody/tr[2]/td[@class="primary_photo"])`
Then the page with the URL 'https://www.imdb.com/title/tt0776766/?ref_=fn_al_tt_2' is loaded

Scenario: Add to Watchlist
Given I am on a page with the URL 'https://www.imdb.com/title/tt0776766/?ref_=fn_al_tt_2'
When I click on element located `By.xpath(//button[contains(@class,"ipc-button uc-add-wl-button-icon--add")])`


Scenario: Navigate to Your WatchList
Given I am on a page with the URL 'https://www.imdb.com/?ref_=nv_home'
When I click on element located `By.xpath(//span[@class ="imdb-header__account-toggle--logged-in imdb-header__accountmenu-toggle navbar__user-name navbar__user-menu-toggle__name navbar__user-menu-toggle--desktop"])`
When I click on element located `By.xpath(//a[@class="ipc-list__item" and @role="menuitem"]/span[text()="Your watchlist"])`
Then the page with the URL containing 'https://www.imdb.com/user/ur123192556/watchlist' is loaded

Scenario: Sort list from Your Watchlist 
Given I am on a page with the URL 'https://www.imdb.com/user/ur123192556/watchlist?ref_=nv_usr_wl'
When I select `Popularity` from drop down located `By.cssSelector(#lister-sort-by-options)`
When I click on element located `By.xpath(//div[@class="export"]/a[text()="Export this list"])`
When I issue a HTTP GET request for a resource with the URL 'https://www.imdb.com/user/ur123192556/watchlist?ref_=nv_usr_wl_all_0'
Then the response code is equal to '200'




















\






