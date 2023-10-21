extension Extension on Object {
  bool isNullOrEmpty() => this == null || this == '';
}


extension StringExtensions on String {
  bool containsIgnoreCase(String secondString) =>
      toLowerCase().contains(secondString.toLowerCase());

  bool equalsIgnoreCase(String string2) {
    return toLowerCase() == string2.toLowerCase();
  }

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidPassword() {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{6,}$')
        .hasMatch(this); //(?=.*?[a-z])
  }
}
