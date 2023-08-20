FROM amirpourmand/al-folio
LABEL MAINTAINER=HaoWang
RUN apt-get update -y
# add locale
RUN apt-get -y install locales
# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

# add ruby and jekyll
RUN gem install jekyll-multiple-languages-plugin
ADD Gemfile /srv/jekyll
WORKDIR /srv/jekyll
RUN bundle install