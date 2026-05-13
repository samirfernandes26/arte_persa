String? formatPhoneNumber(String phoneNumber) {
  final cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');

  if (cleaned.length < 10 || cleaned.length > 11) return null;

  final areaCode = cleaned.substring(0, 2);

  if (cleaned.length == 11) {
    // Celular → 5+4
    final part1 = cleaned.substring(2, 7);
    final part2 = cleaned.substring(7);
    return '($areaCode) $part1-$part2';
  } else {
    // Fixo → 4+4
    final part1 = cleaned.substring(2, 6);
    final part2 = cleaned.substring(6);
    return '($areaCode) $part1-$part2';
  }
}
