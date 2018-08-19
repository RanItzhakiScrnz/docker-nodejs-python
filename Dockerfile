FROM beevelop/nodejs:6

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN locale

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8 

RUN apt-get update && \
    apt-get install -y git
RUN apt-get update \
    && apt-get -y install \
        software-properties-common \
    && add-apt-repository -y ppa:brightbox/ruby-ng \
    && apt-get update \
    && apt-get -y install \
        ruby2.3 \
        ruby2.3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN gem install compass sass compass-import-once sass-globbing
RUN gem install animation --pre