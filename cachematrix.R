## These functions are used to measure a matrix's inverse and store the output.

## makeCacheMatrix Checks whether the input is a matrix or not. It generates a list of functions set , get, 
## setinverse and getinverse. The fucntion houses the cached inverse matrix, if already determined.

makeCacheMatrix <- function(x = matrix()) {
     invm <- NULL
     set <- function(y) {
          x <<- y
          invm <<- NULL
     }
     get <- function() x
     setinverse <- function(solve) invm <<- solve
     getinverse <- function() invm
     list(set = set, get = get,
          setinverse = setinverse,
          getinverse = getinverse)
}


## cacheSolve Receives the cached matrix . If already computed, it retrieves and returns the inverse matrix  
##If no stored value exists, it calculates for the inverse and stores the inverse matrix
## in the cache,

cacheSolve <- function(x, ...) {
     invm <- x$getinverse()
     if(!is.null(invm)) {
          message("getting cached data")
          return(invm)
          ## Returns the inverse matrix from the cached data
     }
     data <- x$get()
     invm <- solve(data, ...)
     x$setinverse(invm)
     invm
     ## Return a matrix that is the inverse of 'x'
}
