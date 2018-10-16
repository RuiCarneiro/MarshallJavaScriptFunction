# MarshallJavaScriptFunction

Better be safe than sorry!

Sometimes we want to call a JavaScript function to run on our WebView or JavaScript Context, and we have to do it by messaging a String with the function call.

This can be error-prone and difficult to maintain, so I created this Framework that consists only of one function to do just that

## Example

    jsCallString(function: "hello")

returns `hello()`

     jsCallString(function: "login", arguments: "username", "password")

returns `login("username", "password")` notice that it did put the `"` properly.

    print(jsCallString(function: "difficultArguments", arguments: "backlash: \\", ["zero": 0, "one": 1]))

returns `difficultArguments("backlash: \\", ["zero": 0, "one": 1])` 

## Dependecies

There are none.

## Use with your project

You can use it with your free or comercial App, open or closed-source, and you can distribute it in the AppStore (it's Apache 2.0 licensed).

To use with your project, just open the Xcode project, build the Framework and add it to your project.

Or simply import the MarshallJavaScriptFunction.swift file to your project.