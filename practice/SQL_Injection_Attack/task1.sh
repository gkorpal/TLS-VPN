#!/usr/bin/env bash

dockps        # Alias for: docker ps --format "{{.ID}} {{.Names}}"
docksh df     # Alias for: docker exec -it <id> /bin/bash

## MySQL
# mysql> SELECT * FROM credential WHERE Name='Alice';
