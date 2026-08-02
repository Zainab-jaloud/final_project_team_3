import 'package:flutter_application/core/constants/app_images.dart';

class PropertyModel {
  final int id;
  final String image;
  final String name;
  final String location;
  final String price;
  final double rating;
  final String bathub;
  final String bedrooms;
  final String type;
final String status;
final String description;
  const PropertyModel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.price,
    required this.rating, required this.bathub, required this.bedrooms, required this.type, required this.status, required this.description,
  });
}
List<PropertyModel> recomended = [
   
 PropertyModel(
    id: 1,
    image:AppImages.house1,
    name: 'Ayana Homestay',
    location: 'Imogiri, Yogyakarta',
    price: '\$310',
    rating: 4.7, bathub: '3', bedrooms: '3', type: 'Apartment', status: 'For Rent',
     description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s, when an unknown printer took when an unknown printer took a type',
  ),
    PropertyModel(
    id: 2,
    image:AppImages.house2,
    name: 'Bali Komang Guest',
    location: 'Nusa Penida, Bali',
    price: '\$180',
    rating: 4.5, bathub: '2', bedrooms: '2', type: 'Apartment', status: 'For Sale',
     description:'Modern property with spacious rooms, elegant interior design, and large windows that provide plenty of natural light. Located in a peaceful neighborhood close to schools, shopping centers, and public transportation.',
  ),];
List<PropertyModel> properties = [
   
 
  PropertyModel(
    id: 2,
    image: AppImages.house4,
    name: 'Maharani Villa Yogyakarta',
    location: 'Benhil, Jl. Bendungan Hilir Karet Tengsin, Bendungan Hilir, Tanah Abang, Central Jakarta City,',
    price: '\$320',
    rating: 4.5, bathub: '4', bedrooms: '4', type: 'Villa', status: 'For Sale', 
    description:'Beautiful residence featuring comfortable living spaces, stylish finishes, and a relaxing atmosphere. Perfectly situated near restaurants, parks, and essential services for a convenient lifestyle.',
    
  ),
 PropertyModel(
    id: 8,
    image: AppImages.house7,
    name: 'Takatea Homestay',
    location: 'Jl. Tentara Pelajar No.47, RW.001',
    price: '\$120',
    rating: 4.5, bathub: '1', bedrooms: '2', type: 'Apartment', status: 'For Sale',
     description:'Contemporary home offering a bright open layout, premium materials, and excellent ventilation. An ideal choice for families or professionals seeking comfort and accessibility in the city.',
  ),
  PropertyModel(
    id: 4,
    image:AppImages.house8,
    name: 'Batavia Apartments',
    location: 'Benhil, Jl. Bendungan Hilir Karet Tengsin, Bendungan Hilir, Tanah Abang, Central Jakarta City,',
    price: '\$120',
    rating: 4.5, bathub: '1', bedrooms: '1', type: 'Apartment', status: 'For Sale', 
    description:'Luxury property designed with modern architecture, high-quality furnishings, and a welcoming environment. Enjoy easy access to nearby attractions, entertainment, and everyday conveniences.',
  ),

  PropertyModel(
    id: 5,
    image: AppImages.house6,
    name: 'Apartement land house',
    location: 'Jl. Tentara Pelajar No.47, RW.001',
    price: '\$320',
    rating: 4.7, bathub: '2', bedrooms: '3', type: 'Apartment', status: 'For Sale',
     description:'Charming home with thoughtfully designed interiors, spacious bedrooms, and a cozy living area. Located in a prime area that combines tranquility with quick access to the city center.',
  ),
  PropertyModel(
    id: 6,
    image:AppImages.house3,
    name: 'House of Mormon vv',
    location: 'Denpasar, Bali',
    price: '\$120',
    rating: 4.5, bathub: '2', bedrooms: '2', type: 'Apartment', status: 'For Rent', 
    description:'Charming home with thoughtfully designed interiors, spacious bedrooms, and a cozy living area. Located in a prime area that combines tranquility with quick access to the city center.',
  ),
  PropertyModel(
    id: 7,
    image: AppImages.house5,
    name: 'Palm Hotel',
    location: 'Jl. Seturan Yohyakarta',
    price: '\$230',
    rating: 4.7, bathub: '5', bedrooms: '5', type: 'Hotel', status: 'For Rent',
     description:'Contemporary home offering a bright open layout, premium materials, and excellent ventilation. An ideal choice for families or professionals seeking comfort and accessibility in the city.',
  ),

  PropertyModel(
    id: 9,
    image:AppImages.house9,
    name: 'Manhattan Hotel ',
    location: 'Jl. Prof. DR. Satrio No.Kav.19-24, RT.7/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan',
    price: '\$230',
    rating: 4.5, bathub: '3', bedrooms: '4', type: 'Hotel', status: 'For Rent',
     description:'Modern property with spacious rooms, elegant interior design, and large windows that provide plenty of natural light. Located in a peaceful neighborhood close to schools, shopping centers, and public transportation.',
  ),

   PropertyModel(
    id: 10,
    image:AppImages.house9,
    name: 'Manhattan Hotel ',
    location: 'Jl. Prof. DR. Satrio No.Kav.19-24, RT.7/RW.4, Lemone Sul Garda ,Province of Breescia, Italy',
    price: '\$1230',
    rating: 4.5, bathub: '3', bedrooms: '4', type: 'Villa', status: 'For Rent',
     description:'Modern property with spacious rooms, elegant interior design, and large windows that provide plenty of natural light. Located in a peaceful neighborhood close to schools, shopping centers, and public transportation.',
  ),
 
];