## The functions makeCacheMatrix and cacheSolve work together
## to compute and cache the inverse of a matrix. If the inverse
## of a matrix has already been computed it is retrieved from
## the cache otherwise it is computed and stored in the cache

## This function creates an object that can cache its inverse.
## The list at the end is used to access the functions defined
## within makeCacheMatrix.

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL;
	
	set <- function(y) {
		x <<- y;
		inv <<- NULL;
	}
	
	get <- function() {
		x;
	}
	
	setinv <- function(inverse) {
		inv <<- inverse;
	}
	
	getinv <-function() {
		inv;
	}
	
	 list(set = set, get = get,
             setinv = setinv,
             getinv = getinv);
}


## This function computes the inverse of the object returned by makeCacheMatrix. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the function retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
    inv <- x$getinv();
    if(!is.null(m)) {
		message("Getting cached data...");  
		return(m);
    }
	data <- x$get();
	inv <- solve(data, ...);
	x$setinv(inv);
	inv;
}
