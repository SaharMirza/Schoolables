class TextValidator {
  // Validator for Name
  static String name(String text) {
    if (text.isEmpty) {
      return 'Name is required';
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(text)) {
      return 'Only alphabets and space are allowed';
    }
    if (text.length < 3) {
      return 'Name must be at least 3 characters';
    }
    if (text.length > 20) {
      return 'Name must be less than 20 characters';
    }
    return '';
  }

  // Validator for Email
  static String email(String text) {
    if (text.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(text)) {
      return 'Invalid email';
    }
    return '';
  }

  // Validator for CVV
  static String cvv(String text) {
    if (text.isEmpty) {
      return 'required';
    }
    if (!RegExp(r'^[0-9]{3}$').hasMatch(text)) {
      return 'invalid';
    }
    return '';
  }

  // Validator for Card Account Number
  static String cardAccountNumber(String input) {
    // remove all spaces
    input = input.replaceAll(RegExp(r' '), '');
    if (input.isEmpty) {
      return 'required';
    }
    if (!RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$').hasMatch(input) &&
        !RegExp(r'^5[1-5][0-9]{14}$').hasMatch(input) &&
        !RegExp(r'^3[47][0-9]{13}$').hasMatch(input) &&
        !RegExp(r'^3(?:0[0-5]|[68][0-9])[0-9]{11}$').hasMatch(input) &&
        !RegExp(r'^6(?:011|5[0-9]{2})[0-9]{12}$').hasMatch(input) &&
        !RegExp(r'^(?:2131|1800|35\d{3})\d{11}$').hasMatch(input)) {
      return 'Invalid card number';
    }
    return '';
  }

  // Validator for phone number
  // valid phone number eg: +923000000000
  static String phoneNumber(String input) {
    // remove all spaces
    input = input.replaceAll(RegExp(r' '), '');
    // give error when input is empty
    if (input.isEmpty) {
      return 'Phone number cannot be empty';
    }
    // give error when input doesnt start +92
    if (!input.startsWith('+92')) {
      return '+92 is required';
    }
    if (!input.startsWith('+923')) {
      return 'invalid operator code 3XX';
    }
    // give error when input is less than 13 characters
    if (input.length < 13) {
      return 'Phone number should be 13 digits';
    }
    // give error when input is more than 13 characters
    if (input.length > 13) {
      return 'Phone number should be 13 digits';
    }
    return '';
  }

  // Validator for postal code
  static String postalCode(String input) {
    if (input.isEmpty) {
      return 'Code can\'t empty';
    }
    if (!RegExp(r'^[0-9]{5}$').hasMatch(input)) {
      return 'Invalid postal code';
    }
    return '';
  }

  // Validator for date
  // format: mm/yy
  static String expiryDate(String input) {
    if (input.isEmpty) {
      return 'Date can\'t empty';
    }
    if (!RegExp(r'^[0-9]{2}/[0-9]{2}$').hasMatch(input)) {
      return 'Invalid date';
    }
    return '';
  }

  // Validator for required string
  static String requiredString(String input) {
    if (input.isEmpty) {
      return 'This field is required';
    }
    return '';
  }

  // Validator for required text of type text
  static String requiredText(String input) {
    if (input.isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(input)) {
      return 'Only alphabets are allowed';
    }
    return '';
  }

  static String isLink(String input) {
    final RegExp linkRegExp = RegExp(
      r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$',
      caseSensitive: false,
    );
    if (input.isEmpty) {
      return 'This field should be a link';
    }
    if (!linkRegExp.hasMatch(input)) {
      return 'Only link are allowed';
    }
    return '';
  }

  static String isGoogleLink(String input) {
    final RegExp mapRegExp = RegExp(
      r'^https:\/\/www\.google\.com\/maps\/.+[?&]q=([^&]+)',
      caseSensitive: false,
    );
    if (input.isEmpty) {
      return 'This field should be a google link';
    }
    if (!mapRegExp.hasMatch(input)) {
      return 'Only Google Link are allowed';
    }
    return '';
  }

  static String isFBLink(String input) {
    final RegExp facebookRegExp = RegExp(
      r'^https?:\/\/(?:www\.|m\.|web\.)*facebook\.com\/(?:[a-zA-Z0-9.\-]*\/)*([a-zA-Z0-9.\-]+)(?:\/|\?)?.*$',
      caseSensitive: false,
    );
    if (input.isEmpty) {
      return 'This field should be a facebook link';
    }
    if (!facebookRegExp.hasMatch(input)) {
      return 'Only Facebook Link are allowed';
    }
    return '';
  }

  static String isInstaLink(String input) {
    final RegExp instagramRegExp = RegExp(
      r'^https?:\/\/(?:www\.)*instagram\.com\/([a-zA-Z0-9_]+)(?:\/|\?)?.*$',
      caseSensitive: false,
    );
    if (input.isEmpty) {
      return 'This field should be a instagram link';
    }
    if (!instagramRegExp.hasMatch(input)) {
      return 'Only Instagram Link are allowed';
    }
    return '';
  }
}
