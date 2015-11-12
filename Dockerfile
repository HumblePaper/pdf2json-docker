from ubuntu:14.04
maintainer vivekdurai <vivek@humblepaper.com>

# Build this Dockerfile and name the image 'docworker'
RUN apt-get update && apt-get install -y build-essential python-dev wget git python-pip

# install pdf2image
RUN export DEBIAN_FRONTEND=noninteractive && sudo apt-get -y install libfreetype6-dev && apt-get install -y ghostscript apt-get install -y unzip

RUN wget --no-check-certificate https://github.com/LaSanta/pdf2image/archive/master.zip && mkdir pdf2image && unzip master.zip -d pdf2image && cd pdf2image && ./configure && make && make install 

# a few extras - install xhtml2pdf and pydocs
RUN pip install xhtml2pdf pydocx
