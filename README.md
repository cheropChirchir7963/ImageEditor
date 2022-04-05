# ImageEditor

**TODO: Add description**

- This is a CLI program that simulates a simple interactive graphical editor

## Installation
- Clone the project by running the following command in your terminal
  `git clone https://github.com/cheropChirchir7963/ImageEditor.git`

- cd into the project directory `cd ImageEditor`

## Running the project
- To run the project you need to have Elixir version 1.13 installed

- cd into the project directory

- Start an iex session inside the project by running `iex -S mix`

- Use `ImageEditor.Cli.parser([I, X, Y])` to create a new M x N image with all pixels coloured white (O).
  For example:
  `ImageEditor.Cli.parser([I, 2, 3])` creates a 2 x 3 image with all pixels coloured (O)

- use `ImageEditor.Cli.parser([L, X, Y, C])` to colour the pixel (X,Y) with colour C
  For example:
  `ImageEditor.Cli.parser([L, 1, 2, C])` colors the pixel 1, 2 with the color C

- use `ImageEditor.Cli.parser([C])` to set all pixels of an image to O

- use `ImageEditor.Cli.parser([S])` to show the contents of the current image

- use `ImageEditor.Cli.parser([X])` to terminate a session

- use `ImageEditor.Cli.parser([V, X, Y1, Y2, C])` to draw a vertical segment of color C in column X between rows Y1 and Y2.
  For example:
  `ImageEditor.Cli.parser([V, 2, 1, 3, D])` colors column 2 between row 1 and row 2 with color D.

- use `ImageEditor.Cli.parser([H, X1, X2, Y, C])` to draw a horizontal segment of color C in row Y between rows X1 and X2.
  For example:
  `ImageEditor.Cli.parser([H, 1, 3, 3, K])` colors row 3 between column 1 and column 2 with the color K.


