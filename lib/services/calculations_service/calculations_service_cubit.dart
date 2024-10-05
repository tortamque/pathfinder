import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/config/data_sources/remote/swagger_repository.dart';

part 'calculations_service_state.dart';

class CalculationsServiceCubit extends Cubit<CalculationsServiceState> {
  CalculationsServiceCubit(
    this.swaggerRepository,
  ) : super(InitialState());

  final SwaggerRepository swaggerRepository;

  Future<void> sendLink() async {}
}
