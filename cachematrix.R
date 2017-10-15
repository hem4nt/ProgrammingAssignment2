## Functions to crate a special matrix to store a matrix and cache the inverse
## of the same until the matrix values are reset.


## Function to store the matrix and calculate and cache the inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL #making inverse null if the matrix changed
  }
  get <- function() x
  calcinv <- function() inv <<- solve(x)
  getinv <- function() inv
  list(set = set, get = get,
       calcinv = calcinv,
       getinv = getinv)

}


## This function calculates the inverse if not already calculated and returns the 
## inverse of the matrix supplied.

cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
  if (is.null(x$getinv())){
    x$calcinv()
    x$getinv()
  }
  else{
    x$getinv()
  }
}
