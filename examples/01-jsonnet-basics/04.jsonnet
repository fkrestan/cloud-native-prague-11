//
// Basic example
//
local greeting = "hello world!";
local prod = true;

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
  hidden:: "incognito!", // an unexported field

  // The only form of conditions are ternary operators
  condition: if prod then "v1.0" else "latest"
}
