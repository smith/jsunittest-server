<!DOCTYPE html>
<html>
<head>
  <title>Unit Test unit test file</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <script src="../assets/prototype.js" runat="server" language="javascript"></script>
  <script src="../../unittest.js" runat="server" language="javascript"></script>
  <link rel="stylesheet" href="../assets/test.css" type="text/css" />
</head>
<body>
<h1>Unit Test Unit test file (ASP)</h1>
<p>Test the unit testing library (unittest.js)</p>
<!-- Tests follow -->
<script runat="server" language="javascript">
  var testObj = {
    isNice: function() {
      return true;
    },
    isBroken: function() {
      return false;
    }
  }

  var testResults = new Test.Unit.Runner({
    
    testBuildMessage:  function() {
      this.assertEqual("'foo' 'bar'", this.buildMessage('', '? ?', 'foo', 'bar'))
    },
    
    testAssertEqual: function() { with(this) {
      assertEqual(0, 0);
      assertEqual(0, 0, "test");
      
      assertEqual(0,'0');
      assertEqual(65.0, 65);
      
      assertEqual("a", "a");
      assertEqual("a", "a", "test");
      
      assertNotEqual(0, 1);
      assertNotEqual("a","b");
      assertNotEqual({},{});
      assertNotEqual([],[]);
      assertNotEqual([],{});
    }},

    testAssertEnumEqual: function() { with(this) {
      assertEnumEqual([], []);
      assertEnumEqual(['a', 'b'], ['a', 'b']);
      assertEnumEqual(['1', '2'], [1, 2]);
      assertEnumNotEqual(['1', '2'], [1, 2, 3]);
    }},
    
    testAssertHashEqual: function() { with(this) {
      assertHashEqual({}, {});
      assertHashEqual({a:'b'}, {a:'b'});
      assertHashEqual({a:'b', c:'d'}, {c:'d', a:'b'});
      assertHashNotEqual({a:'b', c:'d'}, {c:'d', a:'boo!'});
    }},
    
    testAssertRespondsTo: function() { with(this) {
      assertRespondsTo('isNice', testObj);
      assertRespondsTo('isBroken', testObj);
    }},
    
    testAssertIdentical: function() { with(this) { 
      assertIdentical(0, 0); 
      assertIdentical(0, 0, "test"); 
      assertIdentical(1, 1); 
      assertIdentical('a', 'a'); 
      assertIdentical('a', 'a', "test"); 
      assertIdentical('', ''); 
      assertIdentical(undefined, undefined); 
      assertIdentical(null, null); 
      assertIdentical(true, true); 
      assertIdentical(false, false); 
      
      var obj = {a:'b'};
      assertIdentical(obj, obj);
      
      assertNotIdentical({1:2,3:4},{1:2,3:4});
      
      assertIdentical(1, 1.0); // both are typeof == 'number'
      
      assertNotIdentical(1, '1');
      assertNotIdentical(1, '1.0');
    }},
    
    testAssertNullAndAssertUndefined: function() { with(this) {
      assertNull(null);
      assertNotNull(undefined);
      assertNotNull(0);
      assertNotNull('');
      assertNotUndefined(null);
      assertUndefined(undefined);
      assertNotUndefined(0);
      assertNotUndefined('');
      assertNullOrUndefined(null);
      assertNullOrUndefined(undefined);
      assertNotNullOrUndefined(0);
      assertNotNullOrUndefined('');
    }},
    
    testAssertMatch: function() { with(this) {
      assertMatch(/knowmad.jpg$/, 'http://script.aculo.us/images/knowmad.jpg');
      assertMatch(/Fuc/, 'Thomas Fuchs');
      assertMatch(/^\$(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$/, '$19.95');
      assertMatch(/(\d{3}\) ?)|(\d{3}[- \.])?\d{3}[- \.]\d{4}(\s(x\d+)?){0,1}$/, '704-343-9330');
      assertMatch(/^(?:(?:(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(\/|-|\.)(?:0?2\1(?:29)))|(?:(?:(?:1[6-9]|[2-9]\d)?\d{2})(\/|-|\.)(?:(?:(?:0?[13578]|1[02])\2(?:31))|(?:(?:0?[1,3-9]|1[0-2])\2(29|30))|(?:(?:0?[1-9])|(?:1[0-2]))\2(?:0?[1-9]|1\d|2[0-8]))))$/, '2001-06-16');
      assertMatch(/^((0?[123456789])|(1[012]))\s*:\s*([012345]\d)(\s*:\s*([012345]\d))?\s*[ap]m\s*-\s*((0?[123456789])|(1[012]))\s*:\s*([012345]\d)(\s*:\s*([012345]\d))?\s*[ap]m$/i, '2:00PM-2:15PM');
      assertNoMatch(/zubar/, 'foo bar');
    }},
    
    testAssertInstanceOf: function() { with(this) {
      assertInstanceOf(String, new String);
      assertInstanceOf(RegExp, /foo/);
      assertNotInstanceOf(String, {});
    }}
  });
</script>
<%= testResults.toHTML() %>
</body>
</html>
