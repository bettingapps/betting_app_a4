class BoxingMatches {
  List<BoxingMatch> matches;
  BoxingMatches({required this.matches});
}

class BoxingMatch {
  String team1 = '';
  String team2 = '';
  String odds1 = '';
  String odds2 = '';
  String date = '';
  BoxingMatch({
    required this.team1,
    required this.team2,
    required this.odds1,
    required this.odds2,
    required this.date,
  });
}

BoxingMatches dummyData = BoxingMatches(matches: [
  BoxingMatch(
      team1: 'Ankush Hooda',
      team2: 'Isaias Sette',
      odds1: '3.25',
      odds2: '1.33',
      date: 'date'),
  BoxingMatch(
      team1: 'Miles Zalewski',
      team2: 'Youssef Dib',
      odds1: '2.70',
      odds2: '1.35',
      date: 'date'),
  BoxingMatch(
      team1: 'Jack Brubaker',
      team2: 'Troy O Rmeley',
      odds1: '1.30',
      odds2: '3.00',
      date: 'date'),
  BoxingMatch(
      team1: 'Paulo Aokuso',
      team2: 'Renold Quinlan',
      odds1: '1.05',
      odds2: '9.00',
      date: 'date'),
  BoxingMatch(
      team1: 'Harlem Eubank',
      team2: 'Ishmael Ellis',
      odds1: '7.5',
      odds2: '1.1',
      date: 'date'),
  BoxingMatch(
      team1: 'Kostiantyn Dovbyshchenko',
      team2: 'Matty Harris',
      odds1: '1.09',
      odds2: '8.00',
      date: 'date'),
  BoxingMatch(
      team1: 'Isaac Lowe',
      team2: 'Jonathan Santana',
      odds1: '1.2',
      odds2: '4.3',
      date: 'date'),
  BoxingMatch(
      team1: 'John Carter',
      team2: 'Sultan Zaurbek',
      odds1: '1.05',
      odds2: '4.3',
      date: 'date'),
  BoxingMatch(
      team1: 'Erik Robles Ayala',
      team2: 'Lee McGregor',
      odds1: '1.17',
      odds2: '4.1',
      date: 'date'),
  BoxingMatch(
      team1: 'David Jimenez',
      team2: 'Rosendo Hugo Guarneros',
      odds1: '2.01',
      odds2: '1.4',
      date: 'date'),
]);
