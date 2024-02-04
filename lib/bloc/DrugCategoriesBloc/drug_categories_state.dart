import 'package:equatable/equatable.dart';
import '../../models/DrugCategories.dart';

class DrugCategoriesState extends Equatable {
  final List<DrugCategories> allDrugCategories;
  const DrugCategoriesState({
    this.allDrugCategories = const <DrugCategories>[],
  });

  @override
  List<Object> get props => [allDrugCategories];


  
}

  List<DrugCategories> drugCategoriesList = [
   DrugCategories(
      id: 1,
      name: 'Category A',
      items: [],
      imageUrl: 'https://res.cloudinary.com/walmart-labs/image/upload/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750138549521L.jpg',
      bannerUrl: 'https://res.cloudinary.com/walmart-labs/image/upload/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750138549521L.jpg',
    ),
    DrugCategories(
      id: 2,
      name: 'Category B',
      items: [],
      imageUrl: 'https://res.cloudinary.com/walmart-labs/image/upload/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750157390391L.jpg',
      bannerUrl: 'https://res.cloudinary.com/walmart-labs/image/upload/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750157390391L.jpg',
    ),
  ];
