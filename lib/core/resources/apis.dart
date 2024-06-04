class ApiUrls {
  //static String get _baseUrl => 'https://stg.ivoryfashions.com/api/';

 // static String get _baseUrl => 'http://192.168.0.171:8001/api/';

  //static String get _baseUrl => 'http://192.168.0.171:8001/api/';

 // static String get baseUrl => 'http://192.168.0.167:8001/api/';

   static String get baseUrl => 'https://api.oyousef.sy/api/';
   static String get imageUrl => 'https://api.oyousef.sy/';
   static String get mobileUrl => '${baseUrl}mobile/';
   static String get login => '${mobileUrl}auth/login';
   static String get verifyPhone => '${mobileUrl}auth/verify-phone-number';
   static String get getProfile => '${mobileUrl}auth/me/profile';
   static String get updateProfile=>'${mobileUrl}auth/me/edit';
   static String get farmList =>'${mobileUrl}farmers/me/farms';
   static String get fieldList =>'${mobileUrl}farmers/me/fields';
   static String get toolList=>'${mobileUrl}farmers/me/farm-tools';
   static String get tasklList=>'${mobileUrl}field-tasks';
   static String get getCrop =>'${mobileUrl}crops';
   static String get getCropSeed=>'${mobileUrl}crop-seeds';
   static String get addField=>'${mobileUrl}farmers/me/fields';
 //  static String get imageUrl => 'https://dev.backend.svcore.garonzlab.com';
   static String get emergency => '${mobileUrl}farmers/me/emergency-requests';
   static String get emergencyAdded => '${mobileUrl}farmers/me/emergency-request';
   static String get emergencyType =>'${baseUrl}options/emergency-request/type';
  static String get setAppInfo => '${baseUrl}app-info';

  static String get getCurrencies => '${baseUrl}currencies';

  static String get changeCurrency => '${baseUrl}change-currency';

  static String get getSlider => '${baseUrl}sliders?';
   static String get getTags => '${baseUrl}tags?';
   static String get getVisualSitting => '${baseUrl}visual-settings?';
   static String get getProducts=>'${baseUrl}products?';
   static String get getCategories=>'${baseUrl}categories?';
   static String get getProductsDetiel=>'${baseUrl}products';
   static String get addToCart=>'${baseUrl}carts/add';


}
