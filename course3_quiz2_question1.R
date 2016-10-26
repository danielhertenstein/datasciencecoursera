library(httr)
oauth_endpoints("github")
myapp <- oauth_app("get_repo_info",
                   key = "f1ece5610b58c0f5a593",
                   secret = "7b148babedc7a7d5e78ccfb4df836b0208552ecd")
# install.packages("httpuv")
library(httpuv)
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)
repo_info <- content(req)
for(i in 1:length(repo_info)) {print(paste(i, repo_info[[i]]$name))}
repo_info[[10]]