class TextFormatter {

  static String formatSubtitle(String text, {int maxLength = 10}) {
    return text.length > maxLength ? '${text.substring(0, maxLength)} ...' : text ;
  }

}