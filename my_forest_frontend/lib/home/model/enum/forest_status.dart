enum ForestStatus {
  seed('씨앗'),
  sprout('새싹'),
  leaf('잎'),
  adult('성체'),
  delivery('배송');

  const ForestStatus(this.label);

  final String label;
}
