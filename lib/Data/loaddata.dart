import 'package:first_flutter_project/Data/AppConstant.dart';
import 'package:first_flutter_project/Domain/Affirmation.dart';

List<Affirmation> loadData() {
  return List.generate(10, (index) {
    return Affirmation(desc: affirmations[index], image: photos[index]);
    // New version of dart allow creating objects without the new keyword
  });
}
