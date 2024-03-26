# Simple code in R for imputing NA values with values from the nearest year

Some datasets have a lot of missing values: 

| country  | year | variable |
| :------: | :--: | -------- |
| Malaysia | 2001 |          |
| Malaysia | 2002 |          |
| Malaysia | 2003 |          |
| Malaysia | 2004 |          |
| Malaysia | 2005 | 0.46     |
| Malaysia | 2006 |          |
| Malaysia | 2007 |          |
| Malaysia | 2008 |          |
| Malaysia | 2009 |          |
| Malaysia | 2010 |          |
| Malaysia | 2011 |          |
| Malaysia | 2012 | 0.50     |
| Malaysia | 2013 |          |
| Malaysia | 2014 |          |
| Malaysia | 2015 | 0.54     |
| Malaysia | 2016 |          |
| Malaysia | 2017 |          |
| Malaysia | 2018 |          |
| Malaysia | 2019 |          |
| Malaysia | 2020 |          |

The code allows you to impute the value for the variable from the nearest year. For example, the value 0.46 will be imputed for the years 2001 through 2004:

| country  | year | variable |
| :------: | :--: | -------- |
| Malaysia | 2001 | 0.46     |
| Malaysia | 2002 | 0.46     |
| Malaysia | 2003 | 0.46     |
| Malaysia | 2004 | 0.46     |
| Malaysia | 2005 | 0.46     |
| Malaysia | 2006 |          |
| Malaysia | 2007 |          |
| Malaysia | 2008 |          |
| Malaysia | 2009 |          |
| Malaysia | 2010 |          |
| Malaysia | 2011 |          |
| Malaysia | 2012 | 0.50     |
| Malaysia | 2013 |          |
| Malaysia | 2014 |          |
| Malaysia | 2015 | 0.54     |
| Malaysia | 2016 |          |
| Malaysia | 2017 |          |
| Malaysia | 2018 |          |
| Malaysia | 2019 |          |
| Malaysia | 2020 |          |
