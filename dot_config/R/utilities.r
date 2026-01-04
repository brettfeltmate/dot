# vim: ft=r
# R Utility Functions
# Sourced by ~/.Rprofile on interactive session startup

# Environment Overview Function
# Creates a markdown file with detailed information about objects in .GlobalEnv
# Usage: env_overview() or eo()
env_overview <- function(
  preview_rows = 6,
  preview_elements = 10,
  max_str_lines = 15
) {
  # Helper function: format file size
  format_size <- function(bytes) {
    if (bytes < 1024) {
      return(sprintf("%d bytes", bytes))
    } else if (bytes < 1024^2) {
      return(sprintf("%.1f Kb", bytes / 1024))
    } else {
      return(sprintf("%.1f Mb", bytes / 1024^2))
    }
  }

  # Helper function: categorize objects by type
  categorize_object <- function(obj) {
    # Functions are excluded
    if (is.function(obj)) {
      return(NULL)
    }

    # Data frames and tibbles
    if (inherits(obj, c("data.frame", "data.table", "tbl_df", "tbl"))) {
      return("1_dataframes")
    }

    # Matrices and arrays
    if (is.matrix(obj) || is.array(obj)) {
      return("2_matrices")
    }

    # Atomic vectors (but not matrices/arrays)
    if (is.atomic(obj) && !is.matrix(obj) && !is.array(obj)) {
      return("3_vectors")
    }

    # Lists (check for models first)
    if (is.list(obj)) {
      # Model objects
      if (inherits(obj, c("lm", "glm", "gam", "lme", "lmer", "glmer", "nls"))) {
        return("5_models")
      }
      # Regular lists
      return("4_lists")
    }

    # Everything else
    return("6_other")
  }

  # Helper function: format data frame info
  format_dataframe <- function(obj, obj_name, preview_rows) {
    size <- format_size(as.numeric(object.size(obj)))
    dims <- sprintf("%d x %d", nrow(obj), ncol(obj))
    type <- class(obj)[1]

    # Column types
    col_info <- vapply(
      obj,
      function(col) {
        cl <- class(col)[1]
        if (is.factor(col)) {
          sprintf("%s (%d levels)", cl, nlevels(col))
        } else {
          cl
        }
      },
      character(1)
    )

    col_lines <- paste0("- ", names(col_info), ": ", col_info, collapse = "\n")

    # Preview
    preview <- capture.output({
      if (nrow(obj) > preview_rows) {
        print(head(obj, preview_rows))
        cat(sprintf("# ... (%d more rows)\n", nrow(obj) - preview_rows))
      } else {
        print(obj)
      }
    })
    preview <- paste(preview, collapse = "\n")

    # Check for data.table keys
    key_info <- ""
    if (
      inherits(obj, "data.table") &&
        requireNamespace("data.table", quietly = TRUE)
    ) {
      keys <- data.table::key(obj)
      if (!is.null(keys) && length(keys) > 0) {
        key_info <- sprintf("\n**Keys:** %s\n", paste(keys, collapse = ", "))
      }
    }

    sprintf(
      "## `%s`\n**Type:** %s | **Size:** %s | **Dims:** %s%s\n\n**Column Types:**\n%s\n\n**Preview:**\n```r\n%s\n```\n",
      obj_name,
      type,
      size,
      dims,
      key_info,
      col_lines,
      preview
    )
  }

  # Helper function: format matrix/array info
  format_matrix <- function(obj, obj_name, preview_rows) {
    size <- format_size(as.numeric(object.size(obj)))
    dims <- paste(dim(obj), collapse = " x ")
    type <- class(obj)[1]

    # Preview (limit rows and columns)
    preview <- capture.output({
      if (is.matrix(obj)) {
        nr <- min(nrow(obj), preview_rows)
        nc <- min(ncol(obj), 6)
        print(obj[1:nr, 1:nc, drop = FALSE])
        if (nrow(obj) > nr || ncol(obj) > nc) {
          cat(sprintf(
            "# ... (showing %d of %d rows, %d of %d cols)\n",
            nr,
            nrow(obj),
            nc,
            ncol(obj)
          ))
        }
      } else {
        # Array - just show structure
        str(obj, max.level = 2)
      }
    })
    preview <- paste(preview, collapse = "\n")

    sprintf(
      "## `%s`\n**Type:** %s | **Size:** %s | **Dims:** %s\n\n**Preview:**\n```r\n%s\n```\n",
      obj_name,
      type,
      size,
      dims,
      preview
    )
  }

  # Helper function: format vector info
  format_vector <- function(obj, obj_name, preview_elements) {
    size <- format_size(as.numeric(object.size(obj)))
    len <- length(obj)
    type <- class(obj)[1]

    # Type-specific info
    type_info <- ""
    if (is.factor(obj)) {
      type_info <- sprintf(" (%d levels)", nlevels(obj))
    }

    # Preview
    preview <- capture.output({
      if (len > preview_elements) {
        print(head(obj, preview_elements))
        cat(sprintf(
          "# ... (%d more elements, %d total)\n",
          len - preview_elements,
          len
        ))
      } else {
        print(obj)
      }
    })
    preview <- paste(preview, collapse = "\n")

    # Summary for numeric vectors
    summary_info <- ""
    if (is.numeric(obj) && !is.factor(obj)) {
      summ <- capture.output(summary(obj))
      summary_info <- sprintf(
        "\n\n**Summary:**\n```r\n%s\n```",
        paste(summ, collapse = "\n")
      )
    }

    sprintf(
      "## `%s`\n**Type:** %s%s | **Size:** %s | **Length:** %d\n\n**Preview:**\n```r\n%s\n```%s\n",
      obj_name,
      type,
      type_info,
      size,
      len,
      preview,
      summary_info
    )
  }

  # Helper function: format list info
  format_list <- function(obj, obj_name, max_str_lines) {
    size <- format_size(as.numeric(object.size(obj)))
    len <- length(obj)
    type <- class(obj)[1]

    # Structure
    struct <- capture.output(str(obj, max.level = 3, list.len = max_str_lines))
    struct <- paste(struct, collapse = "\n")

    sprintf(
      "## `%s`\n**Type:** %s | **Size:** %s | **Length:** %d\n\n**Structure:**\n```r\n%s\n```\n",
      obj_name,
      type,
      size,
      len,
      struct
    )
  }

  # Helper function: format model info
  format_model <- function(obj, obj_name, max_str_lines) {
    size <- format_size(as.numeric(object.size(obj)))
    type <- class(obj)[1]

    # Formula if available
    formula_info <- ""
    if (!is.null(obj$formula)) {
      formula_info <- sprintf(
        "**Formula:**\n```r\n%s\n```\n\n",
        deparse(obj$formula)
      )
    } else if (!is.null(obj$call)) {
      formula_info <- sprintf("**Call:**\n```r\n%s\n```\n\n", deparse(obj$call))
    }

    # Model-specific info
    model_info <- ""
    if (inherits(obj, "lm")) {
      n_coef <- length(coef(obj))
      n_obs <- length(obj$residuals)
      rsq <- summary(obj)$r.squared
      model_info <- sprintf(
        "**Model Info:**\n- Coefficients: %d\n- Observations: %d\n- R-squared: %.4f\n\n",
        n_coef,
        n_obs,
        rsq
      )
    }

    # Structure (limited)
    struct <- capture.output(str(obj, max.level = 1, list.len = 10))
    struct <- paste(head(struct, max_str_lines), collapse = "\n")

    sprintf(
      "## `%s`\n**Type:** %s | **Size:** %s\n\n%s%s**Structure:**\n```r\n%s\n```\n",
      obj_name,
      type,
      size,
      formula_info,
      model_info,
      struct
    )
  }

  # Helper function: format other objects
  format_other <- function(obj, obj_name, max_str_lines) {
    size <- format_size(as.numeric(object.size(obj)))
    type <- paste(class(obj), collapse = ", ")

    # Structure
    struct <- capture.output(str(obj, max.level = 2))
    struct <- paste(head(struct, max_str_lines), collapse = "\n")

    sprintf(
      "## `%s`\n**Type:** %s | **Size:** %s\n\n**Structure:**\n```r\n%s\n```\n",
      obj_name,
      type,
      size,
      struct
    )
  }

  # Main function logic
  start_time <- Sys.time()

  # Get all objects from global environment (excluding hidden ones)
  obj_names <- ls(envir = .GlobalEnv, all.names = FALSE)

  if (length(obj_names) == 0) {
    message("No objects in .GlobalEnv")
    return(invisible(NULL))
  }

  # Categorize objects
  obj_info <- lapply(obj_names, function(name) {
    obj <- get(name, envir = .GlobalEnv)
    category <- categorize_object(obj)
    if (is.null(category)) {
      return(NULL)
    } # Skip functions

    list(
      name = name,
      obj = obj,
      category = category,
      size = as.numeric(object.size(obj))
    )
  })

  # Remove NULL entries (functions)
  obj_info <- obj_info[!vapply(obj_info, is.null, logical(1))]

  if (length(obj_info) == 0) {
    message("No non-function objects in .GlobalEnv")
    return(invisible(NULL))
  }

  # Sort by category then by name
  obj_info <- obj_info[order(
    vapply(obj_info, function(x) x$category, character(1)),
    vapply(obj_info, function(x) x$name, character(1))
  )]

  # Calculate summary statistics
  total_size <- sum(vapply(obj_info, function(x) x$size, numeric(1)))

  # Create summary table with individual object rows
  category_names <- c(
    "1_dataframes" = "Data Frames",
    "2_matrices" = "Matrices",
    "3_vectors" = "Vectors",
    "4_lists" = "Lists",
    "5_models" = "Models",
    "6_other" = "Other"
  )

  summary_lines <- character(0)
  for (info in obj_info) {
    summary_lines <- c(
      summary_lines,
      sprintf(
        "| %-20s | %-15s | %10s |",
        info$name,
        category_names[info$category],
        format_size(info$size)
      )
    )
  }

  # Build markdown content
  md_lines <- c(
    "# R Environment Overview",
    "",
    sprintf("**Generated:** %s", format(Sys.time(), "%Y-%m-%dT%H:%M:%S")),
    sprintf("**Working Directory:** `%s`", getwd()),
    sprintf("**Total Objects:** %d", length(obj_info)),
    sprintf("**Total Size:** %s", format_size(total_size)),
    "",
    "---",
    "",
    "## Summary by Type",
    "",
    "| Name                 | Type            | Size       |",
    "|----------------------|-----------------|------------|",
    summary_lines,
    "",
    "---",
    ""
  )

  # Add section headers and format each object
  current_category <- ""
  for (info in obj_info) {
    # Add section header if category changed
    if (info$category != current_category) {
      current_category <- info$category
      section_name <- category_names[current_category]
      md_lines <- c(md_lines, sprintf("# %s", section_name), "")
    }

    # Format object based on category
    obj_md <- tryCatch(
      {
        switch(info$category,
          "1_dataframes" = format_dataframe(info$obj, info$name, preview_rows),
          "2_matrices" = format_matrix(info$obj, info$name, preview_rows),
          "3_vectors" = format_vector(info$obj, info$name, preview_elements),
          "4_lists" = format_list(info$obj, info$name, max_str_lines),
          "5_models" = format_model(info$obj, info$name, max_str_lines),
          "6_other" = format_other(info$obj, info$name, max_str_lines)
        )
      },
      error = function(e) {
        sprintf(
          "## `%s`\n**Type:** %s | **Size:** %s\n\n*Preview unavailable: %s*\n",
          info$name,
          class(info$obj)[1],
          format_size(info$size),
          e$message
        )
      }
    )

    md_lines <- c(md_lines, obj_md, "")
  }

  # Ensure cache directory exists
  cache_dir <- path.expand("~/.local/cache")
  if (!dir.exists(cache_dir)) {
    dir.create(cache_dir, recursive = TRUE)
  }

  # Write to file
  output_file <- file.path(cache_dir, "r_env_overview.md")
  writeLines(md_lines, output_file)

  # Print completion message
  elapsed <- as.numeric(difftime(Sys.time(), start_time, units = "secs"))
  message(sprintf("Environment overview written to: %s", output_file))
  message(sprintf(
    "Processed %d objects in %.2f seconds",
    length(obj_info),
    elapsed
  ))

  invisible(output_file)
}

# Alias for env_overview
eo <- env_overview

# Object Preview Function
# Creates a concise markdown preview of a single R object
# Usage: obj_preview("object_name") or op("object_name")
obj_preview <- function(
  obj_name,
  preview_rows = 6,
  preview_elements = 10,
  max_str_lines = 15
) {
  if (!exists(obj_name, envir = .GlobalEnv)) {
    return(paste0("Error: Object '", obj_name, "' not found in .GlobalEnv"))
  }

  obj <- get(obj_name, envir = .GlobalEnv)
  output_file <- path.expand("~/.local/cache/r_obj_preview.md")

  format_size <- function(bytes) {
    if (bytes < 1024) {
      sprintf("%d bytes", bytes)
    } else if (bytes < 1024^2) {
      sprintf("%.1f Kb", bytes / 1024)
    } else {
      sprintf("%.1f Mb", bytes / 1024^2)
    }
  }

  size <- format_size(as.numeric(object.size(obj)))
  type <- paste(class(obj), collapse = ", ")

  lines <- c(
    sprintf("# Preview: `%s`", obj_name),
    "",
    sprintf("**Type:** %s | **Size:** %s", type, size)
  )

  # Type-specific formatting
  if (inherits(obj, c("data.frame", "data.table", "tbl_df", "tbl"))) {
    dims <- sprintf("%d x %d", nrow(obj), ncol(obj))
    lines <- c(lines, sprintf(" | **Dims:** %s", dims), "")

    # Column info
    col_info <- vapply(
      obj,
      function(col) {
        cl <- class(col)[1]
        if (is.factor(col)) {
          sprintf("%s (%d levels)", cl, nlevels(col))
        } else {
          cl
        }
      },
      character(1)
    )

    lines <- c(lines, "**Columns:**")
    lines <- c(lines, paste0("- ", names(col_info), ": ", col_info))
    lines <- c(lines, "", "**Preview:**", "```r")

    preview <- capture.output({
      if (nrow(obj) > preview_rows) {
        print(head(obj, preview_rows))
        cat(sprintf("# ... (%d more rows)\n", nrow(obj) - preview_rows))
      } else {
        print(obj)
      }
    })
    lines <- c(lines, preview, "```")
  } else if (is.matrix(obj) || is.array(obj)) {
    dims <- paste(dim(obj), collapse = " x ")
    lines <- c(
      lines,
      sprintf(" | **Dims:** %s", dims),
      "",
      "**Preview:**",
      "```r"
    )

    preview <- capture.output({
      if (is.matrix(obj)) {
        nr <- min(nrow(obj), preview_rows)
        nc <- min(ncol(obj), 6)
        print(obj[1:nr, 1:nc, drop = FALSE])
        if (nrow(obj) > nr || ncol(obj) > nc) {
          cat(sprintf("# ... (%d rows, %d cols total)\n", nrow(obj), ncol(obj)))
        }
      } else {
        str(obj, max.level = 2)
      }
    })
    lines <- c(lines, preview, "```")
  } else if (is.atomic(obj) && !is.matrix(obj) && !is.array(obj)) {
    len <- length(obj)
    lines <- c(
      lines,
      sprintf(" | **Length:** %d", len),
      "",
      "**Preview:**",
      "```r"
    )

    preview <- capture.output({
      if (len > preview_elements) {
        print(head(obj, preview_elements))
        cat(sprintf("# ... (%d more, %d total)\n", len - preview_elements, len))
      } else {
        print(obj)
      }
    })
    lines <- c(lines, preview, "```")

    if (is.numeric(obj) && !is.factor(obj)) {
      lines <- c(lines, "", "**Summary:**", "```r")
      lines <- c(lines, capture.output(summary(obj)), "```")
    }
  } else if (is.list(obj)) {
    len <- length(obj)
    lines <- c(
      lines,
      sprintf(" | **Length:** %d", len),
      "",
      "**Structure:**",
      "```r"
    )
    struct <- capture.output(str(obj, max.level = 2, list.len = max_str_lines))
    lines <- c(lines, struct, "```")
  } else {
    lines <- c(lines, "", "**Structure:**", "```r")
    struct <- capture.output(str(obj, max.level = 2))
    lines <- c(lines, head(struct, max_str_lines), "```")
  }

  writeLines(lines, output_file)
  paste0("Preview written to: ", output_file)
}

# Alias for obj_preview
op <- obj_preview
