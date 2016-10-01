# Nginx Prerender

Single Page Applications need to ensure they are crawled successfully by Google, or correctly linked on Facebook, Twitter, etc. Using NGinx to detect bots, we can ensure that they are only ever served Prerendered HTML via the Prerender.io service.

The container uses [confd](https://github.com/kelseyhightower/confd) for a one-time configuration of Nginx when the container starts, using environment variables. The Nginx configuration file is written to work in conjunction with a Prerender service and S3 Website.

## Usage

The container requires the presence of three environment variables. These variables will be used to configure Nginx when the container starts.

**Note:** The resulting configuration is checked for validity.

| Env             | Purpose                                                                                               |
|:----------------|:------------------------------------------------------------------------------------------------------|
| `LISTEN_ON`     | Determines which port Nginx will listen on (defaults to 80).                                          |
| `SERVER_NAME` | Listening on which server name. |
| `PRERENDER_TOKEN` | Token for the Prerender Service. |
| `UPSTREAM_SERVICE` | The upstream prerendering service to connect to.

## Brief Example

```
docker run -p 80:80 \
           -e SERVER_NAME=localhost
           -d davidkelley/nginx-prerender
```

This container would then start listening to traffic on port `80`, pre-rendering HTML using the defined service or user agents identifying themselves as bots.
