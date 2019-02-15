# Flask Dev Repository
This repository is a demo Flask app, which includes 2 Docker containers:
* devContainer - This container contains python 3.6, flask, and unit testing 
    tools.  See README in the folder.
* productionContainer - This container contains python 3.6, nginx, and wSGI to
    serve app/main.py in a production environment.  See README in the folder.

In both containers, go into the folder, build the container images, then start them here
in the root of the repo following the directions above.