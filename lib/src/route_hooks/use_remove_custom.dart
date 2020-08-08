import '../helpers/handle_remove_route.dart';
import '../globals/state.dart';
import '../globals/typedefs.dart' show ROUTES;

useRemoveCustom(String route, String method) =>
    state[ROUTES] = handleRemoveRoute(state[ROUTES], route, method.toUpperCase());