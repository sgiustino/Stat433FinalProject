Final Project: The Effect of Emotion on Reactions to Greta Thunberg’s
Tweets
================
Lily Franks, Sophia Giustino, Emma Kim, and Rob Dreyer
2022-12-18

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

your primary data sources–url links, citations, AND data descriptions
(some people re-post data that others collect… be sure to give proper
credit to the workers/org that originally collected the data); your data
cleaning–describe the steps that you took. As much as possible, it
should be replicable via your .Rmd file but not visible in the .pdf
(echo = FALSE)

------------------------------------------------------------------------

## Methods

The third section of your document is the methods section. It should
describe a brief description of the statistical technique(s) and a
description of why you chose them.

## Results

We plotted the linear relationships between the emotional saturation of
tweets and the logarithm of their retweet count. All of the graphs show
a slight positive slope for the linear trend.

#### NRC Ratio vs. Retweet Count

    ## `geom_smooth()` using formula 'y ~ x'

![](README_files/figure-gfm/nrc%20graph-1.png)<!-- -->

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

#### Lough Ratio vs. Retweet Count

    ## `geom_smooth()` using formula 'y ~ x'

![](README_files/figure-gfm/lough%20graph-1.png)<!-- -->

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

When we regressed the logarithm of retweets on the ratio of NRC
dictionary emotional words to total words in the tweet, we found the
coefficient for the ratio of emotional words was also statistically
significant, with a coefficient of 3.39. This means that for a 10%
increase in emotional words (an increase of 0.1 in the ratio), there is
an 33.9% increase in retweets.

#### Bing Ratio vs. Retweet Count

    ## `geom_smooth()` using formula 'y ~ x'

![](README_files/figure-gfm/bing%20graph-1.png)<!-- -->

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

#### Compared: all dictionaries

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

``` r
measure_dic = data.frame(
  dictionary = c("Bing", "Lough", "Nrc"),
  avgval = c(mean(gret_sent$bingWords), mean(gret_sent$loughWords), mean(gret_sent$nrcWords))
)

measure_dic 
```

    ##   dictionary    avgval
    ## 1       Bing 1.2960199
    ## 2      Lough 0.6453447
    ## 3        Nrc 1.8137882

## Conclusion

The final section of the paper is the conclusion. It should return to
your thesis statement/hypothesis. Summarize the main evidence that
supports your conclusions; reference back to key
figures/tables/equations and highlight the important pieces. Describe
the limitations of your analysis, both big and small. Describe issues
that remain uncertain, but could be explored more fully with your
available resources (+ more time).
