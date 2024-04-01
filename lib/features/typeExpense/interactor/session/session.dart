class TypeExpenseSession {
  static final TypeExpenseSession _instance = TypeExpenseSession._internal();
  factory TypeExpenseSession() => _instance;
  TypeExpenseSession._internal();

  String? uid;

  void setUid(String uid) {
    this.uid = uid;
  }
}
