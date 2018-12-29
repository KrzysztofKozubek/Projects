
// @GENERATOR:play-routes-compiler
// @SOURCE:F:/3.UJ(LICENCJAT)/SEMESTR VIII/Ebiznes/movie/conf/routes
// @DATE:Mon Jun 19 13:26:50 CEST 2017


package router {
  object RoutesPrefix {
    private var _prefix: String = "/"
    def setPrefix(p: String): Unit = {
      _prefix = p
    }
    def prefix: String = _prefix
    val byNamePrefix: Function0[String] = { () => prefix }
  }
}
