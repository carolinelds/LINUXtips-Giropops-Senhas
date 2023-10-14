FROM alpine:3.18.4

WORKDIR /app

COPY . .

RUN apk update && \
    apk add --update py-pip && \
    apk add --update curl && \
	rm -rf /var/cache/apk/* 

RUN pip install --no-cache-dir -r requirements.txt

ARG REDIS_HOST

ENV REDIS_HOST=$REDIS_HOST

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]

HEALTHCHECK --timeout=1s CMD curl -f localhost:5000 || exit 1