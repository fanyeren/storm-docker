#!/bin/bash

docker build -t="xiahoufeng/storm" storm
docker build -t="xiahoufeng/storm-nimbus" storm-nimbus
docker build -t="xiahoufeng/storm-supervisor" storm-supervisor
docker build -t="xiahoufeng/storm-ui" storm-ui
