% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/toprules.R
\name{topRules}
\alias{topRules}
\title{A wrapper for the arules method from the apriori package that iteratively changes mining parameters until a desired number of rules is obtained, all options are exhausted or a preset time limit is reached.
Within the arc package, this function serves as a replacement for the CBA-RG algorithm (without pessimistic pruning) with general apriori implementation provided by existing fast R package \strong{arules}.}
\usage{
topRules(txns, classitems, custom_alg_options = NULL, debug = FALSE)
}
\arguments{
\item{txns}{input transactions}

\item{classitems}{a list of items to appear in the consequent (rhs) of the rules}

\item{custom_alg_options}{a list of custom options, any options specified will override those defined by the \link{DEFAULT_RULE_LEARNING_SETUP} variable
\itemize{
 \item \strong{target_rule_count}: the main stopping criterion, mining stops when the resulting rule set contains this number of rules,
 \item \strong{init_support}: initial support,
 \item \strong{init_conf}: initial confidence,
 \item \strong{conf_step}: confidence will be changed by steps defined by this parameter,
 \item \strong{supp_step}: support will be changed by steps defined by this parameter,
 \item \strong{minlen}: minimum length of rules, minlen=1 corresponds to rule with empty antecedent and one item in consequent. In general, rules with empty antecedent are not desirable for the subsequent pruning algorithm, therefore the value of this parameter should be set at least to value 2,
 \item \strong{init_maxlen}: maximum length of rules, should be equal or higher than minlen. A higher value may decrease the number of iterations to obtain target_rule_count rules, but it also increases the risk of initial combinatorial explosion and subsequent memory crash of the apriori rule learner,
 \item \strong{iteration_timeout}: maximum number of seconds it should take apriori to obtain rules with current configuration,
 \item \strong{total_timeout}: maximum number of seconds the mining should take,
 \item \strong{max_iterations}: maximum number of iterations,
 }}

\item{debug}{boolean indicating whether to output debug messages.}
}
\value{
Returns an object of class rules.
}
\description{
A wrapper for the arules method from the apriori package that iteratively changes mining parameters until a desired number of rules is obtained, all options are exhausted or a preset time limit is reached.
Within the arc package, this function serves as a replacement for the CBA-RG algorithm (without pessimistic pruning) with general apriori implementation provided by existing fast R package \strong{arules}.
}
\examples{
\\code{
  topRules(as(discrNumeric(iris, "Species")$Disc.data,"transactions"), getItems(iris,"Species"))

}
}
\seealso{
\code{\link{prune}}
}
