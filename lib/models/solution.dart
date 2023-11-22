class Solution {
  int? id;
  String? name;
  String? description;

  Solution(solution) {
    id = solution['id'];
    name = solution['name'];
    description = solution['description'];
  }
}