#remember when you working in ggplot it will be like this:
#ggplot(data=dataframe)+geom_plot_type(mapping=aes(variables()))
ggplot(data=diamonds)+
  geom_point(mapping = aes(x=carat,y=price))
#so what if we want to change the point colour
ggplot(data = diamonds)+
  geom_point(mapping = aes(x=carat,y=price,color=clarity))
#so what about if you want to change the color of point it should outside aes()
ggplot(data = diamonds)+
  geom_point(mapping = aes(x=carat,y=price),color="red")
#you can also play on the size of the plot
ggplot(data = diamonds)+
  geom_point(mapping = aes(x=carat,y=price),size=4.5)
#also change the shape
ggplot (data = diamonds)+
  geom_point(mapping = aes(x=carat,y=price),shape=18)

#facet_wrap()helpful for looking to categorical variable"~" called by
ggplot(data = diamonds)+
  geom_point(mapping = aes(x=carat,y=price))+
  facet_wrap(~clarity,nrow = 2)
#histogram allow you to quickly visualize the range of values your variable take and shape of your data
ggplot(data=diamonds)+
  geom_histogram(aes(carat))
#barplot show relationship between set of number and categorical variable
ggplot(data = diamonds)+
  geom_bar(mapping= aes(cut))
#boxplot show summary of numerical variable across category
ggplot(data = diamonds)+
  geom_boxplot(mapping= aes(x=color,y=price))
#you can change the blot color by fill argument
ggplot(data = diamonds)+
  geom_boxplot(mapping= aes(x=color,y=price),fill="red")

