const PROXY_CONFIG = [
  {
    context: [
      "/api",
      // "/wallet",
      // "/bank",
      // "/transaction",
      // "/transaction/category",
      // "/transaction/category/group",
    ],
    target: "http://localhost:8080",
    secure: false
  }
]

module.exports = PROXY_CONFIG;
