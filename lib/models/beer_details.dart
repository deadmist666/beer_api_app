class Beer {
  final String name;
  final String description;
  final String image;

  const Beer({required this.name, required this.description, required this.image});
}

List<Beer> fooBeer = [
  Beer(name: 'Beer', description: 'description', image: 'image'),
  Beer(name: 'Beer', description: 'description1', image: 'image1'),
  Beer(name: 'Beer', description: 'description2', image: 'image2'),
];
