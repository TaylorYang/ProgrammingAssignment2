## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        set<-function(y){
            x<<-y
            m<<-NULL
        }
        get<-function() {
            x
        }
        #Set the value of the matrix
        setMatrix<-function(solve){
            # Caches the inputted matrix so that cacheSolve can check whether it has changed
            m<<- solve
        } 
        getMatrix<-function(){
            #Get matrix
            m
        }
        # Creates a list to contain the four functions
        list(set=set, get=get,
               setMatrix=setMatrix,
               getMatrix=getMatrix)

}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        # Compare matrix to what was there before.
        # If an inverse has already been calculated this, gets it
        m<-x$getMatrix()
        # Check to see if cacheSolve has been run before
        if(!is.null(m)){
            message("Getting cached data!")
            return(m)
        }
        # Run the getMatrix function to get the value of the input matrix
        matrix<-x$get()
        m<-solve(matrix, ...)
        # run the setMatrix function on the inverse to cache the inverse
        x$setMatrix(m)
        # return the inverse
        m
}
