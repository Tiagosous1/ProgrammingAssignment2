# Function to make the matrix in the cache
makeCacheMatrix <- function(x = matrix()) {
    t <- NULL
    set <- function(y) {
        x <<- y
        t <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) t <<- solve
    getsolve <- function() t
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}

## my function to create the inverse or get it from cache where it is there.

cacheSolve <- function(x, ...) {
    t <- x$getsolve()
    if(!is.null(t)) { #from the cache
        message("getting inversed matrix")
        return(t)
    }
    data <- x$get()
    t <- solve(data, ...)
    x$setsolve(t)
    t ## Return a matrix that is the inverse of 'x'
}
