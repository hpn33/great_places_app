const GOOGLE_API_KEY = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';

class LocationHelper {
  static String generateLocationPreviewImage({
    double altitude,
    double longitude,
    width = 600,
    height = 300,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?' +
        'center=' +
        '&$altitude,$longitude' +
        '&zoom=16&size=600x300&maptype=roadmap' +
        '&markers=color:red%7Clabel:A%7C$altitude,$longitude' +
        '&key=$GOOGLE_API_KEY';
  }
}
