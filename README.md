Final Project: The Effect of Emotion on Reactions to Greta Thunberg’s
Tweets
================
Lily Franks, Sophia Giustino, Emma Kim, and Rob Dreyer
2022-12-18

Check out and download our full project on
[Github](https://github.com/sgiustino/Stat433FinalProject).

## Introduction

Greta Thunberg is a Swedish environmental activist who is known for her
work that addresses the issue of climate change. She has challenged
world leaders to take immediate action against climate change and has
even spoken at the United Nations Climate Action Summit in 2019. Greta
joined the spotlight at the age of 18, and her Twitter account shortly
followed. Today, she has over 4.9 million followers and more than 11.7
thousand tweets that discuss climate change and environmental activism.

With the impending threats of climate change over the past half-decade,
and the prevalence of social media today, we thought it would be
interesting to investigate how social media synchronizes with current
events; more specifically, how the use of social media could affect
responses to climate change. We decided to do an in-depth analysis of
Greta’s tweets to see if we could find any connections between the word
choice in her tweets to the interactions with the tweet. We determined
how the sentiment of social media posts about climate change influences
engagement, which could lead to more actions being taken to stop climate
change. We have found that Greta Thunberg’s tweets that have a higher
ratio of emotionally-laden words to total words will receive greater
interaction, measured by the number of retweets.

## Data

To collect data from Greta Thunberg’s twitter account, we used pulled
data from the Twitter API with the package `rtweet`. Using the
`get_timeline` function, we were able to pull approximately 3000 of
Greta Thunberg’s most recent tweets and write them to a csv file. We
then filtered the Twitter API data to include the full text, retweet
count, favorited count, language, and word count. To determine the
sentiment in each tweet, we used three word dictionaries known as Bing,
Loughran, and NRC. Each dictionary classifies a word as either positive,
negative, or neutral. Some dictionaries had other classifications, but
for consistency purposes we only used the positive and negative
variables.

Before we analyzed the sentiment of each tweet, we first filtered the
data to only include tweets written in English. We then split each tweet
to include one word per row using the `unnest_tokens` function. With the
tweets separated by word, we created three new data frames by joining
each of the sentiment dictionaries onto the individual words of each
tweet. Every word that was matched to a sentiment dictionary added to
the count of positive or negative words in the tweet. By taking the sum
of positive and negative words (i.e. `bingPos`, `bingNeg`) in each tweet
and dividing by the word count, we found the ratio of emotionally-laden
words in each tweet (i.e. `bingRatio`). We then used a left join to
combine the three sentiment data frames onto the original dataset,
allowing us to compare the sentiment data to the twitter interactions
data. To make sure all rows were in order, we used the function,
`mean(xsent$tweet == 1:nrow(xsent))`, to double check our left joins.

------------------------------------------------------------------------

## Methods

Upon completion of the dataframe `gret_sent`, we decided to use the
ratio variables (i.e. `bingRatio`) as the independent variables in our
study to analyze emotionally-laden words in correlation with retweet
behavior (i.e. `retweet_count`). We did this because we wanted to
measure emotional saturation of a tweet rather than the number of
emotionally-laden words (i.e `bingWords`) within the tweet in order to
support the ranging lengths of the tweets. Additionally, we chose to
focus on all the emotional words instead of either positive or negative
because all dictionary words carry emotional significance, which answers
the question of our study.

Next, in order to ensure all dictionaries (Bing, Lough, and NRC) were
significantly correlated to the amount of retweets per tweet, we
constructed three separate linear regression models along with anova
tables. These tables proved to us that all three dictionary ratios had a
statistically significant effect of retweet count. However, in order for
these tables to portray statistically significant p values for the
ratios we used the log value of `retweet_count`. In doing so, the graphs
produced became more concise and the linear lines more dramatic.

Lastly, we used the following equation to interpret the three
dictionaries’ coefficients, within the anova tables: ln(Yi) = 𝜷0 +
𝜷1Xi + ui. While the equation originally interprets the relationship as
a correlation between a tweet with zero emotionally-laden words in
comparison to one with 100% emotionally-laden words, we decided to
interpret these results with 10% increases. We did this in hopes to
clarify the results in a real-world sense as there are rarely tweets
that are completely made of emotional words.

## Results

We plotted the linear relationships between the emotional saturation of
tweets and the logarithm of their retweet count. All of the graphs show
a slight positive slope for the linear trend. You can also view these
plots in our [Shiny
App.](https://github.com/sgiustino/Stat433FinalProject/blob/master/app.R)

#### Figure 1: NRC Ratio vs. Retweet Count

    ## `geom_smooth()` using formula 'y ~ x'

![](README_files/figure-gfm/nrc%20graph-1.png)<!-- -->

#### Table 1

    ## 
    ## Call:
    ## lm(formula = log(retweet_count) ~ nrcRatio, data = gret_sent)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -5.6013 -0.9327 -0.2971  0.8071  5.3592 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  6.29443    0.03624  173.69  < 2e-16 ***
    ## nrcRatio     1.19183    0.38577    3.09  0.00202 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.194 on 2812 degrees of freedom
    ## Multiple R-squared:  0.003383,   Adjusted R-squared:  0.003029 
    ## F-statistic: 9.545 on 1 and 2812 DF,  p-value: 0.002024

When we regressed the logarithm of retweets on the ratio of NRC
dictionary emotional words to total words in the tweet, we found the
coefficient for the ratio of emotional words was statistically
significant, with a coefficient of 1.19. This means that for a 10%
increase in emotional words (an increase of 0.1 in the ratio), there is
an 11.9% increase in retweets.

#### Figure 2: Lough Ratio vs. Retweet Count

    ## `geom_smooth()` using formula 'y ~ x'

![](README_files/figure-gfm/lough%20graph-1.png)<!-- -->

#### Table 2

    ## 
    ## Call:
    ## lm(formula = log(retweet_count) ~ loughRatio, data = gret_sent)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -5.6036 -0.9168 -0.3067  0.7976  5.3651 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  6.29672    0.02722  231.33  < 2e-16 ***
    ## loughRatio   3.38804    0.61158    5.54 3.31e-08 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.19 on 2812 degrees of freedom
    ## Multiple R-squared:  0.0108, Adjusted R-squared:  0.01044 
    ## F-statistic: 30.69 on 1 and 2812 DF,  p-value: 3.308e-08

When we regressed the logarithm of retweets on the ratio of lough
dictionary emotional words to total words in the tweet, we found the
coefficient for the ratio of emotional words was also statistically
significant, with a coefficient of 3.39. This means that for a 10%
increase in emotional words (an increase of 0.1 in the ratio), there is
an 33.9% increase in retweets.

#### Figure 3: Bing Ratio vs. Retweet Count

    ## `geom_smooth()` using formula 'y ~ x'

![](README_files/figure-gfm/bing%20graph-1.png)<!-- -->

#### Table 3

    ## 
    ## Call:
    ## lm(formula = log(retweet_count) ~ bingRatio, data = gret_sent)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -5.5290 -0.9188 -0.2765  0.7917  5.0210 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   6.2221     0.0332 187.392  < 2e-16 ***
    ## bingRatio     2.9748     0.4558   6.526 7.97e-11 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 1.187 on 2812 degrees of freedom
    ## Multiple R-squared:  0.01492,    Adjusted R-squared:  0.01457 
    ## F-statistic: 42.59 on 1 and 2812 DF,  p-value: 7.969e-11

When we regressed the logarithm of retweets on the ratio of bing
dictionary emotional words to total words in the tweet, we found the
coefficient for the ratio of emotional words was also statistically
significant, with a coefficient of 2.97. This means that for a 10%
increase in emotional words (an increase of 0.1 in the ratio), there is
an 29.7% increase in retweets.

#### Figure 4: Compared: all dictionaries

    ## `geom_smooth()` using formula 'y ~ x'
    ## `geom_smooth()` using formula 'y ~ x'
    ## `geom_smooth()` using formula 'y ~ x'

![](README_files/figure-gfm/combined%20plot-1.png)<!-- -->

Across all three dictionaries, we saw a statistically significant
positive relationship between the ratio of emotional words to total
words in the tweet and the number of retweets the tweet received. While
the coefficients were different, we still have statistically significant
evidence that an increase in the ratio of emotionally laden words is
related to an increase in a tweet’s retweet count.

## Conclusion

After our analysis, we concluded that Greta Thunberg’s tweets that have
a higher ratio of emotionally-laden words to total words will receive
greater interaction, measured by the number of retweets. Our main
evidence to support this conclusion is that across all three
dictionaries there is a statistically significant positive relationship
between the word ratio and the logarithm of the retweet count. We can
see all three of the positive linear relationships in Figure 4. In
tables 1, 2, and 3, we can see that the positive coefficients are all
statistically significant.

One limitation of our analysis is that we could not pull all of the
tweets from Thunberg’s Twitter account. Since we had limited access to
the Twitter API and not research-level access, we could only use around
3,000 of her most recent tweets, which is only a fraction of her
account.

Another limitation is that we cannot be certain that the sentiment
dictionaries include all possible emotional words. This would mean that
some tweets with more emotional words may have been given lower ratios
in our analysis.

Another issue that remains uncertain is that we cannot differentiate
between retweets that come from real humans and retweets that come from
bots. We cannot draw a conclusion that people retweet more emotional
tweets more vs. if bots amplify emotional tweets more. This would be
interesting to explore in a study with more resources or more time
because what tweets bots amplify could have strong real-world impacts.

Another issue that remains uncertain is if the conclusions we drew here
apply to all tweets about climate change, which was our original
research question. Greta Thunberg’s account was our chosen sample since
she is an important climate change spokesperson, but her account does
not comprise all tweets about climate change. With more time and more
access to the Twitter API, we would be able to investigate the research
question further and see if our results are similar across other
accounts, hashtags, or topics.
