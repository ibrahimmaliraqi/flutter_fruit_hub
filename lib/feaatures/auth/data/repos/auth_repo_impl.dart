import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/services/shared_prefs.dart';
import 'package:fruit_hub/feaatures/auth/data/models/user_model.dart';
import 'package:fruit_hub/feaatures/auth/data/repos/auth_repos.dart';

class AuthRepoImpl extends AuthRepos {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = UserModel(
        email: email,
        name: name,
        uId: credential.user!.uid,
      );
      await SharedPrefs.setString(kUserName, name);

      await addUser(user: user);

      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } on FirebaseException catch (e) {
      return left(AuthFailure.unknown(e.message ?? e.toString()));
    } catch (e) {
      return left(AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = await getUser(uId: credential.user!.uid);

      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseAuthException(e));
    } on FirebaseException catch (e) {
      return left(AuthFailure.unknown(e.message ?? e.toString()));
    } catch (e) {
      return left(AuthFailure.unknown(e.toString()));
    }
  }

  Future<void> addUser({
    required UserModel user,
  }) async {
    await firestore.collection('users').doc(user.uId).set(user.toJson());
  }

  Future<UserModel> getUser({
    required String uId,
  }) async {
    final doc = await firestore.collection('users').doc(uId).get();

    if (!doc.exists || doc.data() == null) {
      throw Exception('User data not found in Firestore');
    }

    return UserModel.fromJson(doc.data()!);
  }
}
