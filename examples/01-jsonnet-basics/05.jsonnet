//
// Imports
//
// You can import json and yaml directly too
// .libsonnet is just a convention for libraries
local test = import "./importme.libsonnet";

test.dict.nested + " " + test.hidden

// Doesn't work. Local variables are indeed module local.
// test.greeting
