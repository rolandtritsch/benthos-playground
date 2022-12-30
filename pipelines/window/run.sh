#! /bin/bash

for i in {1..10}; do cat ./data/roland.json; sleep 10; done | benthos -r "./resources/*.yaml" -c ./pipelines/window/pipeline.yaml
