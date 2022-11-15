class LaptopRecommendation {
  String? gpu;
  String? os;
  int? priorityGpu;
  int? priorityOs;
  int? priorityProcessor;
  int? priorityRam;
  String? processor;
  String? ram;

  LaptopRecommendation(
      {this.gpu,
      this.os,
      this.priorityGpu,
      this.priorityOs,
      this.priorityProcessor,
      this.priorityRam,
      this.processor,
      this.ram});

  LaptopRecommendation.fromJson(Map<String, dynamic> json) {
    gpu = json['gpu'];
    os = json['os'];
    priorityGpu = json['priority_gpu'];
    priorityOs = json['priority_os'];
    priorityProcessor = json['priority_processor'];
    priorityRam = json['priority_ram'];
    processor = json['processor'];
    ram = json['ram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gpu'] = this.gpu;
    data['os'] = this.os;
    data['priority_gpu'] = this.priorityGpu;
    data['priority_os'] = this.priorityOs;
    data['priority_processor'] = this.priorityProcessor;
    data['priority_ram'] = this.priorityRam;
    data['processor'] = this.processor;
    data['ram'] = this.ram;
    return data;
  }
}
