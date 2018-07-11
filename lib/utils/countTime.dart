String countTime(String timestamp) {
  var now = new DateTime.now();
  var publicTime = DateTime.parse(timestamp);
  var diff = publicTime.difference(now);
  if (diff.inDays > 0) {
    return '${diff.inDays}天前';
  } else if (diff.inHours > 0) {
    return '${diff.inHours}小时前';
  } else if (diff.inMinutes > 0) {
    return '${diff.inMinutes}分钟前';
  } else if (diff.inSeconds > 0) {
    return '${diff.inSeconds}秒前';
  }
  return timestamp.substring(0, timestamp.indexOf('T'));
}
