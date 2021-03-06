## This is a pair of functions that cache the inverse of a matrix so as to not
## have to compute it repeatedly

## This function creates a special "matrix" object that can cache its inverse. 
## It has contains 4 functions, i.e., get, set, setInverse, getInverse.

makeCacheMatrix <- function(x = matrix()) {inv <- NULL
set <- function(y) {
x <<- y
inv <<- NULL }
get <- function() x
setInverse <- function(inverse) inv <<- inverse
getInverse <- function() inv
list(set = set, get = get, 
setInverse = setInverse,
getInverse = getInverse)
}


##This function computes the inverse of the special matrix created by 
##the makeCacheMatrix function
##Checks if the inverse has already been calculated and if the matrix has not changed, 
##then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
if(!is.null(inv)){
  message("getting cached data")
  return(inv)
}
data <- x$get()
inv <- solve(data)
x$setInverse(inv)
inv      
}
