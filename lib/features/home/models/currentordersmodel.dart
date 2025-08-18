class ScheduleResponse {
  final String status;
  final List<Schedule> data;

  ScheduleResponse({required this.status, required this.data});

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) {
    return ScheduleResponse(
      status: json['status'],
      data: (json['data'] as List).map((e) => Schedule.fromJson(e)).toList(),
    );
  }
}

class Schedule {
  final String scheduleId;
  final String bookingId;
  final String deliveryDate;
  final String mealTime;
  final String deliveryStatus;
  final String updatedAt;

  Schedule({
    required this.scheduleId,
    required this.bookingId,
    required this.deliveryDate,
    required this.mealTime,
    required this.deliveryStatus,
    required this.updatedAt,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      scheduleId: json['schedule_id'],
      bookingId: json['booking_id'],
      deliveryDate: json['delivery_date'],
      mealTime: json['meal_time'],
      deliveryStatus: json['delivery_status'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'schedule_id': scheduleId,
      'booking_id': bookingId,
      'delivery_date': deliveryDate,
      'meal_time': mealTime,
      'delivery_status': deliveryStatus,
      'updated_at': updatedAt,
    };
  }
}
