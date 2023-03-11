class ExpansionTileElement {
  ExpansionTileElement(
    this.name, {
    this.selected = false,
    this.avatarUrl,
    this.avatarNumber,
    this.code,
  });
  final String name;
  final bool selected;
  final String? avatarUrl;
  final int? avatarNumber;
  final String? code;

  ExpansionTileElement copy({
    String? name,
    bool? selected,
    String? avatarUrl,
    int? avatarNumber,
    String? code,
  }) {
    return ExpansionTileElement(
      name ?? this.name,
      selected: selected ?? this.selected,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      avatarNumber: avatarNumber ?? this.avatarNumber,
      code: code ?? this.code,
    );
  }
}
