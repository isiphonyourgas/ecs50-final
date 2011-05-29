/* 
 * File:   maze.c
 * Author: Gowtham
 *
 * Created on July 17, 2010, 8:01 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//The purpose of this program is to scan in a file that has
//a grid of sorts, X being locations to which you cannot
//move to. Locations with an O are ok. The sequence of 
//positions to take to get from (0,1) to (7,7) is
//printed out. 

void find_path2(char maze[8][8], int index, int index2);
int find_path(char maze[][8], int index, int index2);
/*
 * 
 */
int main(int argc, char* argv[]) {
  FILE *inp;
  char maze[8][8];
  int i;
  if (argc == 2)
  {
    inp = fopen(argv[1], "r");

    for (i = 0; i < 8; i++)
    {
      fgets(maze[i], 11, inp);
    } //for

    if (find_path(maze, 7 , 7) == 0)
      printf("No path was found.");
    else
      printf("(7, 7)");

  } //if


  return 0;

} //main()

int find_path(char maze[][8], int index, int index2)
{
  if (index < 0 || index2 < 0 || index > 7 || index2 > 7)
  {
    return 0;
  } //if

  if (maze[index][index2]== 'X')
  {
    return 0;

  } //if

  if (index == 0 && index2 == 1)
  {
    return 1;
  } //if

  maze[index][index2] = 'X';


  if (find_path(maze, index, index2 + 1) == 1)
  {
    printf("(%d, %d) \n", index, index2 + 1);
    return 1;
  } //if
  if (find_path(maze, index, index2 - 1) == 1)
  {
    printf("(%d, %d) \n", index, index2 - 1);
    return 1;
  } //if
  if (find_path(maze, index - 1, index2) == 1)
  {
    printf("(%d, %d) \n", index - 1, index2);
    return 1;
  } //if
  if (find_path(maze, index + 1, index2) == 1)
  {
    printf("(%d, %d) \n", index + 1, index2);
    return 1;
  } //if



  return 0;
} //find_path()