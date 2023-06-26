FROM --platform=linux/amd64 golang:1.15 as builder
RUN go get github.com/codegangsta/negroni
RUN go get github.com/gorilla/mux github.com/xyproto/simpleredis/v2
COPY main.go .
RUN go build main.go

FROM --platform=linux/amd64 busybox:ubuntu-14.04

COPY --from=builder /go//main /app/guestbook

ADD public/index.html /app/public/index.html
ADD public/script.js /app/public/script.js
ADD public/style.css /app/public/style.css
ADD public/jquery.min.js /app/public/jquery.min.js

WORKDIR /app
CMD ["./guestbook"]
EXPOSE 3000
