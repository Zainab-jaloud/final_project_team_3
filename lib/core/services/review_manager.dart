import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_application/feature/home/data/reviews_model.dart';
class ReviewsManager {
  static List<ReviewsModel> reviews = [
    ReviewsModel(
      name: 'Theresa Webb',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,',
      photo: AppImages.user,
      myRating: 4,
    ),
    ReviewsModel(
      name: 'Annette Black',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,',
      photo: AppImages.user1,
      myRating: 4,
    ),
  ];

  static void addReview(ReviewsModel review) {
    reviews.add(review);
  }
}