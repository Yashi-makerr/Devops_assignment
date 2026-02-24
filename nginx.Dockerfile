FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY frontend/dist/angular-15-crud/browser /usr/share/nginx/html