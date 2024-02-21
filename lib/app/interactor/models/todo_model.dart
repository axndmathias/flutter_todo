// mutability pattern class, that's why it's not as a variable but as a final

class TodoModel {
  final int id;
  final String title;
  final bool check;

  TodoModel({required this.id, required this.title, required this.check});

// To make the changes, using the prototype pattern, better known as copyWith, to make the changes to the data
  TodoModel copyWith({
    int? id,
    String? title,
    bool? check,
  }) {
    return TodoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        check: check ?? this.check);
  }
}
