load_models <- function(models_base_path, jdf) {
  filters = list()
  if ("filters" %in% names(jdf)) {
    filters = jdf[["filters"]]
  }
  
  model_names <- list.dirs(path=models_base_path, full.names = FALSE, recursive = FALSE)
  if (length(model_names) == 0) {
    model_names <- append(model_names, "./")
  }
  
  if (length(filters) == 0) {
    #No filters
    filters <- model_names
  }
  
  models <- list()
  
  if (!all(filters %in% model_names)) {
    print("Filters is not subset of models present in storage")
    return(models)
  }
  
  for (model_name in filters) {
    model_file_name <- sprintf("%s/%s/model.rds", model_base_path, model_name)
    if (!file.exists(model_file_name)) {
      print(sprintf("File %s does not exist", model_file_name))
      quit(status=1)
    }else {
      rmodel = readRDS(model_file_name)
      models[[model_name]] <- rmodel
    }
  }
  return(models)
}
