part of 'url_verifier_cubit.dart';

sealed class UrlVerifierState {}

final class UrlVerifierInitial extends UrlVerifierState {}

final class UrlVerifiedSuccess extends UrlVerifierState {}

final class UrlVerifiedFailure extends UrlVerifierState {
  final String error;

  UrlVerifiedFailure(this.error);
}
