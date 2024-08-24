class AppEndpoints {
  static const String baseUrl = "https://thummimng.com//wp-json/custom/v1/";
  //Auth
  static const String registerUsers = "register";
  static const String loginUsers = "login";
   static const String getOTP = "auth/getOTP";
  static const String verifyOTP = "auth/verifyOTP";

  static const String getAllCourses= "courses";
  static const String getCourseById= "course-by-id";
  static const String getPurchasedCourse = "purchased-courses";

  static const String getLessonById= "lessons-by-course-id";


  static const String profile = "get-profile-by-id";
  static const String favorite = "api/favorites";

 
//!thimpress 

  static const String thimPressBaseUrl = "https://thummimng.com/wp-json/learnpress/v1/";

  static const String getThimPressToken  = "token";

  static const String getAllThimPressCourses = "courses";



}