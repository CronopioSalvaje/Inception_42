#!/bin/bash

exec redis-server --bind 0.0.0.0 --protected-mode no --appendonly yes --port 6379