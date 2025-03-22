abstract class AppUseCase<Type, Params> {
  Future<Type> call({Params? params});
}
