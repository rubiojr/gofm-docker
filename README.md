Docker image for https://github.com/ssnat/GoFM

## Usage

```bash
# Replace /path/to/music/folder with the path to your music folder
docker run -it -p 8090:8090 \
               -v /path/to/music/folder:/music:ro \
               --rm ghcr.io/rubiojr/gofm-docker:latest
```
