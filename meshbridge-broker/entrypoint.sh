#!/bin/sh
set -e
# 未設定時預設為 official_bridge
: "${MESHBRIDGE_CONNECTION_NAME:=official_bridge}"
# 用 sed 替換模板中的變數，寫入正式設定檔（不依賴 gettext/envsubst）
sed "s/\${MESHBRIDGE_CONNECTION_NAME}/$MESHBRIDGE_CONNECTION_NAME/g" \
  /templates/mosquitto.conf > /mosquitto/config/mosquitto.conf
cp /templates/passwd /mosquitto/config/passwd
cp /templates/acl /mosquitto/config/acl
chown mosquitto:mosquitto /mosquitto/config/passwd /mosquitto/config/acl
chmod 600 /mosquitto/config/passwd /mosquitto/config/acl
exec /docker-entrypoint.sh mosquitto -c /mosquitto/config/mosquitto.conf