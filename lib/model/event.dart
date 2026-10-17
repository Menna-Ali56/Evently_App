import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  static const String collectionName = 'Events';

  String eventId;
  String eventImage;
  String eventName;
  String eventTitle;
  String eventDescription;
  DateTime eventDate;
  bool isFavourite;

  Event({
    this.eventId = '',
    required this.eventImage,
    required this.eventName,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventDate,
    this.isFavourite = false,
  });

  Event.fromFireStore(Map<String, dynamic> data)
      : this(
    eventId: data['event_id'] ?? '',
    eventImage: data['event_image'] ?? '',
    eventName: data['event_name'] ?? '',
    eventTitle: data['event_title'] ?? '',
    eventDescription: data['event_description'] ?? '',
    eventDate: (data['event_date'] as Timestamp).toDate(),
    isFavourite: data['is_favourite'] ?? false,
  );

  Map<String, dynamic> toFireStore() {
    return {
      'event_id': eventId,
      'event_image': eventImage,
      'event_name': eventName,
      'event_title': eventTitle,
      'event_date': eventDate,
      'event_description': eventDescription,
      'is_favourite': isFavourite,
    };
  }
}