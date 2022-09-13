import 'package:clean_arch_project_template/feature/presentation/user_details/user_details_view.dart';
import 'package:flutter/material.dart';

import '../presentation/widgets/no_page_widget.dart';
import 'constants.dart';
import 'page_constants.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.initialPage:
        {
          return routeBuilder(const UserDetailsPage());
        }
      case PageConst.userDetailsPage:
        {
          return routeBuilder(const UserDetailsPage());
        }
      default:
        const NoPageFound();
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
