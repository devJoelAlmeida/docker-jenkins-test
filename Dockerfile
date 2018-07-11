FROM python:3.6-alpine

ENV APPDIR /app

ENV TZ Europe/Lisbon

ADD . $APPDIR/

WORKDIR $APPDIR

RUN apk --no-cache add \
        build-base \
        jpeg-dev \
        zlib-dev \
        g++ \
        freetype-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && chmod +x main.py \
    && ln -snf /usr/share/zoneinfo/$TZ/etc/localtime && echo $TZ > /etc/timezone \
    && mv data /

CMD ["python","main.py"]