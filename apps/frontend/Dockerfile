FROM cirrusci/flutter:stable

WORKDIR /app

COPY . .

RUN flutter pub get
RUN flutter build web

COPY build/web /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
