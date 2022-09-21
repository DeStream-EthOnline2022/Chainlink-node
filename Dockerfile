# Replace latest tag with the version you want to use
FROM smartcontract/chainlink:1.8.0-nonroot

USER root

LABEL version="1.0" 
LABEL description="Chainlink node" 
LABEL maintainer="github@sintaro"

RUN mkdir -p /chainlink
COPY ./data /chainlink

# Replace with your own values
# Ethereum node URL : e.g. ws:// from Infura or Alchemy
# DATABASE_URL : e.g. postgres://postgres:password@postgres:5432/defaultdb
ENV HOST=0.0.0.0 \
    ROOT=/chainlink \
    LOG_LEVEL=debug \
    ETH_CHAIN_ID=80001 \
    CHAINLINK_TLS_PORT=0 \
    SECURE_COOKIES=false \
    ALLOW_ORIGINS=* \
    ETH_URL= \ 
    DATABASE_URL=

EXPOSE 6688

ENTRYPOINT chainlink local n -p /chainlink/.password -a /chainlink/.api