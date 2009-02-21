unittestjs-server
=================

This is a port of the unit test library included with [Prototype](http://prototypejs.org) 1.6.0.2 that can run on some server-side JavaScript platforms. (The unit test library has since been forked into [JsUnitTest](http://jsunittest.com/), which does not depend on Prototype; this library does.)

Instead of directly updating the DOM like the original library, this is used by assigning your `new Test.Unit.Runner(...)` instance to a variable, then calling the `toHTML()` method on it to write it to the output (with `Response.write()` on ASP or `document.write()` on Jaxer, for instance.) 

Tests that test the test library are included for Jaxer, ASP, and client-side (browser) in the `test/unit` directory.  

The copy of prototype.js in the `test/assets` directory is [Prototype ASP](http://nlsmith.com/projects/prototype-asp/), which is required for use on ASP, but any copy of Prototype 1.6 should work for other platforms.
