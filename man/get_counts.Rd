% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/elasticsearch_eda_funs.R
\name{get_counts}
\alias{get_counts}
\title{Examine the distribution of distinct values for a field in Elasticsearch}
\usage{
get_counts(field, es_host, es_index, start_date = "now-1w",
  end_date = "now", time_field, use_na = "always", max_terms = 1000)
}
\arguments{
\item{field}{A valid field in whatever Elasticsearch index you are querying}

\item{es_host}{A string identifying an Elasticsearch host. This should be of the form 
\code{[transfer_protocol][hostname]:[port]}. For example, \code{'http://myindex.thing.com:9200'}.}

\item{es_index}{The name of an Elasticsearch index to be queried.}

\item{start_date}{A character Elasticsearch date-time, indicating the earliest
date from which to show documents. Default is \code{"now-1w"}.}

\item{end_date}{A character Elasticsearch date-time, indicating the most recent
date from which to show documents. Default is \code{"now"}.}

\item{time_field}{Name of the date-time field in the target index on which you want to filter by time.}

\item{use_na}{A string to control handling of missing values in the result. Options are:
\enumerate{
\item{\code{"always"} to give a row in the table for NAs even if there are none (default)}
\item{\code{"ifany"} to include a count of missing values only if there are any}
\item{\code{NULL} to never include NAs}
}}

\item{max_terms}{What is the maximum number of unique terms to return? Many production
Elasticsearch deployments limit this to a small number by default. Default here is 1000.}
}
\description{
For a given field, return a data.table with its unique values in a time range.
}
\examples{
\dontrun{
# Count number of customers by payment method
recoDT <- get_counts(field = "pmt_method"
                     , es_host = "http://es.custdb.mycompany.com:9200"
                     , es_index = "ticket_sales"
                     , start_date = "now-2w"
                     , end_date = "now"
                     , time_field = "dateTime")
}
}
