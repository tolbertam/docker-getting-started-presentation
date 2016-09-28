FROM node:6.6
RUN git clone --branch 3.3.0 https://github.com/hakimel/reveal.js.git
RUN cd reveal.js && npm install
RUN npm install -g grunt-cli
ADD index.html /reveal.js/index.html
ADD dockerpres.css /reveal.js/css/theme/dockerpres.css
ADD solarized-light.css /reveal.js/lib/css/solarized-light.css
ADD static /reveal.js/static
WORKDIR /reveal.js/
ENTRYPOINT ["grunt", "serve"]
EXPOSE 8000
