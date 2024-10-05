import 'package:flutter_bloc/flutter_bloc.dart';

part 'url_verifier_state.dart';

class UrlVerifierCubit extends Cubit<UrlVerifierState> {
  UrlVerifierCubit() : super(UrlVerifierInitial());

  void verifyUrl(String url) {
    if (url.isEmpty) {
      emit(UrlVerifiedFailure('Url is empty'));
      return;
    }

    final parsedUrl = Uri.parse(url);

    final result =
        parsedUrl.scheme == 'https' && parsedUrl.host == 'flutter.webspark.dev' && parsedUrl.path == '/flutter/api';

    result ? emit(UrlVerifiedSuccess()) : emit(UrlVerifiedFailure('Invalid URL'));
  }
}
