FROM ubuntu:16.04

LABEL authors="Andreas Hoelzl <ahoelzl23@gmail.com>"

RUN apt-get update
RUN apt-get install -y qtdeclarative5-dev
RUN apt-get install -y qt5-default qtbase5-dev qtscript5-dev make g++


RUN cd /tmp \
&& apt-get update \
&& apt-get install -y curl apt-utils wget unzip\
&& rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/local/artify && \
	curl -SL https://www.dropbox.com/s/94rxzorhx92gbro/artify.tar.gz -o artify.tar.gz && \
	tar -xvf artify.tar.gz -C usr/local/artify/ &&\
        chmod +x usr/local/artify/artify

COPY ressources/  /

#CMD ["find", "*" ,".", "-maxdepth", "2"]
ENTRYPOINT ["/usr/local/artify/artify","--device","/cpu:0"]
CMD ["--content_img","lion.jpg", "--style_imgs","the_scream.jpg", "--style_imgs_dir", "files", "--content_img_dir","files", "--verbose"]



