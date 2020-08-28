# Table of Contents

1. [What is Geoffrey](#1-what-is-geoffrey)
2. [Install Geoffrey](#2-install-geoffrey)
3. [Basic Usage](#3-basic-usage)
4. [Hooks](#4-hooks)

    4.1 [UseHttpServer](#41-usehttpserver)

---

### 1. What is Geoffrey?

Geoffrey is a modern open source HTTP framework inspired by JavaScript modules and react-/vueJS hooks. It's focus is low level code abstraction, simplicity, modularity, safety and performance. While Dart has aged well in the last few years it is yet still one of the newer technologies out there. Compared to the other Dart HTTP frameworks Geoffrey is focusing to be more lightweight, customizable and highly modular. In fact Geoffrey is so modular that you can switch the whole server context on the fly! The server context includes all the routing, middleware, file serving information and so on. You can have as many contexts as you want and switch between them as often as you want without shutting down the server. Imagine you have a situation where you want to remove or create a totally new route depending if someone is logged in or even switch the whole Web-Application. Why ever you would want it you can easily achieve it with Geoffrey! 

## 2. Install Geoffrey

Simply add **geoffey:version** to your pubspec.yaml (**not yet available!!!**)
Then run **pub get** or if flutter sdk is installed run **flutter pub get**.

While you don't need any additional tools or plugins to work with Geoffrey, 
we still want to give you some awesome extensions on your hands that help you code.

**VS Code**

* Dart (Official VSCode plugin for Dart)
* Bracket Pair Colorizer 2
* intent-rainbow
* GitLense
* YAML
* Make Hide

## 3. Basic Usage

In Geoffrey everything is a hook. There is no need to create objects, extend classes, annotate their properties etc. In general most of Geoffrey's hooks can be used literally anywhere in your code! We will cover the few exceptions at a later time. By the way in this example the hooks don't need to be in any fixed order. 

Now then let's import some hooks.

    import 'package:geoffrey/hooks.dart' 
        show useHttpServer, useGet, usePost, useCustom;

To create a simple http server all we need to do is call the **useHttpServer** hook. 

    useHttpServer('localhost', 8080);

Then add a route the server should handle and listen to.

    useGet(
      route: '/home',
      handleRequest: (req, res) => res.write('hello'),
      handleGuard: (req, res) async => await Future.delayed(
            Duration(seconds: 2),
            () => true,
          )); // optional

In the code snipped above, just like the hook identifier implies, **useGet** will create a new route **/home** with the **GET** method. Re-using **useGet**, **usePost** etc. with the same route identifier will override the method for this particular route. Both **handleRequest** and **handleGuard** can be asynchronous. **handleGuard** is optional and if provided **must!** return a boolean. If **handleGuard** returns **false** the server won't execute **handleRequest** and responds with HTTP Status Code 422 - unprocessable Entity. If **handleGuard** is provided it executes before **handleRequest** and thus guards the route from unauthorized access. Now let's add the **POST** method to our **/home** route.
  

    usePost(
      route: '/home',
      handleRequest: (req, res) => res.write('world'));

Notice how we provide the same route identifier to **usePost**. Since the route **/home** already exists the **POST** method will be appended to it. Now the server handles both methods **GET** and **POST** on route **/home**. Also worth noticing is that we omit the optional **handleGuard** on **usePost**. Let's add one last custom method to route **/home** by using the **useCustom** hook.

    useCustom(
      route: '/home',
      method: 'x-magic-rabbit',
      handleGuard: (req, res) => false,
      handleRequest: (req, res) => res.write('a wild magic rabbit appeared!'));

The **useCustom** hook enables the developer to add a custom **method**. It behaves the very same way **useGET** and **usePost** do. The difference is that we need to provide one more argument called **method**. By convention all HTTP method identifiers are capitalized. We can provide the **method** argument all in lowercase. It will be capitalized in the background for us. Also just like the convention with setting custom headers it is a good practise to append the custom method identifiers with a **x-** prefix just like in our example **x-magic-rabbit**. Please pay attention to **handleGuard** and it's return value. Since it returns **false** we will receive the HTTP Status 422 when trying to route to **/home** with the custom method **X-MAGIC-RABBIT**.

That's it! If interested checkout the repo and give it a go. You can run this example by invoking

> dart ./example/use_http_server.dart

Visit localhost:8080/home using the methods **GET**, **POST** and **X-MAGIC-RABBIT**! 

## 4. Hooks

#### 4.1 useHttpServer

fdsfdsfdsfdsf
dsfdsfdsfdsf
sdfdsfdsf
