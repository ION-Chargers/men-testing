#!/bin/bash

# Start mongo
mongod --dbpath /var/lib/mongo --logpath /var/log/mongodb/mongod.log

# Note: if you need to execute more commands, please, add --fork to the mongo
# command
