
extension StringListExt on List<String> {

  String combineWithAnd() {
    if (isEmpty) return '';
    if (length == 1) return first;
    if (length == 2) return '${this[0]} and ${this[1]}';

    final allExceptLast = sublist(0, length - 1).join(', ');
    final last = this.last;

    return '$allExceptLast, and $last';
  }
}

