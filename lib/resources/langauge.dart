enum LangaugeType { ENGLISH, FRENCH }

const String FRENCH = 'fr';
const String ENGLISH  = 'en';


extension LangaugeTypeExtension on LangaugeType {
  String getValue() {
    switch (this) {
      case LangaugeType.ENGLISH:
        return 'en';
      case LangaugeType.FRENCH:
        return 'fr';
    }
  }
}
