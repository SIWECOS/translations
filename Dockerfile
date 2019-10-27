FROM perl:5.30

RUN useradd -m scripts
WORKDIR /home/scripts

RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get install --assume-yes \
    man

COPY cpanfile .
RUN cpanm --installdeps .


COPY bashrc .bashrc
COPY dir2lang      .
COPY dir2lang.txt  .
COPY dir2wiki      .
COPY dir2wiki      .
COPY wiki.conf     .
COPY siwecos.conf  .
COPY lib lib/
USER scripts

