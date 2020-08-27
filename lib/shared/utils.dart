class Utils {
  static String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid email";
    }else {
      return null;
    }
  }

  static String validatePassword(String value) {
    if (value.length < 7 && value.length >=1) {
      return 'Password must be at least 7 characters';
    }else if(value.length ==0 ){
      return 'Password is required';
    }
    return null;
  }
}