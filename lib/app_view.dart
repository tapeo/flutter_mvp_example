import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_contract.dart';
import 'app_presenter.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> implements View {
  Presenter _presenter;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }

  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _presenter = new AppPresenter(this, prefs);
    _presenter.init();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleSpacing: 0.0,
          title: Text("App"),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, true);
              })),
      body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(),
                _loading
                    ? Center(child: CircularProgressIndicator())
                    : Container()
              ],
            ),
          )),
    );
  }

  @override
  void showMessage(error) {
    if (error != null && error
        .toString()
        .length > 0) {
      showDialog<void>(
          context: this.context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("App"),
              content: Text(error),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  void showLoading() {
    setState(() {
      _loading = true;
    });
  }

  @override
  void hideLoading() {
    setState(() {
      _loading = false;
    });
  }

}