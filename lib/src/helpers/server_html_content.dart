import 'dart:io';
import 'handle_serving_files.dart';
import 'map_root_path_to_index_html.dart';

Future<dynamic> serveHtmlContent(HttpRequest req) async => req.uri.path == '/'
    ? await mapRootPathToIndexHTml(req)
    : await handleServingFiles(req);