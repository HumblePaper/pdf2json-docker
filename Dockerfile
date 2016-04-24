from ubuntu:14.04	
maintainer vivekdurai <vivek@humblepaper.com>

# Build this Dockerfile and name the image 'docworker'

RUN apt-get update && apt-get install -y --no-install-recommends \
		autoconf \
		automake \
		bzip2 \
		file \
		g++ \
		gcc \
		imagemagick \
		ca-certificates \
	    curl \
	    mercurial \
	    git-core
		python-dev wget git python-pip \
		libbz2-dev \
		libc6-dev \
		libcurl4-openssl-dev \
		libevent-dev \
		libffi-dev \
		libgeoip-dev \
		libglib2.0-dev \
		libjpeg-dev \
		liblzma-dev \
		libmagickcore-dev \
		libmagickwand-dev \
		libmysqlclient-dev \
		libncurses-dev \
		libpng-dev \
		libpq-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		libtool \
		libwebp-dev \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		make \
		patch \
		xz-utils \
		zlib1g-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://github.com/HumblePaper/pdf2json/archive/master.zip && \
  mkdir pdf2json-master && unzip master.zip && cd pdf2json-master && ./configure && make && make install && cd ..

RUN curl -s https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar -v -C /usr/local -xz

ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:/go/bin:/usr/local/bin:/gobranch/bin:$PATH

go get gopkg.in/gographics/imagick.v2/imagick


# a few extras - install xhtml2pdf and pydocs
#RUN pip install xhtml2pdf pydocx
