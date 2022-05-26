const GOOGLE_API_KEY = 'AIzaSyByudnKg_yF34BUMjbsmYErA_wX4d8495w';

class LocationUtil {
  static String GenerateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=14&size=600x400&maptype=roadmap&markers=color:red%7Clabel:A%$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
  //&signature=YOUR_SIGNATURE
}
