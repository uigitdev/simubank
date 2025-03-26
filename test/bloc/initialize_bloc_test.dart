import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simubank/simubank.dart';

class MockGetSessionUseCase extends Mock implements GetSessionUseCase {}

void main() {
  late InitializeBloc initializeBloc;
  late MockGetSessionUseCase mockGetSessionUseCase;

  setUpAll(() {
    registerFallbackValue(NoData());
  });

  setUp(() {
    mockGetSessionUseCase = MockGetSessionUseCase();
    initializeBloc = InitializeBloc(mockGetSessionUseCase);
  });

  tearDown(() {
    initializeBloc.close();
  });

  group('InitializeBloc Tests', () {
    blocTest<InitializeBloc, InitializeState>(
      'Initial state is InitializeNone',
      build: () => initializeBloc,
      expect: () => [],
    );

    blocTest<InitializeBloc, InitializeState>(
      'Emits [InitializeAuthenticated] when [sessionId] exists',
      setUp:
          () => when(
            () => mockGetSessionUseCase.call(any()),
          ).thenAnswer((_) async => 'session_id'),
      build: () => initializeBloc,
      act: (bloc) => bloc.add(InitializeStart()),
      wait: const Duration(milliseconds: 300),
      expect: () => [InitializeAuthenticated('session_id')],
      verify: (_) {
        verify(() => mockGetSessionUseCase.call(any())).called(1);
      },
    );
  });

  blocTest(
    'Emits [InitializeUnauthenticated] when [sessionId] is null',
    setUp:
        () => when(
          () => mockGetSessionUseCase.call(any()),
        ).thenAnswer((_) async => null),
    build: () => initializeBloc,
    act: (bloc) => bloc.add(InitializeStart()),
    wait: const Duration(milliseconds: 300),
    expect: () => [InitializeUnauthenticated()],
    verify: (_) => verify(() => mockGetSessionUseCase.call(any())).called(1),
  );
}
