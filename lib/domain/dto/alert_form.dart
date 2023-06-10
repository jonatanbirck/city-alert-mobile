import '../alert.dart';

class AlertForm {
  String type;
  String observation;

  AlertForm(this.type, this.observation);

  AlertType getRightType() {
    if (type == 'Lixo') {
      return AlertType.TRASH;
    } else if (type == 'Lugar sujo') {
      return AlertType.DIRTY_PLACE;
    } else if (type == 'Vidro quebrado') {
      return AlertType.BROKEN_GLASS;
    } else if (type == 'Dejetos de animais') {
      return AlertType.ANIMAL_WASTE;
    }
    throw Exception("alertType not found");
  }
}