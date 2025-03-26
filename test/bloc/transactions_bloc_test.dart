import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart' hide EventDispatcher;
import 'package:mocktail/mocktail.dart';
import 'package:simubank/simubank.dart';

class MockGetTransactionUseCase extends Mock implements GetTransactionUseCase {}

class MockSearchTransactionUseCase extends Mock
    implements SearchTransactionUseCase {}

class MockDeleteCachedTransactionsUseCase extends Mock
    implements DeleteCachedTransactionsUseCase {}

class MockSearchTransactionEntity extends Fake
    implements SearchTransactionEntity {}

void main() {
  late MockGetTransactionUseCase mockGetTransactionUseCase;
  late MockSearchTransactionUseCase mockSearchTransactionUseCase;
  late MockDeleteCachedTransactionsUseCase mockDeleteCachedTransactionsUseCase;
  late TransactionsBloc transactionsBloc;
  late EventDispatcher eventDispatcher;
  late List<TransactionModel> transactions;

  setUpAll(() {
    registerFallbackValue(NoData());
    registerFallbackValue(MockSearchTransactionEntity());
  });

  setUp(() {
    mockGetTransactionUseCase = MockGetTransactionUseCase();
    mockSearchTransactionUseCase = MockSearchTransactionUseCase();
    mockDeleteCachedTransactionsUseCase = MockDeleteCachedTransactionsUseCase();

    eventDispatcher = EventDispatcher();

    transactionsBloc = TransactionsBloc(
      mockGetTransactionUseCase,
      mockSearchTransactionUseCase,
      mockDeleteCachedTransactionsUseCase,
    );

    transactions = [
      TransactionModel(
        id: 1,
        userId: 1,
        date: DateTime.now(),
        merchant: 'Netflix',
        amount: 100,
        currency: 'HUF',
        description: 'description',
        fromAccount: '123',
        toAccount: '456',
        category: 'category',
      ),
    ];
  });

  tearDown(() {
    transactionsBloc.close();
  });

  group('TransactionBloc Test', () {
    test(
      'Call [MockDeleteCachedTransactionsUseCase] when AuthLogout dispatched',
      () async {
        when(
          () => mockDeleteCachedTransactionsUseCase.call(any()),
        ).thenAnswer((_) async => true);

        eventDispatcher.dispatchEvent(AuthLogout());

        await Future.delayed(const Duration(milliseconds: 300));

        verify(() => mockDeleteCachedTransactionsUseCase.call(any())).called(1);
      },
    );

    blocTest<TransactionsBloc, TransactionsState>(
      'Emit [TransactionsLoadedTransactions] with transaction list when call finished',
      setUp:
          () => when(
            () => mockGetTransactionUseCase.call(any()),
          ).thenAnswer((_) => Stream.value(transactions)),
      build: () => transactionsBloc,
      act: (bloc) => bloc.add(TransactionsGetTransactions()),
      wait: const Duration(milliseconds: 300),
      expect: () => [TransactionsLoadedTransactions(transactions)],
      verify:
          (_) => verify(() => mockGetTransactionUseCase.call(any())).called(1),
    );
  });

  group('TransactionBloc Search Test', () {
    final testTransactions = [
      TransactionModel(
        id: 1,
        userId: 1,
        date: DateTime.now(),
        merchant: 'Netflix',
        amount: 100,
        currency: 'HUF',
        description: 'description',
        fromAccount: '123',
        toAccount: '456',
        category: 'category',
      ),
      TransactionModel(
        id: 2,
        userId: 2,
        date: DateTime.now(),
        merchant: 'Spotify',
        amount: 100,
        currency: 'HUF',
        description: 'description',
        fromAccount: '123',
        toAccount: '456',
        category: 'category',
      ),
    ];

    blocTest<TransactionsBloc, TransactionsState>(
      'Emits [TransactionsLoadedTransactions] with not empty transactions list'
      'when search is successful',
      setUp:
          () => when(
            () => mockSearchTransactionUseCase.call(any()),
          ).thenAnswer((_) async => [testTransactions.first]),
      build: () => transactionsBloc,
      act:
          (bloc) => bloc.add(
            TransactionsSearchTransaction(testTransactions.first.merchant),
          ),
      wait: const Duration(milliseconds: 300),
      expect:
          () => [
            TransactionsLoadedTransactions([testTransactions.first]),
          ],
    );
  });
}
