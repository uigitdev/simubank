abstract class AppUseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class AppStreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}
