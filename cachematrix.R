## The following functions help in caching the inverse of a matrix

## The makeCacheMatrix creates a 'vector' (a list, acually) that aids in setting
## up the elements of the matrix and also its inverse
print("Hello World!")
makeCacheMatrix <- function(x = matrix()) {
          inv <- NULL
          set <- function(y) {
            x <<- y
            inv <<- NULL
          }
          get <- function() x
          setinverse <- function(inverse) inv <<- inverse
          getinverse <- function() inv
          list(set = set, get = get,
               setinverse = setinverse,
               getinverse = getinverse)     

}


## The following function checks for any previously cached inverse of the matrix
## If nothing is available it computes the inverse and caches it

cacheSolve <- function(x, ...) {
          inv <- x$getinverse()
          if(!is.null(inv)) {
            message("getting cached data")
            return(inv)
          }
          data <- x$get()
          inv <- solve(data, ...)
          x$setinverse(inv)
          inv
}
