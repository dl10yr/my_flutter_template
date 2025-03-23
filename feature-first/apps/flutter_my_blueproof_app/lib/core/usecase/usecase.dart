// ref: https://developers.cyberagent.co.jp/blog/archives/36149/

abstract class UseCase<Param, Result> {
  Result call(Param param);
}
