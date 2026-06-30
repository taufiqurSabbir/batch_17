class TaskModel {
  String? sId;
  String? title;
  String? description;
  String? status;
  String? email;
  String? createdDate;

  TaskModel(
      {this.sId,
        this.title,
        this.description,
        this.status,
        this.email,
        this.createdDate});

  TaskModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    email = json['email'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['email'] = this.email;
    data['createdDate'] = this.createdDate;
    return data;
  }
}
