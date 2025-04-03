import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/setup_services_locator.dart';
import '../../../../../core/netwoking/api_services.dart';
import '../../../data/repos/home_repo.dart';
import '../../../data/repos/home_repo_impl.dart';
import 'get_home_product_states.dart';

class GetHomeProductCubit extends Cubit<GetHomeProductStates> {
  GetHomeProductCubit() : super(GetHomeProductInitialState());
  final HomeRepo _homeRepo =
      HomeRepoImpl(apiServices: getIt.get<ApiServices>());
  bool isFav = false;

  Future<void> getHomeProduct({required String? categoryName}) async {
    try {
      emit(GetHomeProductLoadingState());
      var result = await _homeRepo.fetchHomeData(categoryName: categoryName);
      result.fold(
        (fail) =>
            emit(GetHomeProductFailureState(errorMessage: fail.errMessage)),
        (products) => emit(GetHomeProductSuccessState(products: products)),
      );
    } catch (e) {
      emit(GetHomeProductFailureState(errorMessage: "Unexpected error: $e"));
    }
  }

  Future<void> addOrDeletetoFav({required int productId}) async {
    try {
      emit(LoadingFavState());
      var result = await _homeRepo.addOrDeletetoFav(productId: productId);
      if (result == true) {
        emit(SuccessAddtoFavState(isFav: result));
      } else {
        emit(SuccessRemovetoFavState(isFav: result));
      }
    } catch (e) {
      emit(SuccessRemovetoFavState(isFav: false));
    }
  }
}
