//
// Lazy evaluation and "inheritance"
//
local lazy = {
  foo: "foo",
  bar: self.foo
};

lazy + {
  // Lazy
  foo: "bar",

  // Introspection into "parent"
  baz: super.bar
}
