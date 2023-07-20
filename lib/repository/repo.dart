import '../models/boxing_mathes.dart';
import 'api/boxing_api.dart';

class Repo {
  Future<BoxingMatches> getMatches() async {
    return await BoxingApi.getMatches();
  }
}
