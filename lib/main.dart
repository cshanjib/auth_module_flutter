import 'package:auth_module_flutter/config/injectable.dart';
import 'package:auth_module_flutter/utils/dialog_utils.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Auth Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String _title;

  MyHomePage({Key key, String title})
      : _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: _appDrawer(context),
      body: ListView(
        children: <Widget>[
          _block(title: 'This should be always visible'),
          _block(
            title: 'This should be visible when the user is logged in.',
            color: Colors.green,
          ),
          _block(
            title: 'This should be visible when the user is logged out.',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _appDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: Text("Login"),
            onTap: () => _login(context),
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            title: Text("User Profile"),
          )
        ],
      ),
    );
  }

  _login(BuildContext context) {
    Navigator.of(context).pop();
    DialogUtils.showAuthDialog(context);
  }

  Widget _block({String title, Color color: Colors.red}) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      color: color,
      child: Text(
        title,
      ),
    );
  }
}
