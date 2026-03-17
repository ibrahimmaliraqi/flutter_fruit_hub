import 'package:bloc/bloc.dart';
import 'package:fruit_hub/feaatures/home/data/model/product_model.dart';
import 'package:fruit_hub/feaatures/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_featured_product_state.dart';

class GetFeaturedProductCubit extends Cubit<GetFeaturedProductState> {
  GetFeaturedProductCubit(this.homeRepo) : super(GetFeaturedProductInitial());
  HomeRepo homeRepo;
  Future getFeaturedProduct() async {
    emit(GetFeaturedProductLoading());
    final result = await homeRepo.getFeaturedProduct();
    result.fold(
      (fail) {
        emit(GetFeaturedProductFailure(fail.message));
      },
      (success) {
        emit(GetFeaturedProductSuccess(success));
      },
    );
  }
}
