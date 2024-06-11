# https://github.com/phusion/passenger-docker
# Phusion Passenger with Nginx, support for Ruby/Node
FROM phusion/passenger-customizable:3.0.5

ENV RAILS_ENV=production
ENV BUNDLE_WITHOUT=development:test
ENV BUNDLE_DEPLOYMENT=true
# Set the correct timezone
ENV TZ=Europe/Zurich

# Update the system
RUN apt-get update && apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

# Enable Ruby (Node is included)
RUN /pd_build/ruby-3.3.*.sh

# Ruby 3.3.1
RUN bash -lc 'rvm --default use ruby-3.3.1'

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Activate Nginx + Passenger
RUN rm -f /etc/service/nginx/down
# Load the configuration
RUN rm /etc/nginx/sites-enabled/default
ADD goodtickets.conf /etc/nginx/sites-enabled/goodtickets.conf

# Clone the application
USER app
WORKDIR /home/app
RUN git clone https://github.com/doxa-tech/goodtickets.git

# Prepare the application
WORKDIR /home/app/goodtickets
RUN bundle install
RUN --mount=type=secret,id=master_key,uid=9999 RAILS_MASTER_KEY=$(cat /run/secrets/master_key) bundle exec rake assets:precompile

# Rails migrations are run on startup
COPY --chmod=0755 migrations.sh /etc/my_init.d/40_migrations.sh

USER root
# baseimage-docker's init process
CMD ["/sbin/my_init"]