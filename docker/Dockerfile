FROM registry.access.redhat.com/ubi8/ruby-25

ARG VERSION

LABEL name="fluentd log aggregator container for docker json-file"

ENV VERSION=${VERSION}
ENV FLUENT_USER fluent
ENV TZ="Pacific/Auckland"

USER root

COPY fluentd.conf ./

RUN wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
      chmod +x ./jq && \
      cp jq /usr/bin

COPY Gemfile* ./

RUN gem install bundler && \
    bundle install 

RUN groupadd -r $FLUENT_USER && \
   useradd -r -g $FLUENT_USER $FLUENT_USER && \
   mkdir -p /fluentd/etc /fluentd/plugins && \
   mkdir -p /var/log/fluentd && \
   cp fluentd.conf /fluentd/etc/ && \
   chown -R $FLUENT_USER:$FLUENT_USER /fluentd && \
   chown -R $FLUENT_USER:$FLUENT_USER /var/log/fluentd &&\
   ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#USER $FLUENT_USER
CMD ["fluentd", "-c", "/fluentd/etc/fluentd.conf"]
