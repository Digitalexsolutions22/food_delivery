class Booking {
  final String bookingId;
  final String userId;
  final String planId;
  final String startDate;
  final String endDate;
  final String status;
  final String createdAt;
  final String planName;
  final String durationType;

  Booking({
    required this.bookingId,
    required this.userId,
    required this.planId,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.createdAt,
    required this.planName,
    required this.durationType,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingId: json['booking_id'] ?? '',
      userId: json['user_id'] ?? '',
      planId: json['plan_id'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      planName: json['plan_name'] ?? '',
      durationType: json['duration_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'user_id': userId,
      'plan_id': planId,
      'start_date': startDate,
      'end_date': endDate,
      'status': status,
      'created_at': createdAt,
      'plan_name': planName,
      'duration_type': durationType,
    };
  }
}

class BookingResponse {
  final String status;
  final List<Booking> data;

  BookingResponse({required this.status, required this.data});

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      status: json['status'] ?? '',
      data:
          (json['data'] as List).map((item) => Booking.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': data.map((b) => b.toJson()).toList()};
  }
}
