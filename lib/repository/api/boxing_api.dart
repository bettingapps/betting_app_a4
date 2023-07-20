import 'package:dio/dio.dart';

import '../../models/boxing_mathes.dart';

class BoxingApi {
  static Future<BoxingMatches> getMatches() async {
    List<BoxingMatch> list = [];
    var dio = Dio();
    var res = await dio
        .get('https://www.bestfightodds.com'); //https://www.proboxingodds.com/
    // var res = await dio
    //     .get('https://www.proboxingodds.com'); //https://www.proboxingodds.com/
    final table = RegExp(
        r'<div class="table-outer-wrapper">(.*?)<\/tbody><\/table><\/div><\/div><\/div><\/div>');
    var tables = table.allMatches(res.data);

    tables.forEach((tab) {
      var date = '';
      var h1 = '';

      h1 = RegExp(r'h1>(.*?)<\/h1')
              .stringMatch(tab.group(0)!)
              ?.replaceAll('h1>', '')
              .replaceAll('</h1', '') ??
          '';

      date = RegExp(r'table-header-date">(.*?)<')
              .stringMatch(tab.group(0)!)
              ?.replaceAll('table-header-date">', '')
              .replaceAll('<', '') ??
          '';

      var names =
          RegExp(r'class="t-b-fcc">(.*?)<').allMatches(tab.group(0)!).toList();
      var name1 = names[0]
          .group(0)
          ?.replaceAll('class="t-b-fcc">', '')
          .replaceAll('<', '');
      var name2 = names[1]
          .group(0)
          ?.replaceAll('class="t-b-fcc">', '')
          .replaceAll('<', '');

      String best1 = '';
      String best2 = '';
      try {
        var bests = RegExp(r'class="bestbet">(.*?)<')
            .allMatches(tab.group(0)!)
            .toList();
        best1 = bests[0]
                .group(0)
                ?.replaceAll('class="bestbet">', '')
                .replaceAll('<', '')
                .replaceAll('+', '') ??
            '';
        best2 = bests[1]
                .group(0)
                ?.replaceAll('class="bestbet">', '')
                .replaceAll('<', '')
                .replaceAll('+', '') ??
            '';
      } catch (e) {}
      if (best1 != '' && best2 != '') {
        if (best1.contains('-')) {
          best1 =
              (int.parse(best1) / 100).toStringAsFixed(2).replaceAll('-', '');
        } else {
          best1 = (int.parse(best1) / 100 + 1).toStringAsFixed(2);
        }
        if (best2.contains('-')) {
          best2 =
              (int.parse(best2) / 100).toStringAsFixed(2).replaceAll('-', '');
        } else {
          best2 = (int.parse(best2) / 100 + 1).toStringAsFixed(2);
        }
      }

      print('$date $h1 $name1 $name2  $best1 $best2');
      var item = BoxingMatch(
        team1: name1 ?? '',
        team2: name2 ?? '',
        odds1: best1,
        odds2: best2,
        date: date,
      );
      list.add(item);
    });
    return BoxingMatches(matches: list);
  }
}
