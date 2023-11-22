class Problem {
  int? id;
  String? name;
  String? description;

  Problem(problem) { 
    id = problem['id'];
    print('vvvvvvvvvvvvvvvvvvvvvvvvvvvv');
    print(problem['name']);
    name = problem['name'];
    description = problem['description'];
  }
}
