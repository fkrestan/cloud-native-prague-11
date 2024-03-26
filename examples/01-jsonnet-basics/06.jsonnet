//
// Merging
//
local secret = {
  kind: "Secret",
  metadata: {
    name: "mySecret",
    namespace: "default", // want to change this
  },
  data: {
    foo: std.base64("foo") // there is standard library
  }
};

// patch
local patch = {
  metadata+: {
    namespace: "myApp"
  }
};

secret + patch
