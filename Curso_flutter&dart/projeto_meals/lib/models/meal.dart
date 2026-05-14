enum Complexity{
  simple,
  medium,
  difficult
}

enum Cost{
  cheap, 
  fair, 
  expensive
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost
  });

  String get complexityText {
    return switch (complexity) {
      Complexity.simple => 'Simples',
      Complexity.medium => 'Médio',
      Complexity.difficult => 'Difícil',
      _ => 'Desconhecida',
    };
  }

  String get costText {
    return switch (cost) {
      Cost.cheap => 'Barato',
      Cost.fair => 'Justo',
      Cost.expensive => 'Caro',
      _ => 'Desconhecido',
    };
  }

}