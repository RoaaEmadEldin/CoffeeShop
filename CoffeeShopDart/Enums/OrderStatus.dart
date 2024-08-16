enum OrderStatus{
  Pending,
  Completed;

  @override
  String toString() {
    return this.name;
  }
}