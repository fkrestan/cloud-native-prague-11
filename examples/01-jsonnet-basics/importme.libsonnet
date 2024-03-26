local greeting = "hello world!";

// the exported/returned object
{
  foo: "bar", // string
  bar: 5, // int
  baz: false, // bool
  list: [1,2,3], // array
  // object
  dict: {
    nested: greeting, // using the local
  },
  hidden:: "incognito!" // an unexported field
}
