import 'package:flutter/material.dart';
import 'package:minor/Screens/loggedin_page.dart';
import 'main.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/homePage': return MaterialPageRoute(builder: (_) => const LoggedIN());
      default:
        return _errorRoute();
    }
  }
}

 Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(appBar:
      AppBar(title: const Text('Error')),
      body: const Center(
        child: Text('ERROR')),
    );
  });
}