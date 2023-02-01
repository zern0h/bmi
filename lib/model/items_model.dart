

class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,

  });
}

List<Items> listOfItems = [
  Items(
    img: "assets/images/slide1.png",
    title: "Calculate Your BMI",
    subTitle:
    "This calculator provides Body Mass Index \n(BMI) value and the corresponding BMI \nweight status category for adults that are \n20 years of age and above.",
  ),
  Items(
    img: "assets/images/slide3.png",
    title: "The Limitations",
    subTitle:
    "Muscle builders, long distance athletes, \npregnant women, the elderly or young \nchildren are excluded, because the \nBMI value does not take into account \nwhether the weight is carried as \nmuscle, bone or fat.",

  ),
  Items(
    img: "assets/images/slide2.png",
    title: "Is Your Weight Healthy \nFor Your Height?",
    subTitle: "Use this BMI calculator to check the BMI \nvalue of the adults in your family.",
  ),
];