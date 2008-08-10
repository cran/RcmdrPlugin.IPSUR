# Last modified Feb 16, 2008


`IPSURgetAnswer` <-
function (chapter = NULL, problem = NULL) 
{
    allAnswers = c("0.1")
    if (is.null(chapter) | is.null(problem)) {
        cat("getAnswer() needs to be called with a chapter and problem number.\n")
        cat("The available answers are:\n")
        return(allAnswers)
    }
    chapprob = as.character(paste(chapter, ".", problem, sep = "", 
        collapse = ""))
    if (chapprob %in% allAnswers) {
        UsingRurl = "http://www.cc.ysu.edu/~gjkerns/IPSUR/exercises"
        url = paste(UsingRurl, "/problem-", chapprob, ".html", 
            sep = "", collapse = "")
        browseURL(url)
    }
    else {
        cat("Sorry the answer to problem ", chapprob, " is not available\n")
    }
}

`ipsurweb` <-
function (what = c("homepage", "errata", "changes", "exercises", 
    "package")) 
{
    what = match.arg(what)
    urls = c(homepage = "http://www.cc.ysu.edu/~gjkerns/IPSUR", 
        errata = "http://www.cc.ysu.edu/~gjkerns/IPSUR/errata", 
        changes = "http://www.cc.ysu.edu/~gjkerns/IPSUR/changes", 
        exercises = "http://www.cc.ysu.edu/~gjkerns/IPSUR/exercises", 
        package = "http://www.cc.ysu.edu/~gjkerns/IPSUR/package")
    url = urls[what]
    browseURL(url)
}

`IPSURweb` <-
function (what = c("homepage", "errata", "changes", "exercises", 
    "package")) 
{
    what = match.arg(what)
    urls = c(homepage = "http://www.cc.ysu.edu/~gjkerns/IPSUR", 
        errata = "http://www.cc.ysu.edu/~gjkerns/IPSUR/errata", 
        changes = "http://www.cc.ysu.edu/~gjkerns/IPSUR/changes", 
        exercises = "http://www.cc.ysu.edu/~gjkerns/IPSUR/exercises", 
        package = "http://www.cc.ysu.edu/~gjkerns/IPSUR/package")
    url = urls[what]
    browseURL(url)
}


`pbirthday.ipsur` <-
function (n, classes = 365, coincident = 2) 
{
    k <- coincident
    c <- classes
    if (k < 2) 
        return(1)
    if (k > n) 
        return(0)
    if (k == 2) {
        return(1 - prod((c:(c - n + 1))/rep(c, n)))
    }
    if (n > c * (k - 1)) 
        return(1)
    eps <- 1e-14
    if (qbirthday(1 - eps, c, k) <= n) 
        return(1 - eps)
    f <- function(p) qbirthday(p, c, k) - n
    upper <- min(1, exp(k * log(n) - (k - 1) * log(c)), na.rm = TRUE)
    nmin <- uniroot(f, lower = 0, upper = upper, tol = eps)
    if (nmin$root == 0 && f(.Machine$double.xmin) < 0) {
        f <- function(ln.p) qbirthday(exp(ln.p), c, k) - n
        nmin <- uniroot(f, lower = floor(log(.Machine$double.xmin)), 
            upper = -2, tol = eps)
        exp(nmin$root)
    }
    else nmin$root
}


`qbirthday.ipsur` <-
function (prob = 0.5, classes = 365, coincident = 2) 
{
    k <- coincident
    c <- classes
    p <- prob
    if (p <= 0) 
        return(1)
    if (p >= 1) 
        return(c * (k - 1) + 1)
    if (k == 2) {
        x <- sapply(0:c, function(t) pbirthday(n = t, classes = c, 
            coincident = 2))
        return(min(which(x >= p)) - 1)
    }
    if ((k - 1) * log(c) > 8 || 1 - p < 1e-07) {
        lnN <- ((k - 1) * log(c) + lgamma(k + 1) + log(-log1p(-p)))/k
        N <- exp(lnN)
    }
    else {
        N <- (c^(k - 1) * gamma(k + 1) * log(1/(1 - p)))^(1/k)
    }
    round(N)
}




#######
# Need this to assign numbers below
RcmdrEnv <- function() {
    pos <-  match("RcmdrEnv", search())
    if (is.na(pos)) { # Must create it
        RcmdrEnv <- list()
        attach(RcmdrEnv, pos = length(search()) - 1)
        rm(RcmdrEnv)
        pos <- match("RcmdrEnv", search())
        }
    return(pos.to.env(pos))
    }

###############################################################
###############################################################
# Extra counters
    #assign("simsetNumber", 0, envir = RcmdrEnv())
    #assign("datasetNumber", 0, envir = RcmdrEnv())
    assign("betasimNumber", 0, envir = RcmdrEnv())
    assign("chisqsimNumber", 0, envir = RcmdrEnv())
    assign("binomsimNumber", 0, envir = RcmdrEnv())
    assign("hypersimNumber", 0, envir = RcmdrEnv())
    assign("gammasimNumber", 0, envir = RcmdrEnv())
    assign("expsimNumber", 0, envir = RcmdrEnv())
    assign("normsimNumber", 0, envir = RcmdrEnv())
    assign("fsimNumber", 0, envir = RcmdrEnv())
    assign("tsimNumber", 0, envir = RcmdrEnv())
    assign("cauchysimNumber", 0, envir = RcmdrEnv())
    assign("geomsimNumber", 0, envir = RcmdrEnv())
    assign("lnormsimNumber", 0, envir = RcmdrEnv())
    assign("logissimNumber", 0, envir = RcmdrEnv())
    assign("nbinomsimNumber", 0, envir = RcmdrEnv())
    assign("poissimNumber", 0, envir = RcmdrEnv())
    assign("weibullsimNumber", 0, envir = RcmdrEnv())
    assign("unifsimNumber", 0, envir = RcmdrEnv())
    assign("disunifsimNumber", 0, envir = RcmdrEnv())

###############################################################
###############################################################
# End Extra counters
