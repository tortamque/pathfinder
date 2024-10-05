import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/config/data_sources/remote/swagger_repository.dart';
import 'package:pathfinder/config/themes/extensions.dart';
import 'package:pathfinder/features/enter_url/presentation/bloc/url_verifier/url_verifier_cubit.dart';
import 'package:pathfinder/features/enter_url/presentation/widgets/enter_url_text_field.dart';
import 'package:pathfinder/widgets/buttons/main_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UrlVerifierCubit, UrlVerifierState>(
      listener: (context, state) {
        if (state is UrlVerifiedSuccess) {
          //context.read<CalculationsServiceCubit>().sendLink();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Success URL'),
            ),
          );
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: MainButton(
                  onPressed: () {
                    final result = context.read<UrlVerifierCubit>().verifyUrl(_urlController.text.trim());
                  },
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text('Start counting process'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
