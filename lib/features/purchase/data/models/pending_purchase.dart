import 'dart:convert';

/// A paid plan saved on the device until it is written to the buyer's event.
class PendingPurchase {
  /// The storage key (null until saved).
  final Object? key;
  final String productId;

  /// The phone of the user who bought it; empty when the store delivered it
  /// before anyone was signed in (it then goes to the next signed-in user).
  final String ownerPhone;

  const PendingPurchase({
    this.key,
    required this.productId,
    required this.ownerPhone,
  });

  bool belongsTo(String phone) => ownerPhone.isEmpty || ownerPhone == phone;

  String encode() => jsonEncode({
    'productId': productId,
    'ownerPhone': ownerPhone,
  });

  factory PendingPurchase.decode(Object? key, String value) {
    final json = jsonDecode(value) as Map<String, dynamic>;
    return PendingPurchase(
      key: key,
      productId: json['productId'] as String,
      ownerPhone: json['ownerPhone'] as String? ?? '',
    );
  }
}
