import '../app_utils/app_strings.dart';

class ValidationForm {
  static String? phoneValidator(String? value) {
    bool isValid =
        RegExp(r"^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})")
            .hasMatch(value!);
    if (value.isEmpty) {
      return AppStrings.pleaseEnterPhoneNumber;
    } else if (!isValid) {
      return AppStrings.phoneNumberNotValid;
    }
    return null;
  }

  static String? passwordValidator(String? v) {
    if (v?.isEmpty ?? true) {
      return AppStrings.pleaseEnterPassword;
    } else if (v!.length <= 5) {
      return AppStrings.passwordNotValid;
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(
    String? v,
    String text,
  ) {
    if (v?.isEmpty ?? true) {
      return AppStrings.passwordNotMatch;
    } else if (text != v) {
      return AppStrings.passwordNotMatch;
    } else {
      return null;
    }
  }

  static String? nameValidator(String? v) {
    if (v == null || v.trim().isEmpty) {
      return AppStrings.pleaseEnterName;
    }
    List<String> nameParts = v.trim().split(RegExp(r'\s+'));
    if (nameParts.length < 2) {
      return "Please enter at least a first and last name";
    }
    return null;
  }
}
