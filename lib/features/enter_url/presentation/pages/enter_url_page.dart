import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/config/routes/app_routes.dart';
import 'package:pathfinder/config/themes/extensions.dart';
import 'package:pathfinder/features/enter_url/presentation/bloc/url_verifier/url_verifier_cubit.dart';
import 'package:pathfinder/features/enter_url/presentation/widgets/enter_url_text_field.dart';
import 'package:pathfinder/widgets/buttons/main_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _urlController = TextEditingController();

  String get input => _urlController.text.trim();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UrlVerifierCubit, UrlVerifierState>(
      listener: (context, state) {
        if (state is UrlVerifiedSuccess) {
          ProblemSolvingRoute($extra: state.url).push(context);
        } else if (state is UrlVerifiedFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set valid API base URL in order to continue',
                style: context.textStyles.regular,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: EnterUrlTextField(
                  controller: _urlController,
                ),
              ),
              const Spacer(),
              MainButton(
                onPressed: () => context.read<UrlVerifierCubit>().verifyUrl(input),
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: const Text('Start counting process'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
