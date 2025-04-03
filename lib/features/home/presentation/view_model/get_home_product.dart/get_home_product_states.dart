import '../../../data/models/product_model.dart';

abstract class GetHomeProductStates {}

class GetHomeProductInitialState extends GetHomeProductStates {}

class GetHomeProductLoadingState extends GetHomeProductStates {}

class GetHomeProductSuccessState extends GetHomeProductStates {
  final List<ProductModel> products;

  GetHomeProductSuccessState({
    required this.products,
  });
}

class GetHomeProductFailureState extends GetHomeProductStates {
  final String errorMessage;

  GetHomeProductFailureState({
    required this.errorMessage,
  });
}

class SuccessAddtoFavState extends GetHomeProductStates {
  final bool isFav;
  SuccessAddtoFavState({required this.isFav});
}

class LoadingFavState extends GetHomeProductStates {}

class SuccessRemovetoFavState extends GetHomeProductStates {
  final bool isFav;
  SuccessRemovetoFavState({required this.isFav});
}
