import 'dart:io';
import 'dart:collection';
import '../globals/typedefs.dart';

class Context {
  String ctxName;
  String publicDir;
  bool shouldAutoClose = true;
  String httpProtocol = 'http';
  Set<bool Function(HttpRequest, HttpResponse)> middlewares = Set();
  HashMap<String, HashMap<String, Map<String, Function>>> routes = HashMap();
  Map<String, Object> defaultResponseHeaders = Map();
  Context(this.ctxName);
}

// We always save the reference to the current context in State.
// Here initially the default context.
Context State = contexts[DEFAULT];

// A simple map that holds all our contexts.
// Initially must! hold the default context.
Map<String, Context> contexts = Map.from({DEFAULT: Context(DEFAULT)});
