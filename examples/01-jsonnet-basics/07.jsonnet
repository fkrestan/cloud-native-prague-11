//
// Functions
//
local add(x,y) = x + y;
local mul = (function(x, y) x * y);

{
  // Can't render functions as json
  // greet(who): "hello " + who,

  // You need to hide it
  greet(who):: "hello " + who,

  greeting: self.greet("John")
}
