import "Notifier.dart";

class NotifierManager {
  static Notifier getNotifier(String ntfStr) {
    Notifier ntf;
    switch (ntfStr) {
      case "OK":
        ntf = Notifier.OK;
        break;

      case 'NETTOYER_FILTRE':
        ntf = Notifier.NETTOYER_FILTRE;
        break;

      case 'APPUYER_START':
        ntf = Notifier.APPUYER_START;
    }
    return ntf;
  }
}