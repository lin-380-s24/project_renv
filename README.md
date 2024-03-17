## Instructions


## Prerequisites

To run this project, you will need to install the following dependencies:

- Docker
  - Docker Desktop (Windows, Mac)
  - `docker` command-line tool (Linux)
- Git
  - `git` command-line tool (Windows, Mac, Linux)
    - Windows: https://git-scm.com/download/win

## Setup

To set up the environment for this project, follow these steps:

1. Open Docker Destop and navigate to the "Images" tab.
2. Search for the `francojc/rstudio:plus` image and pull it to your local machine.
3. Run the Docker container.
   1. Map the container's port 8787 to your host machine's port 8787.
   2. Set the environment variable `PASSWORD` to `rstudio`.
4. Open your web browser and navigate to `http://localhost:8787`.
5. Log in with the username `rstudio` and the password `rstudio`.
6. Clone this repository to your RStudio environment as a new project.
7. Open (and source)/ Source the `renv-setup.R` script to install the project's R package dependencies and their versions.

## Usage

Render the project. Either:

1. Open the `index.qmd` file in RStudio and click the "Render" button.
2. Open the Terminal in RStudio and run the following command:

```sh
quarto render
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Quarto](https://quarto.org/)
- [RStudio](https://www.rstudio.com/)
- [Docker](https://www.docker.com/)
- [GitHub](https://github.com)
- [Git](https://git-scm.com/)
