# benthos playground

A couple of benthos pipelines to show how things work.

To make this work you need to ...

* clone the repo
* install [benthos][]
* run e.g. `benthos test ./pipelines/dedupe/...`
* run e.g. `benthos -r "./resources/*.yaml" -c ./pipelines/dedupe/pipeline.yaml`

Stuff to see ...

* `mapping` - do a simple mapping
  * and also show how to read json, protobuf and base64 encoded files
* `dedupe` - do a simple dedupe
  * Note that dedupe with `key: ${! content().hash("xxbase64")` will
    not work
* `group_by` - do a simple group_by
  * Note that you need to batch the input batches into one batch to
    make the group_by work

[benthos]: https://benthos.dev
