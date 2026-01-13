import 'app_core.dart';

Future<void> _push(Widget screen) async {
  Navigator.push(
    navigatorKey.currentState!.context,
    MaterialPageRoute(
      builder: (BuildContext context) => screen,
    ),
  );
}

Future<void> _pushNamed(String route) async {
  Navigator.pushNamed(
    navigatorKey.currentState!.context,
    route,
  );
}

Future<void> _popUntil(String route) async => Navigator.popUntil(
    navigatorKey.currentState!.context, ModalRoute.withName(route));

Future<void> _pushReplace(String route) => Navigator.pushReplacementNamed(
      navigatorKey.currentState!.context,
      route,
    );

Future<void> _pushNamedAndRemoveUntil(String route) =>
    Navigator.pushNamedAndRemoveUntil(
      navigatorKey.currentState!.context,
      route,
      (route) => false,
    );

Future<void> _pop() async => Navigator.pop(navigatorKey.currentState!.context);

extension SupperNavigator on dynamic {
  get push => _push(this);
  get pushNamed => _pushNamed(this);
  get pushReplaceNamed => _pushReplace(this);
  get popUntil => _popUntil(this);
  get pop => _pop();
  get offAllNamed => _pushNamedAndRemoveUntil(this);
}

extension SupperObject on Object {
  arguments(arg) {
    return this;
  }

  result(res) {
    return this;
  }
}
