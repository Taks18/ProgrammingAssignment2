## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        ##Inititalizing main X matrix
        inv<- NULL
        set<-function(y){
                ## setng up the another function to change main X matrix
                x <<- y ## substitue matrix x with y in the ain function (makeCacheMatrix())
                inv <<- NULL## intitializing inverse of amtrix to null
        }
        get<-function() x## get function returns the matrix x stored in the main function
        setinv<-function(Invm) inv<<-Invm## stinv function stores the value of inverse matrix
        getinv<-function() inv## get the value of inverse matrix without any argument
        list(set=set,get=get,setinv=setinv,getinv=getinv)## store all the function into list so make CacheMatix() function is assigned to an object
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv<-x$getinv()## first to see inverser matrix for the passed matrix is available or not, if yes then pass message by saying "getting inverser matrix and return the inverse matrix
        if(!is.null(inv)){
                message("getting inv matrix")
                return(inv)
        }
        data<-x$get()## if not inverse amtrix is stored then given matrix stored into data variable
        inv<-solve(data,...)## calculate inverser amtrix using solve function ( example shown below)
        x$setinv(inv)##pass back the inverser matrix to makecacheMatrix function to store inverse of given matrix
        inv
}

## example with results shown using above make and cache function to get inverse of matrix

# > a<-makeCacheMatrix(matrix(c(3,3.2,3.5,3.6),2,2))--Passing 2x2 matric
# > a$get()--Value of argument matrix using a$get()
# [,1] [,2]
# [1,]  3.0  3.5
# [2,]  3.2  3.6
# > cachesolve(a)--catchinginverse of special matrix
# [,1]  [,2]
# [1,]   -9  8.75
# [2,]    8 -7.50
# > cachesolve(a)---pssing again gives message that inv amtrix already there and shows the value of stored inverse matrix
# getting inv matrix
# [,1]  [,2]
# [1,]   -9  8.75
# [2,]    8 -7.50
# > 
