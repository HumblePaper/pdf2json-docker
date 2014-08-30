from ubuntu:14.04
maintainer vivekdurai <vivek@humblepaper.com>

# Build this Dockerfile and name the image 'docworker'
RUN apt-get update && apt-get install -y build-essential python-dev wget git python-pip

# install pdf2image
RUN export DEBIAN_FRONTEND=noninteractive && sudo apt-get -y install libfreetype6-dev && wget --no-check-certificate https://pdf2image.googlecode.com/files/pdf2image-0.53-source.tar.gz && mkdir pdf2image && tar xf pdf2image-0.53-source.tar.gz -C pdf2image && cd pdf2image && ./configure && make && make install && apt-get install -y ghostscript

# a few extras - install xhtml2pdf and pydocs
RUN pip install xhtml2pdf pydocx
