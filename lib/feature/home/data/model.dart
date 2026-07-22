import 'package:flutter_application/core/constants/app_images.dart';

class PropertyModel {
  final int id;
  final String image;
  final String name;
  final String location;
  final String price;
  final double rating;

  const PropertyModel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
  });
}
List<PropertyModel> recomended = [
   
 PropertyModel(
    id: 1,
    image:AppImages.house1,
    name: 'Ayana Homestay',
    location: 'Imogiri, Yogyakarta',
    price: '\$310',
    rating: 4.7,
  ),
    PropertyModel(
    id: 2,
    image:AppImages.house2,
    name: 'Bali Komang Guest',
    location: 'Nusa Penida, Bali',
    price: '\$180',
    rating: 4.5,
  ),];
List<PropertyModel> properties = [
   
  PropertyModel(
    id: 8,
    image: AppImages.house7,
    name: 'Takatea Homestay',
    location: 'Jl. Tentara Pelajar No.47, RW.001',
    price: '\$120',
    rating: 4.5,
  ),
  PropertyModel(
    id: 2,
    image: AppImages.house4,
    name: 'Maharani Villa Yogyakarta',
    location: 'Benhil, Jl. Bendungan Hilir Karet Tengsin, Bendungan Hilir, Tanah Abang, Central Jakarta City,',
    price: '\$320',
    rating: 4.5,
  ),

  PropertyModel(
    id: 4,
    image:AppImages.house8,
    name: 'Batavia Apartments',
    location: 'Benhil, Jl. Bendungan Hilir Karet Tengsin, Bendungan Hilir, Tanah Abang, Central Jakarta City,',
    price: '\$120',
    rating: 4.5,
  ),

  PropertyModel(
    id: 5,
    image: AppImages.house6,
    name: 'Apartement land house',
    location: 'Jl. Tentara Pelajar No.47, RW.001',
    price: '\$320',
    rating: 4.7,
  ),
  PropertyModel(
    id: 6,
    image:AppImages.house3,
    name: 'House of Mormon vv',
    location: 'Denpasar, Bali',
    price: '\$120',
    rating: 4.5,
  ),
  PropertyModel(
    id: 7,
    image: AppImages.house5,
    name: 'Palm Hotel',
    location: 'Jl. Seturan Yohyakarta',
    price: '\$230',
    rating: 4.7,
  ),

  PropertyModel(
    id: 9,
    image:AppImages.house9,
    name: 'Manhattan Hotel ',
    location: 'Jl. Prof. DR. Satrio No.Kav.19-24, RT.7/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan',
    price: '\$230',
    rating: 4.5,
  ),
 
];