import 'package:bloc/bloc.dart';
import 'package:fruit_hub/feaatures/home/data/model/product_model.dart';
import 'package:fruit_hub/feaatures/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.homeRepo) : super(GetProductsInitial());
  HomeRepo homeRepo;
  Future getProducts() async {
    emit(GetProductsLoading());
    final result = await homeRepo.getFeaturedProduct();
    result.fold(
      (fail) {
        emit(GetProductsFailure(fail.message));
      },
      (success) {
        emit(GetProductsSuccess(success));
      },
    );
  }

  getFeaturedProduct() {}
}
