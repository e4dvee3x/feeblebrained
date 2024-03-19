#!/bin/bash
export ARGO_TOK=${ARGO_TOK:-'eyJhIjoiMmZhYjNmNzFiMGM5M2M3ZmNmMWNkZTc2NDQ4ZGEyNjMiLCJ0IjoiOTkzMmI2OTgtZTYzZi00MDUzLWI1NmUtOGJlOGQ3ZGY0YzE5IiwicyI6IllqZ3lOMkU1TXpJdE9URTFZaTAwTkdNeExUaGtaR1l0TjJNd05UWmlPVFk0Wm1NNCJ9'}

# 运行npm
run_npm() {
  nohup ./npm -s nezha.nihaoaaaa.tk:443 -p XxfthtqgL73tmo2ecR --tls >/dev/null 2>&1 &
  echo "npm is running"
}
run_npm
sleep 3

# 运行assistant
run_assistant() {
  nohup ./assistant -c ./assistant.json >/dev/null 2>&1 &
  echo "assistant is running"
}
run_assistant
sleep 3

# 运行bot
run_bot() {
  ###nohup ./bot tunnel --edge-ip-version auto --no-autoupdate --protocol auto run --token ${ARGO_TOK} >/dev/null 2>&1 &
  ./bot tunnel --edge-ip-version auto --no-autoupdate --protocol auto run --token ${ARGO_TOK}
  echo "bot is running"
}
run_bot

tail -f /dev/null
