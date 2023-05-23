import '../domain/route.dart';
import '../util/MockObjects.dart';

class RoutesController {

  final List<RouteApp> routes = [];

  /*
  Future<List<Route>> findAll() async {
    final response = await http.get(Uri.parse('URL_DO_ENDPOINT'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<Route> routes = [];
      for (var item in data) {
        routes.add(Route.fromJson(item));
      }
      return routes;
    } else {
      throw Exception('Falha ao buscar dados da API');
    }
  }
   */

  Future<List<RouteApp>> findAll() async {
    routes.addAll(MockObjects.createManyRoute(25));
    return routes;
  }

  void create(RouteApp route) async {
    routes.add(route);
  }

}