FROM centurylink/ca-certs

COPY dist/oauth2_proxy /

WORKDIR /

EXPOSE 4180

ENTRYPOINT ["/oauth2_proxy"]
