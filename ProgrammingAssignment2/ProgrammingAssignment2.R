makeCacheMatrix <- function(x = matrix()) {        #Creates a function that takes x as a matrix
    m <- NULL                               #sets a value m to null
    set <- function(y) {                    #creates a function 'set' that takes a y stores x there and initializes m to NULL
        x <<- y
        m <<- NULL
    }  
    get <- function() x                     #creates a function called get, I think it's anonymous?
    setMatrix <- function(solve) m<<- solve  #creates a function called setMatrix which is a function using solve as an argument
    getMatrix <- function() m               #creates a function that will have m
    list(set = set, get = get,              # makes a list of options that are actually functions?
         setMatrix = setMatrix,
         getMatrix = getMatrix)
}

cacheSolve <- function(x, ...){             #creates a function that passes the already defined matrix x into it
    m <- x$getMatrix()                      # m gets the value of the x's getMatrix stored into it
    if(!is.null(m)){                        #creates an if statement that if m is not NULL send mesage getting cached matrix and return that matrix m
        message("getting cached Matrix")
        return(m)
    }
    data <- x$get()                          #otherwise, pull x from makeCachematrix and store into data
    m <- solve(data)                         #since data is full now with a matrix, store its inverse into m 
    x$setMatrix(m)                           #put that inverse which we call m into x$setMatrix's value
    m                                        #put m down? Does this really do anything?
}
