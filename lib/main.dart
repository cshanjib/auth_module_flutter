import 'package:auth_module_flutter/blocs/token/token_cubit.dart';
import 'package:auth_module_flutter/config/injectable.dart';
import 'package:auth_module_flutter/utils/dialog_utils.dart';
import 'package:auth_module_flutter/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await PrefUtils.loadUserAuthData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<TokenCubit>(),
      child: MaterialApp(
        title: 'Auth Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Auth Demo'),
      ),
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
    return BlocBuilder<TokenCubit, TokenState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        drawer: _appDrawer(context, state),
        body: ListView(
          children: <Widget>[
            _block(title: 'This should be always visible'),
            if (state.isLoggedIn)
              _block(
                title: 'This should be visible when the user is logged in.',
                color: Colors.green,
              )
            else
              _block(
                title: 'This should be visible when the user is logged out.',
                color: Colors.blue,
              ),
          ],
        ),
      );
    });
  }

  Widget _appDrawer(BuildContext context, TokenState state) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: Text(state.isLoggedIn ? "Logout" : "Login"),
            onTap: () => _login(context, logged: state.isLoggedIn),
          ),
          Divider(
            height: 0,
          ),
          if (state.isLoggedIn)
            ListTile(
              title: Text("User Profile"),
            )
        ],
      ),
    );
  }

  _login(BuildContext context, {logged}) {
    Navigator.of(context).pop();
    if (logged) {
      PrefUtils.loggedOut(context);
    } else {
      DialogUtils.showAuthDialog(context);
    }
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
