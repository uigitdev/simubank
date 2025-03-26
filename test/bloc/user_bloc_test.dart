import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' hide EventDispatcher;
import 'package:mocktail/mocktail.dart';
import 'package:simubank/simubank.dart';

class MockGetUserProfileDetailsUseCase extends Mock
    implements GetUserProfileDetailsUseCase {}

class MockDeleteCachedUserProfileUseCase extends Mock
    implements DeleteCachedUserProfileUseCase {}

void main() {
  late MockGetUserProfileDetailsUseCase mockGetUserProfileDetailsUseCase;
  late MockDeleteCachedUserProfileUseCase mockDeleteCachedUserProfileUseCase;
  late UserBloc userBloc;
  late UserProfileDetailsModel userProfile;
  late EventDispatcher eventDispatcher;

  setUpAll(() {
    registerFallbackValue(NoData());
  });

  setUp(() {
    mockGetUserProfileDetailsUseCase = MockGetUserProfileDetailsUseCase();
    mockDeleteCachedUserProfileUseCase = MockDeleteCachedUserProfileUseCase();

    eventDispatcher = EventDispatcher();

    userBloc = UserBloc(
      mockGetUserProfileDetailsUseCase,
      mockDeleteCachedUserProfileUseCase,
    );

    userProfile = UserProfileDetailsModel(
      id: 1,
      email: 'test@example.com',
      name: 'password',
      profilePicture: null,
    );
  });

  tearDown(() {
    userBloc.close();
  });

  group('UserBloc Test', () {
    blocTest<UserBloc, UserState>(
      'Emit [UserNone] when initialize bloc',
      build: () => userBloc,
      expect: () => [],
    );

    blocTest<UserBloc, UserState>(
      'Emit [UserGetProfileDetailsFailed] when user profile is null',
      setUp:
          () => when(
            () => mockGetUserProfileDetailsUseCase.call(any()),
          ).thenAnswer((_) => Stream.value(null)),
      act: (bloc) => bloc.add(UserGetProfileDetails()),
      build: () => userBloc,
      expect: () => [UserGetProfileDetailsFailed(message: 'Profile not found')],
      wait: const Duration(milliseconds: 300),
      verify:
          (_) => verify(
            () => mockGetUserProfileDetailsUseCase.call(any()),
          ).called(1),
    );

    blocTest<UserBloc, UserState>(
      'Emit [UserGetProfileDetailsSuccess] when user profile is exists',
      setUp:
          () => when(
            () => mockGetUserProfileDetailsUseCase.call(any()),
          ).thenAnswer((_) => Stream.value(userProfile)),
      act: (bloc) => bloc.add(UserGetProfileDetails()),
      build: () => userBloc,
      expect: () => [UserGetProfileDetailsSuccess(userProfile)],
      wait: const Duration(milliseconds: 300),
      verify:
          (_) => verify(
            () => mockGetUserProfileDetailsUseCase.call(any()),
          ).called(1),
    );

    test(
      'Calls [DeleteCachedUserProfileUseCase] function when AuthLogout is dispatched',
      () async {
        when(
          () => mockDeleteCachedUserProfileUseCase.call(any()),
        ).thenAnswer((_) async => true);

        eventDispatcher.dispatchEvent(AuthLogout());

        await Future.delayed(Duration(milliseconds: 300));
        verify(() => mockDeleteCachedUserProfileUseCase.call(any())).called(1);
      },
    );
  });
}
