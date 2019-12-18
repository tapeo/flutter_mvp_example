import 'package:shared_preferences/shared_preferences.dart';
import 'app_contract.dart';

class AppPresenter implements Presenter {
  View _view;
  SharedPreferences _prefs;

  AppPresenter(View view, SharedPreferences prefs) {
    this._view = view;
    this._prefs = prefs;
  }

  @override
  void init() {

  }

  @override
  void dispose() {
    this._view = null;
  }
}