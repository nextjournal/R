FROM r-base

RUN apt-get update && apt-get install -y curl libcurl4-openssl-dev  openssl libssl-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/local/lib/R/site-library

RUN echo "Installing base64enc library..."
RUN curl -L -O https://cran.rstudio.com/src/contrib/base64enc_0.1-3.tar.gz
RUN R CMD INSTALL base64enc_0.1-3.tar.gz
RUN rm -rf base64enc_0.1-3.tar.gz

RUN echo "Installing rjson library..."
RUN curl -L -O https://cran.rstudio.com/src/contrib/rjson_0.2.15.tar.gz
RUN R CMD INSTALL rjson_0.2.15.tar.gz
RUN rm -rf rjson_0.2.15.tar.gz

RUN echo "Installing plotly library and its dependencies..."
RUN echo "install.packages('plotly', repos='http://cran.rstudio.com/')" | R --quiet --vanilla

WORKDIR /tmp