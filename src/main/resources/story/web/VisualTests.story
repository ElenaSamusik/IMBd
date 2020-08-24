Scenario: Authorization
Given I am on a page with the URL 'https://www.imdb.com/'
When I click on element located `By.xpath(//a[div[text()="Sign In"]])`
When I click on element located `By.xpath(//span[text()="Sign in with IMDb"])`
When I enter `samusik_elena@mail.ru` in field located `By.xpath(//*[@id="ap_email"])`
When I enter `12345678` in field located `By.xpath(//*[@id="ap_password"])`
When I click on element located `By.xpath(//*[@id="signInSubmit"])`
Then the page with the URL 'https://www.imdb.com/?ref_=login' is loaded


Scenario: Performing search for movie by search box
Given I am on a page with the URL 'https://www.imdb.com/?ref_=login'
When I enter `The chroniles of narnia` in field located `By.xpath(//input[@id="suggestion-search"])`
When I click on element located `By.xpath(//button[@id="suggestion-search-button"])`
Then the page with the URL containing 'https://www.imdb.com/find?q=' is loaded

Scenario: Opening page for one of the found products
Given I am on a page with the URL 'https://www.imdb.com/find?q=The+chronicles+of+narnia&ref_=nv_sr_sm'
When I click on element located `By.xpath(//table[@class="findList" and preceding-sibling::h3[text()="Titles"]]/tbody/tr[2]/td[@class="primary_photo"])`
Then the page with the URL 'https://www.imdb.com/title/tt0776766/?ref_=fn_al_tt_2' is loaded

Scenario: Add to Watchlist
Given I am on a page with the URL 'https://www.imdb.com/title/tt0776766/?ref_=fn_al_tt_2'
When I click on element located `By.xpath(//button[contains(@class,"ipc-button uc-add")])`
When I wait until element located `By.xpath(//button[contains(@class,"ipc-button uc-add")])` disappears
Then number of invisible elements `By.xpath(//button[contains(@class,"ipc-button uc-add")])` is EQUAL_TO `1`


Scenario: Navigate to Your WatchList
Given I am on a page with the URL 'https://www.imdb.com/?ref_=nv_home'
When I click on element located `By.xpath(//span[@class ="imdb-header__account-toggle--logged-in imdb-header__accountmenu-toggle navbar__user-name navbar__user-menu-toggle__name navbar__user-menu-toggle--desktop"])`
When I click on element located `By.xpath(//a[@class="ipc-list__item" and @role="menuitem"]/span[text()="Your watchlist"])`
Then the page with the URL containing 'https://www.imdb.com/user/ur123192556/watchlist' is loaded

Scenario: Sort list from Your Watchlist 
Given I am on a page with the URL 'https://www.imdb.com/user/ur123192556/watchlist?ref_=nv_usr_wl'
When I select `Runtime` from drop down located `By.cssSelector(#lister-sort-by-options)`
When I click on element located `By.xpath(//div[@class="export"]/a[text()="Export this list"])`
















