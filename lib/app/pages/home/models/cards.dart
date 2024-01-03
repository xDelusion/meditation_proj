class Cards {
  final String title;
  final String route;

  Cards({required this.title, required this.route});
}

List<Cards> cardData = [
  Cards(title: 'Tips', route: '/tips'),
  Cards(title: 'Exercise Videos', route: '/exercise'),
  Cards(title: 'Music', route: '/music'),
  Cards(title: 'Meditation', route: '/meditation'),
];
