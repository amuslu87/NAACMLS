# Create expanded data frame structure with additional assessment fields
naacls_programs <- data.frame(
  # Basic Program Information
  program_id = numeric(),
  institution_name = character(),
  program_type = character(),
  accreditation_status = character(),
  location_state = character(),
  program_size = numeric(),
  
  # Technology Integration (from original structure)
  has_molecular_diagnostics = logical(),
  has_advanced_molecular = logical(),
  has_bioinformatics = logical(),
  has_AI_ML = logical(),
  has_LIS_informatics = logical(),
  has_digital_pathology = logical(),
  has_automation = logical(),
  
  # Technology Assessment Metrics (new)
  tech_integration_score = numeric(),        # Overall tech integration score (0-100)
  lab_tech_modernity = numeric(),           # Modern lab equipment score (0-100)
  digital_infrastructure = numeric(),        # Digital resources score (0-100)
  tech_training_hours = numeric(),          # Annual technology training hours
  
  # Wellness Components (expanded)
  has_mental_health_support = logical(),
  has_stress_management = logical(),
  has_burnout_prevention = logical(),
  has_work_life_balance = logical(),
  wellness_program_quality = numeric(),      # Wellness program rating (0-100)
  counseling_hours_weekly = numeric(),       # Available counseling hours
  wellness_budget_per_student = numeric(),   # Annual wellness budget per student
  
  # Future-Ready Skills
  ai_ml_curriculum_hours = numeric(),        # Hours dedicated to AI/ML
  bioinformatics_proficiency = numeric(),    # Bioinformatics skill rating (0-100)
  digital_pathology_capacity = numeric(),    # Digital pathology capability score
  future_skills_index = numeric(),           # Combined future readiness score
  
  # Program Outcomes
  employment_rate = numeric(),
  retention_rate = numeric(),
  certification_pass_rate = numeric(),
  graduate_satisfaction = numeric(),
  employer_satisfaction = numeric(),
  
  # Detailed Technology Components
  software_platforms = character(),          # List of software used
  virtual_learning_tools = character(),
  specialized_equipment = character(),
  
  # Support and Resources
  student_support_hours = numeric(),         # Weekly support hours available
  faculty_tech_expertise = numeric(),        # Faculty tech proficiency score
  resource_accessibility = numeric(),        # Resource access rating
  
  # Professional Development
  industry_partnerships = numeric(),         # Number of industry partners
  research_opportunities = logical(),
  internship_availability = logical(),
  career_services_quality = numeric()        # Career services rating (0-100)
)

# Example entries
example_programs <- data.frame(
  program_id = c(1, 2, 3),
  institution_name = c("Tech Forward University", "Traditional College", "Innovation Institute"),
  program_type = c("MLS", "MLT", "MLS"),
  accreditation_status = c("Full", "Full", "Initial"),
  location_state = c("CA", "NY", "TX"),
  program_size = c(50, 30, 40),
  
  # Technology Integration
  has_molecular_diagnostics = c(TRUE, FALSE, TRUE),
  has_advanced_molecular = c(TRUE, FALSE, TRUE),
  has_bioinformatics = c(TRUE, FALSE, TRUE),
  has_AI_ML = c(TRUE, FALSE, FALSE),
  has_LIS_informatics = c(TRUE, TRUE, TRUE),
  has_digital_pathology = c(TRUE, FALSE, TRUE),
  has_automation = c(TRUE, TRUE, TRUE),
  
  # Technology Assessment
  tech_integration_score = c(95, 65, 85),
  lab_tech_modernity = c(90, 70, 85),
  digital_infrastructure = c(95, 60, 80),
  tech_training_hours = c(120, 60, 90),
  
  # Wellness Components
  has_mental_health_support = c(TRUE, TRUE, TRUE),
  has_stress_management = c(TRUE, FALSE, TRUE),
  has_burnout_prevention = c(TRUE, FALSE, TRUE),
  has_work_life_balance = c(TRUE, TRUE, TRUE),
  wellness_program_quality = c(90, 70, 85),
  counseling_hours_weekly = c(40, 20, 30),
  wellness_budget_per_student = c(1000, 500, 750),
  
  # Future-Ready Skills
  ai_ml_curriculum_hours = c(60, 0, 30),
  bioinformatics_proficiency = c(90, 50, 80),
  digital_pathology_capacity = c(95, 60, 85),
  future_skills_index = c(92, 55, 82),
  
  # Program Outcomes
  employment_rate = c(98, 92, 95),
  retention_rate = c(95, 88, 92),
  certification_pass_rate = c(98, 90, 95),
  graduate_satisfaction = c(4.8, 4.2, 4.5),
  employer_satisfaction = c(4.9, 4.0, 4.6),
  
  # Technology Components
  software_platforms = c(
    "Python, R, LIS, Digital Pathology Suite",
    "LIS only",
    "Python, LIS, Digital Pathology Suite"
  ),
  virtual_learning_tools = c(
    "VR Lab, Digital Simulations, Online Modules",
    "Online Modules",
    "Digital Simulations, Online Modules"
  ),
  specialized_equipment = c(
    "Digital Microscopy, NGS, Mass Spec",
    "Basic Lab Equipment",
    "Digital Microscopy, Mass Spec"
  ),
  
  # Support and Resources
  student_support_hours = c(60, 30, 45),
  faculty_tech_expertise = c(90, 70, 85),
  resource_accessibility = c(95, 75, 85),
  
  # Professional Development
  industry_partnerships = c(12, 4, 8),
  research_opportunities = c(TRUE, FALSE, TRUE),
  internship_availability = c(TRUE, TRUE, TRUE),
  career_services_quality = c(95, 75, 85)
)