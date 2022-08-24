// This class provides a wrapper around a StackTrace. It allows the toString
// method to be overridden. This is necessary because the internals of the
// Result class cannot be modified.
class ResultStackTrace {
  final StackTrace _data;

  ResultStackTrace(this._data);

  StackTrace get data => _data;

  @override
  String toString() {
    return '<omitted>';
  }
}
