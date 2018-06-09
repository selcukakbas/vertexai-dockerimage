FROM rocker/tidyverse:latest

RUN apt-get update -qq \
  && apt-get -y --no-install-recommends install \
    default-jdk \
    default-jre \
  && R -e "install.packages(c('RCurl', 'jsonlite'), repos = 'http://cran.us.r-project.org')" \
  && R CMD javareconf \
  && install2.r --error \
    --repos 'http://h2o-release.s3.amazonaws.com/h2o/rel-wheeler/2/R' \
    h2o
