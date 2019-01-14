// ReadTime is used to update the BookProgress
class ReadTime {
  int numSeconds;
  int numPagesRead;
  DateTime when;

  ReadTime(this.when, this.numSeconds, this.numPagesRead);
}
