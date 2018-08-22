FROM rocker/tidyverse:latest

RUN apt-get update -qq \
  && apt-get -y --no-install-recommends install \
    default-jdk \
    default-jre \
  && R -e "install.packages(c('RCurl', 'jsonlite', 'curl', 'httr', 'rdrop2', 'RODBC', 'reshape2'), repos = 'http://cran.us.r-project.org')" \
  && R -e "install.packages(c('NLP', 'mldr', 'utiml', 'randomForest', 'tokenizers', 'readxl'), repos = 'http://cran.us.r-project.org')" \
  && R -e "install.packages(c('DBI', 'tm', 'replyr', 'tidytext', 'seplyr', 'stringi', 'pacman'), repos = 'http://cran.us.r-project.org')" \
  && R -e "install.packages(c('tidyr', 'caret', 'data.table', 'bigrquery', 'tictoc', 'pbapply'), repos = 'http://cran.us.r-project.org')" \
  && R -e "install.packages(c('rvest', 'imager'), repos = 'http://cran.us.r-project.org')" \
  && R -e "devtools::install_github('bnosac/cronR')" \
  && R -e "devtools::install_github('karthik/rdrop2')" \
  && R -e "devtools::install_github('hadley/emo')" \
  && R -e "devtools::install_github('cloudyr/RoogleVision')" \
  && R CMD javareconf \
  && export ADD=shiny && bash /etc/cont-init.d/add \
  && install2.r --error \
    --repos 'http://h2o-release.s3.amazonaws.com/h2o/rel-wheeler/2/R' \
    h2o
