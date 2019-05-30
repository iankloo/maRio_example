#---R code to run maRio app
library(servr)

#-note: you may want to run the frontend and backend code below in different R sessions.
#-the frontend part will run successfully in the background, but the backend will not.

#-1. start frontend
servr::httw(dir = 'frontend/', browser = FALSE, port = 4321)

#-2. start backend
api <- plumber::plumb('backend/plumber.R')
api$run(port = 9059, swagger = FALSE)

#-3. view your app at http://127.0.0.1:4321

#-4. closing down
#stop the api with ctrl-c

#stop the frontend with:
#servr::daemon_stop(1)
