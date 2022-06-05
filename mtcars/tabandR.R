#using R with tableau

pacman::p_load(dplyr, ggplot2, Rserve, mvoutlier)

Rserve()


cor(mtcars$wt, mtcars$mpg)
