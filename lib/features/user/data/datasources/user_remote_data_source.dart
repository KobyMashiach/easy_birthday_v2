import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserRemoteDataSource {
  Future<Map<String, dynamic>?> getUser(String phoneNumber);
  Future<bool> userExists(String phoneNumber);
  Future<void> createUser(String phoneNumber, Map<String, dynamic> data);
  Future<void> updateUser(String phoneNumber, Map<String, dynamic> data);
  Future<void> deleteUser(String phoneNumber);
}

/// Firestore `users/{phoneNumber}` documents.
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  CollectionReference<Map<String, dynamic>> get _users =>
      FirebaseFirestore.instance.collection('users');

  @override
  Future<Map<String, dynamic>?> getUser(String phoneNumber) async {
    final doc = await _users.doc(phoneNumber).get();
    return doc.data();
  }

  @override
  Future<bool> userExists(String phoneNumber) async =>
      (await _users.doc(phoneNumber).get()).exists;

  @override
  Future<void> createUser(String phoneNumber, Map<String, dynamic> data) =>
      _users.doc(phoneNumber).set(data);

  @override
  Future<void> updateUser(String phoneNumber, Map<String, dynamic> data) =>
      _users.doc(phoneNumber).update(data);

  @override
  Future<void> deleteUser(String phoneNumber) =>
      _users.doc(phoneNumber).delete();
}
