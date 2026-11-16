import 'home_overview.dart';

abstract interface class HomeRepository {
  Future<HomeOverview> overview();
}
