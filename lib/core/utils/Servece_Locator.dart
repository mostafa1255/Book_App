import 'package:booklyapp/Features/data/repos/home_repo_Impl.dart';
import 'package:booklyapp/core/utils/api_Services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetit() {
  getIt.registerSingleton<ApiServeces>(
    ApiServeces(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(getIt.get<ApiServeces>()),
  );
}
