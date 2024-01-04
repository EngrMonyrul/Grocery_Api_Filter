class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    dynamic rateData = json['rate'];
    if (rateData is int) {
      rate = rateData.toDouble();
    } else if (rateData is double) {
      rate = rateData;
    } else {
      rate = 0.0;
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
