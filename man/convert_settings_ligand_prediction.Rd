% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/evaluate_model_ligand_prediction.R
\name{convert_settings_ligand_prediction}
\alias{convert_settings_ligand_prediction}
\title{Convert settings to correct settings format for ligand prediction.}
\usage{
convert_settings_ligand_prediction(settings, all_ligands, validation = TRUE, single = TRUE)
}
\arguments{
\item{settings}{A list of lists. Eeach sublist contains the following elements: .$name: name of the setting; .$from: name(s) of the ligand(s) active in the setting of interest; .$response: the observed target response: indicate for a gene whether it was a target or not in the setting of interest.}

\item{all_ligands}{A character vector of possible ligands that will be considered for the ligand activity state prediction.}

\item{validation}{TRUE if seetings need to be prepared for validation of ligand activity state predictions (this implies that the true active ligand of a setting is known); FALSE for application purposes when the true active ligand(s) is/are not known.}

\item{single}{TRUE if feature importance scores for ligands will be calculated by looking at ligans individually. FALSE if the goal is to calculate the feature importance scores via sophisticated classification algorithms like random forest.}
}
\value{
A list with following elements: $name, $ligand: name of active ligand(s) (only if validation is TRUE), $from (ligand(s) that will be tested for activity prediction), $response
}
\description{
\code{convert_settings_ligand_prediction} Converts settings to correct settings format for ligand activity prediction. In this prediction problem, ligands (out of a set of possibly active ligands) will be ranked based on feature importance scores. The format can be made suited for: 1) validation of ligand activity state prediction by calculating individual feature importane scores or 2) feature importance based on models with embedded feature importance determination; applications in which ligands need to be scores based on their possible upstream activity: 3) by calculating individual feature importane scores or 4) feature importance based on models with embedded feature importance determination.
}
\examples{
\dontrun{
settings = lapply(expression_settings_validation,convert_expression_settings_evaluation)
ligands = unlist(extract_ligands_from_settings(settings,combination = FALSE))
settings_ligand_pred = convert_settings_ligand_prediction(settings, ligands, validation = TRUE, single = TRUE)
}
}
