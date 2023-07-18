# download TShock binary
FROM debian as TShockDownloader

ARG TSHOCK_URL=https://github.com/Pryaxis/TShock/releases/download/v5.2.0/TShock-5.2-for-Terraria-1.4.4.9-linux-x64-Release.zip

WORKDIR /workspace
RUN apt update && apt install -y wget unzip tar && \
    wget ${TSHOCK_URL} -O tshock.zip && \
    unzip tshock.zip -d tshock && \
    cd ./tshock && \
    tar -xf $(ls | grep *.tar) && \
    rm $(ls | grep *.tar)

# terraria server setup
FROM mcr.microsoft.com/dotnet/runtime:6.0 AS server

RUN apt install -y tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ARG SERVER_DIR=/server
COPY --from=TShockDownloader /workspace/tshock ${SERVER_DIR}
WORKDIR ${SERVER_DIR}

COPY ./config.json ${SERVER_DIR}/config

ENTRYPOINT /server/TShock.Server -autocreate ${MAP_SIZE} \
    -ip 0.0.0.0 \
    -port 7777 \
    -password ${PASSWORD} \
    -world /server/worlds/${WORLD_NAME} \
    -config /server/config/config.json \
    -logpath /server/logs \
    -logformat ${LOG_FORMAT} \
    -worldevil ${WORLD_EVIL} \
    -difficulty ${DIFFICULTY}
