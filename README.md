# Rest Api Mock

A simple docker image for creating static mocks.

Build your own docker image by adding files to the docker image, 
or mount a directory into the image to get started.


## Usage with docker

Given a directory structure like:

```
  ./
    /data
      /api
        /files
          2bc3994a98b.json
          index.json
      /bin
        /files
          2bc3994a98b.png
```

To start the server and use the data directory for the API just run:

```
docker run
  -p 8080:8080
  -v $(pwd)/data:/usr/share/nginx/html
  nutgaard/rest-api-mock
```

## Usage with docker compose

```yaml
version: "3.8"
services:
  mock-server:
    image: nutgaard/rest-api-mock
    ports:
      - "8090:8080"
    volumes:
      - "./data:/usr/share/nginx/html"
```

## Usage as custom image

If you want to bake the data into the image you need to create your own Dockerfile, and add the data.
```
FROM nutgaard/rest-api-mock
ADD data /usr/share/nginx/html
```


## File extensions and content-types
Multiple mappings for the `Content-Type` header is provided in the setup. If you need more, please open a issue or provide a PR.


## Index file
Some of the supported filetypes are included in the list of supported index.* files.
If you try to access a folder an index-file will be used if present. 
If multiple index-files are present in the folder, then the follow order is used;
`index.html index.txt index.json index.png index.pdf`


# Credits

This repository is forked from https://github.com/accodeing/REST-API-mock in order to publish the image on duckerhub for easier usage.