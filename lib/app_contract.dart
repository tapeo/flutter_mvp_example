abstract class View {
  void showMessage(error);

  void showLoading();

  void hideLoading();
}

abstract class Presenter {
  void init();

  void dispose();
}