FROM python:3.6-alpine

LABEL maintainer="Takayuki Hirayama <ykhr0130@gmail.com>"

ARG nkf_installer="http://jaist.dl.sourceforge.jp/nkf/70406/nkf-2.1.5.tar.gz"

RUN apk add --no-cache --virtual .build alpine-sdk && \
    wget ${nkf_installer} && \
    tar zxvf nkf-2.1.5.tar.gz && \
    cd nkf-2.1.5 && \
    make && \
    cp ./nkf /usr/local/bin && \
    cd .. && \
    rm -rf ./nkf-* && \
    pip install awscli && \
    apk del .build

CMD ["sh"]
