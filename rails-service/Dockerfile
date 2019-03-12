FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && gem install bundler \
    && apt-get install -y --no-install-recommends \
    && apt-get install alien -y \
    && apt-get install freetds-dev -y \
    && apt-get install libaio1 \
    && apt-get -y install sqlite3 libsqlite3-dev

COPY ./oracle /home/oracle

# Get these files from http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html
RUN alien -i /home/oracle/oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm \
    && alien -i /home/oracle/oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm \
    && alien -i /home/oracle/oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm

ENV ORACLE_HOME /usr/lib/oracle/11.2/client64
ENV PATH ${ORACLE_HOME}/bin:$PATH
ENV LD_LIBRARY_PATH ${ORACLE_HOME}/lib
ENV ORACLE_SID=xe

RUN mkdir /rails-service
WORKDIR /rails-service
COPY Gemfile /rails-service/Gemfile
COPY Gemfile.lock /rails-service/Gemfile.lock
RUN bundle install
COPY . /rails-service
