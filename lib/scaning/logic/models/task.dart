class Task {
  int? id;
  String? name;
  int? number;

  Task({
    this.id,
    this.name,
    this.number,
  });

//Для обработки Json, можно было использовать стороннюю библиотеку json_serializable
//Но так как данных мало я не стал добовлять данную библиотеку, а решил прописать в ручную

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    return data;
  }
}
