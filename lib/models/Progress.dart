class Progress {
  final String name;

  Progress({
    required this.name,
  });
}

List<Progress> progress = [
  Progress(name: "View All"),
  Progress(name: "In Progress"),
  Progress(name: "Completed"),
  Progress(name: "Cancelled"),
  Progress(name: "Pending"),
];
