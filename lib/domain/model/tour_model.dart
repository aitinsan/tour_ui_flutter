import 'package:tours_ui_flutter/domain/model/user_model.dart';

class TourModel {
  final String mainImage;
  final String location;
  final String duration;
  final String title;
  final UserModel user;
  final int likesCount;
  final int views;
  final List<String> imageList;
  const TourModel({
    required this.location,
    required this.duration,
    required this.title,
    required this.user,
    required this.imageList,
    required this.mainImage,
    required this.likesCount,
    required this.views,
  });
}

List<TourModel> tours = [
  TourModel(
    location: 'Алматинская область',
    duration: '2 дня',
    title: 'Тур Кольсай и Кайынды от Алматы тур Tour',
    user: UserModel(
      image:
          'https://lh3.googleusercontent.com/a/ACg8ocKUxOYdgDZT9897ilhUHO4dJfqpBcLjliOCdFL1hR_XSME=s576-c-no',
    ),
    imageList: [
      'https://static.tildacdn.com/tild3230-3863-4965-b236-396630626562/2021_1111_10445500_1.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiiJKKs4fDv1vpQDVSW_bTSmgYwZPTMh1zTg&usqp=CAU',
      'https://static.tildacdn.com/tild3835-6165-4530-a135-386330643662/XSAAAgLmyOA-1920.jpg',
      // 'https://upload.wikimedia.org/wikipedia/commons/c/c2/IMG_9366-Kaindy-e.jpg',
    ],
    mainImage:
        'https://grandevoyage.kz/wp-content/uploads/2020/12/whatsapp-image-2020-09-22-at-18.07.35-1.jpeg',
    likesCount: 20,
    views: 123,
  ),
  TourModel(
    location: 'Алмата',
    duration: '4 часа',
    title: 'Тур по центру Алматы от Инсан Tour',
    user: UserModel(
      image:
          'https://media.licdn.com/dms/image/D4E35AQH2ATIeg0kPKA/profile-framedphoto-shrink_400_400/0/1698579507678?e=1701421200&v=beta&t=cMjW7SJbFb7rjea6JDBNt7UHI3q9_oHFUIJiIFLrTO0',
    ),
    imageList: [
      'https://tengritravel.kz/userdata/u362/2020-02/resize/59c8bfd9bac530b6c735dab469f0908a.jpeg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiiJKKs4fDv1vpQDVSW_bTSmgYwZPTMh1zTg&usqp=CAU',
      'https://standard.kz/storage/articles/CwyLkez1T9XfGlztjEOUmKXeRpUEuzW8Uznd8KnG.webp',
      'https://tengrinews.kz/userdata/news/2017/news_325125/thumb_m/photo_224327.jpg',
    ],
    mainImage:
        'https://liter.kz/cache/imagine/1200/uploads/news/2021/06/02/8882bf468df24755d4687ab71ba.jpg',
    likesCount: 102,
    views: 3244,
  ),
  TourModel(
    location: 'Боровое',
    duration: '3 дня',
    title: 'Тур Боровое от Boro travel',
    user: UserModel(
      image:
          'https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=1328',
    ),
    imageList: [
      'https://realkz.com/fotki/borovoe.jpg',
      'https://cf.bstatic.com/xdata/images/hotel/max1024x768/343015635.jpg?k=b596ec5bfaf6d879e04ef5963a589483de01152d3dd6a476029f19fc5f3eab69&o=&hp=1',
      'https://liter.kz/cache/imagine/1200/uploads/news/2020/07/21/kurort-borovoe.jpg',
      'https://www.omsktour.ru/photo/borovoe/borovoe-2.jpg',
    ],
    mainImage:
        'https://s.zagranitsa.com/images/articles/8136/870x486/9d8753f53e05f5c430c5cbdf93ff4017.jpg?1557820647',
    likesCount: 5,
    views: 320,
  ),
];
