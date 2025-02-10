# Install required packages if not already installed
# if (!require("rvest")) install.packages("rvest")
# if (!require("dplyr")) install.packages("dplyr")
# if (!require("tidyr")) install.packages("tidyr")
# if (!require("stringr")) install.packages("stringr")


install.packages(c("rvest", "dplyr", "tidyr", "stringr", "httr", "xml2", "RSelenium"))

install.packages("usethis")
library(usethis)

# Load required libraries
library(rvest)
library(dplyr)
library(tidyr)
library(stringr)
library(httr)
library(xml2)
library(RSelenium)
#library(splashr)

# Function to scrape NAACLS programs
scrape_naacls <- function() {
  # Base URL
  url <- "https://www.naacls.org/Find-a-Program.aspx"
  
  message("Accessing website...")
  
  # Get the initial page
  page <- read_html(url)
  
  # Get the form
  form <- html_form(page)[[1]]  # Get the first form on the page
  
  message("Found form, submitting search...")
  
  # Fill and submit the form
  filled_form <- html_form_set(form,
                               "ctl00$ContentPlaceHolder1$ddlProgramType" = "",  # Empty for all programs
                               "ctl00$ContentPlaceHolder1$btnSearch" = "Search"
  )
  
  # Submit the form
  results_page <- session(url) %>%
    session_submit(filled_form)
  
  message("Processing results...")
  
  # Extract the table containing programs
  programs_table <- results_page %>%
    html_nodes("table.GridView") %>%  # Adjust this selector based on actual HTML
    html_table() %>%
    .[[1]]  # Get the first table if multiple exist
  
  if(is.null(programs_table) || nrow(programs_table) == 0) {
    message("No data found in the results table.")
    return(data.frame())
  }
  
  # Clean column names
  names(programs_table) <- c("institution", "location", "program_type", "director", "contact")
  
  # Clean the data
  programs_df <- programs_table %>%
    mutate(across(everything(), trimws)) %>%
    filter(institution != "")
  
  return(programs_df)
}

# Function to save data to CSV
save_to_csv <- function(df, filename = "naacls_programs.csv") {
  tryCatch({
    write.csv(df, filename, row.names = FALSE)
    message(sprintf("Data saved to %s", filename))
  }, error = function(e) {
    message("Error saving file: ", e$message)
  })
}

# Debug function to print form details
debug_form <- function() {
  url <- "https://www.naacls.org/Find-a-Program.aspx"
  page <- read_html(url)
  forms <- html_form(page)
  
  message("Number of forms found: ", length(forms))
  
  if(length(forms) > 0) {
    message("\nForm details:")
    print(forms[[1]])
  }
  
  message("\nForm fields:")
  print(html_nodes(page, "input, select"))
}

# Main execution
main <- function() {
  message("Starting NAACLS program data collection...")
  
  tryCatch({
    # First run debug to see form structure
    message("\nChecking form structure...")
    debug_form()
    
    # Scrape programs
    message("\nStarting data collection...")
    programs_df <- scrape_naacls()
    
    # Check if we got any data
    if(nrow(programs_df) > 0) {
      # Add timestamp
      programs_df$scrape_date <- Sys.Date()
      
      # Save to CSV
      save_to_csv(programs_df)
      
      # Display summary
      message(sprintf("\nCollected information for %d programs", nrow(programs_df)))
      message("\nSample of collected data:")
      print(head(programs_df))
    } else {
      message("\nNo data was collected. Running diagnostics...")
      debug_form()
    }
  }, error = function(e) {
    message("Error in main execution: ", e$message)
    message("\nRunning diagnostics to help identify the issue...")
    debug_form()
  })
}

# Run the script with added debugging
message("Starting script with debug information...")
main()
