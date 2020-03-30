import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  _LoginStoreBase() {
    autorun((_) {
      print(isFormValid);
    });
  }

  @observable
  String email = "";
  @observable
  String password = "";
  @observable
  bool visible = false;
  @observable
  bool loading = false;

  @action
  void setVisible() => visible = !visible;

  @action
  void setEmail(value) => email = value;

  @action
  void setPassword(value) {
    password = value;
  }

  @action
  Future<void> login() async {
    loading = true;
    //Processar
    await Future.delayed(Duration(seconds: 2));

    loading = false;
  }

  @computed
  bool get isEmailValid => email.length > 6;
  @computed
  bool get isPasswordValid => password.length > 6;
  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}
