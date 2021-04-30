extension NumberParsing on int {
  String parseDuration() {
    return this < 10 ? '0$this' : this.toString();
  }
}

extension DurationParsing on Duration {
  String stopwatch() {
    var min = this.inMinutes.parseDuration();
    var sec = this.inSeconds.remainder(60).parseDuration();
    var miliSec = this.inMilliseconds.remainder(100).parseDuration();

    return this.inHours > 0
        ? '${this.inHours}:$min:$sec.$miliSec'
        : '$min:$sec.$miliSec';
  }

  String timer() {
    var min = this.inMinutes.remainder(60).parseDuration();
    var sec = this.inSeconds.remainder(60).parseDuration();

    return this.inHours > 0 ? '${this.inHours}:$min:$sec' : '$min:$sec';
  }
}
