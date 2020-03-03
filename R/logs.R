
#' Query ClimbOn data
#'
#' @return dataframe of all climbing data.
#' @export
climbs <- function() {
    dir <- "climbing_records"
    metadata <- rdrop2::drop_dir(dir)
    full_paths <- metadata$path_display
    file_names <- metadata$name
    temp <- tempdir()
    file_paths <- file.path(temp, file_names)

    for (i in 1:length(full_paths)) {
        suppressMessages(rdrop2::drop_download(full_paths[i],
                                               local_path = temp,
                                               overwrite = T,
                                               progress = F))
    }

    . <- purrr::map(file_paths, ~ rjson::fromJSON(file = .x))
    purrr::map_dfr(., ~ purrr::map(.x, prettify_climb)[[1]])
}

prettify_climb <- function(data) {
    data.frame(climber = data$climber,
               wall_height = data$height,
               climb_grade = data$grade,
               ascend_style = data$style,
               finish_climb = data$send,
               entry_date = data$time_stamp,
               stringsAsFactors = F)
}
