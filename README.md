# benthos playground

A couple of benthos pipelines to show how things work.

To make this work you need to ...

* clone the repo
* install [benthos][]
* run e.g. `benthos test ./pipelines/dedupe/...`
* run e.g. `benthos -r "./resources/*.yaml" -c ./pipelines/dedupe/pipeline.yaml`

Stuff to see ...

* `mapping` - do a simple mapping
  * And also show how to read json, protobuf and base64 encoded files
* `dedupe` - do a simple dedupe
  * Note: Because we read directly from json files AND we are
    converting from protobuf AND we are using `content().hash()` as a
    key, we cannot format the json input files with spaces, because
    otherwise the `content().hash()` will fail to dedupe the records
    between the json input and the protobuf input
  * Best practice: If you are reading/brokering from different
    inputs/formats/encodings use `key: "${! json().<field0> }_${!
    json().<field1> }_${! json().<fieldN> }"` to dedupe
* `group_by` - do a simple group_by
  * Note: You need to batch the input batches into one batch to
    make the group_by work
* `window` - shows how batching by `system_window` works
  * Use `./pipelines/window/run.sh` to run this
  * Note: All events that are more than (60+30) 90 secs in the past
    (from the current time) will get ignored
  * Note: All events that are in the future will get ignored
  * Note: The batching happens on absolute minute boundaries (0-59),
    not on relative (to when benthos started) boundaries (e.g. 30-29)

[benthos]: https://benthos.dev
