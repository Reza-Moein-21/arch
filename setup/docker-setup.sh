#!/usr/bin/env bash

echo "Adding $USER to the docker group..."

sudo usermod -aG docker "$USER"

echo "Done."
