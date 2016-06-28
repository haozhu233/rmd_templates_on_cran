templates_raw <- fromJSON(
  "https://api.github.com/search/code?q=org:cran+filename:template.yaml"
  )[[3]] %>%
  flatten() %>%
  mutate(
    templates_dl_url = paste0(
      "https://raw.githubusercontent.com/", repository.owner.login, "/", 
      repository.name, "/master/", path
    ),
    github_url =  str_match(
      repository.description,
      "Homepage:[:space:]https://github.com/(.*)[:space:][:space:]"
    )[,2]
  )

templates_list <- lapply(templates_raw$templates_dl_url, curl) %>% 
  lapply(read.dcf) %>%
  lapply(as.data.frame)

names(templates_list) <- sub("cran/", "", templates_raw$repository.full_name)

templates_list <- templates_list %>%
  bind_rows(.id = "repo_name") %>%
  mutate(
    repo_name = paste0(
      '<a href = "https://cran.r-project.org/package=', repo_name, '">',
      repo_name, '</a>'
    ),
    description = ifelse(
      is.na(description),
      "No template decription has been provided.",
      sub(">\\n", "", description)
    )
  ) %>%
  select(repo_name, name, description) 

closeAllConnections()
