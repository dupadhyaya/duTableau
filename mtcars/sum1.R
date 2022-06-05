#examples of mtcars

pacman::p_load(dplyr, tidyr, ggplot2)

df = read.csv(file='data/mtcars.csv')
df
names(df)

s6A <- df %>% group_by(state)  %>% summarise(stateMPG = mean(mpg, na.rm=T))
s6B <- df %>% group_by(state, am)  %>% summarise(cnt = n(), stateamMPG = mean(mpg, na.rm=T))

s6C <- merge(s6A, s6B, by='state')

s6C %>% mutate(diff = stateMPG - stateamMPG )

df %>% group_by(gear, state) %>% summarise(n=n(), HP = sum(hp, na.rm=T))
df %>% group_by(gear)  %>% summarise(n=n(), CYL = sum(cyl, na.rm=T), HP = sum(hp,na.rm=T)) %>% mutate(avgCYLhp = HP/CYL,n2= HP/n)
