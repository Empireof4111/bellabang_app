import 'package:bella_banga/src/model/categorical.dart';
import 'package:bella_banga/src/model/numerical.dart';

class ProductSizeType {
  List<Numerical>? numerical;
  List<Categorical>? categorical;

  ProductSizeType({this.numerical, this.categorical});
}
