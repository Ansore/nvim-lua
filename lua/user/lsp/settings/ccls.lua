return {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    cache = {
      directory = ".ccls-cache";
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}
