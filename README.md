# Tanka: for those who hate stirng templating and don't mind braces

Kubernetes API resource manifests are structured data. String templating is
admittedly not the best way to generate those. There now exists a whole class of
purpose built languages specifically designed to generate and validate
structured data that lend themselves well to generating Kubernetes API
resources. Depending on what your use-case is, this might be a killer
application for you.

The Jsonnet language, used by Grafana Tanka, is one such language.


# Slides

```shell
# cat file.json
{

}
```


```shell
# cat file.yaml
{

}
```

WAT?

https://yaml.org/spec/1.2-old/spec.html#id2759572


```shell
# cat file.jsonnet
{

}
```
