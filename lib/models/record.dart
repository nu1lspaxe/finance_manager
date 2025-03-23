class Record {
  final int id;
  final int userId;
  final double amount;
  final DateTime transactionDate;
  final String recordType;
  final String? detail;
  final DateTime createdAt;
  final DateTime updatedAt;

  Record({
    required this.id,
    required this.userId,
    required this.amount,
    required this.transactionDate,
    required this.recordType,
    this.detail,
    required this.createdAt,
    required this.updatedAt
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['id'],
      userId: json['user_id'],
      amount: json['amount'],
      transactionDate: DateTime.parse(json['transaction_date']),
      recordType: json['record_type'],
      detail: json['detail'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'amount': amount,
      'transaction_date': transactionDate.toIso8601String(),
      'record_type': recordType,
      'detail': detail,
    };
  }

  @override
  String toString() {
    return 'Record{userId: $userId, amount: $amount, recordType: $recordType, transactionDate: $transactionDate}';
  }
}