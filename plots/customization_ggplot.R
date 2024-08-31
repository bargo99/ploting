#in the previous lesson we learn how to correct the color in scatter
ggplot(data = diamonds)+
  geom_point(mapping = aes(x=carat,y=price,color=clarity))
#so how we could make it in bar plot see the diffrence in each one
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=clarity))
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=clarity,color=cut))
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=clarity,fill = cut))
#scale_fill_manual argument manually change the color
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=clarity,fill = cut))+
  scale_fill_manual(values = c("red","orange","darkgreen","dodgerblue","purple4"))
#you could change position identity to dodge,fill
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=clarity,fill = cut),position = "fill")+
  scale_fill_manual(values = c("red","orange","darkgreen","dodgerblue","purple4"))
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=clarity,fill = cut),position = "dodge")+#it helps to compare values within each group
  scale_fill_manual(values = c("red","orange","darkgreen","dodgerblue","purple4"))
#labeling the plot by labs()using title, subtitle and caption argument
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=clarity,fill = cut),position = "fill")+
  scale_fill_manual(values = c("red","orange","darkgreen","dodgerblue","purple4"))+
  labs(title = "clearer diamond tend to be higher quality cut",
       subtitle = "the majority of IF diamonds are an\"ideal\"cut")
#after that let's see about the axis labels
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=clarity,fill = cut),position = "fill")+
  scale_fill_manual(values = c("red","orange","darkgreen","dodgerblue","purple4"))+
  labs(title = "clearer diamond tend to be higher quality cut",
       subtitle = "the majority of IF diamonds are an\"ideal\"cut")+
  ylab("proportion")
#not let's change the theme using ?theme
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=clarity,fill = cut),position = "fill")+
  scale_fill_manual(values = c("red","orange","darkgreen","dodgerblue","purple4"))+
  labs(title = "clearer diamond tend to be higher quality cut",
       subtitle = "the majority of IF diamonds are an\"ideal\"cut")+
  ylab("proportion")+
  theme_classic()
#we can alter text size using title,axis.text,axis.title,legend.title on theme()
#note that we specify element_text() within that
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "fill") +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
  labs( title = "Clearer diamonds tend to be of higher quality cut",
        subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
  ylab("proportion") +
  theme_classic() +
  theme( title = element_text(size = 18),
         axis.text = element_text(size =14),
         axis.title = element_text(size = 16),
         legend.text = element_text(size = 14) )
#we can also change the color and bold the text just ading  comma in the argument
#guides()allow us to change legend title
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "fill") +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
  labs( title = "Clearer diamonds tend to be of higher quality cut",
        subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
  ylab("proportion") +
  theme_classic() +
  theme( title = element_text(size = 18),
         axis.text = element_text(size = 14),
         axis.title = element_text(size = 16, face = "bold"),
         legend.text = element_text(size = 14),
         plot.subtitle = element_text(color = "gray30") )
#now how about to change the name of the legend to cut quality to be more clear what we are doign here
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity, fill = cut), position = "fill") +
  scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
  labs( title = "Clearer diamonds tend to be of higher quality cut",
        subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
  ylab("proportion") +
  theme_classic() +
  theme( title = element_text(size = 18),
         axis.text = element_text(size = 14),
         axis.title = element_text(size = 16, face = "bold"),
         legend.text = element_text(size = 14),
         plot.subtitle = element_text(color = "gray30") ) +
  guides(fill = guide_legend("cut quality"))
#some times we want to change number of values displayed on the axis we use 
#scale_x_continous or scale_y_continous here we want to increase the number of labels displayed on the y axis
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity)) +
  scale_y_continuous(breaks = seq(0, 17000, by = 1000))
#you could do it also for discrete variables(factor and character) using scale_x_discrete or scale_y_discrete
#it will limit the observation you want on character
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity)) +
  scale_x_discrete(limit = c("SI2", "SI1", "I1")) +
  scale_y_continuous(breaks = seq(0, 17000, by = 1000))
#sometimes you want to flip your axis use coord_flip()
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity)) +
  scale_y_continuous(breaks = seq(0, 17000, by = 1000)) +
  scale_x_discrete(limit = c("SI2", "SI1", "I1")) +
  coord_flip() +
  labs( title = "Clearer diamonds tend to be of higher quality cut",
        subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
  ylab("proportion") +
  theme_classic() +
  theme( title = element_text(size = 18),
         axis.text = element_text(size = 14),
         axis.title = element_text(size = 16, face = "bold"),
         legend.text = element_text(size = 14),
         plot.subtitle = element_text(color = "gray30") ) +
  guides(fill = guide_legend("cut quality"))
#and finaly may be you want to add text or annonate the plot using annonate(
#we want to specify we want to annonate with "text" then say in (label)
#using x,y for coordination and how the text alin using (hjust)&(vjust)and (size)
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity)) +
  scale_y_continuous(breaks = seq(0, 17000, by = 1000)) +
  scale_x_discrete(limit = c("SI2", "SI1", "I1")) +
  coord_flip() +
  labs( title = "Number of diamonds by diamond clarity",
        subtitle = "Subset of all diamonds, looking three levels of clarity") +
  theme_classic() +
  theme( title = element_text(size = 18),
         axis.text = element_text(size = 14),
         axis.title = element_text(size = 16, face = "bold"),
         legend.text = element_text(size = 14),
         plot.subtitle = element_text(color = "gray30") ) +
  annotate("text", label = "SI1 diamonds are among \n the most frequent clarity diamond",
           y = 12800, x = 2.9,
           vjust = "top", hjust = "right",
           size = 6)
