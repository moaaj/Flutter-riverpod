import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return {};
  }

  void addProduct(Product product) {
    state = {...state, product};
  }

  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toSet();
  }
}

final cartNotifierProvider =
    NotifierProvider<CartNotifier, Set<Product>>(CartNotifier.new);

final cartTotalProvider = Provider<int>((ref) {
  final cartProducts = ref.watch(cartNotifierProvider);

  return cartProducts.fold<int>(
    0,
    (total, product) => total + product.price,
  );
});
