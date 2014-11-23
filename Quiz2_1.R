## Reading data from github api
library(httr)
# 1. Find OAuth settings for github:
# http://developer.github.com/v3/oauth/
oauth_endpoints("github")
# 2. Register an application at https://github.com/settings/applications;
# Use any URL you would like for the homepage URL (http://github.com is fine)
# and http://localhost:1410 as the callback url
#
# Insert your client ID and secret below - if secret is omitted, it will
# look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", "afe5bb2efcbf70519464", secret = "a2f3d5bcb5f82483f7276d60c7e86b6f31b66a07")
# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/repos/jtleek/datasharing", gtoken)
stop_for_status(req)
myjson <- content(req)
myjson