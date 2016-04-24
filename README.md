# FOIA Scores

A site to evaluate various agencies based on time it takes to fulfill FOIA requests and how many are completed versus rejected.

[FOIA Scores](http://foia-data-hackathon.github.io/foia-scores/) was created using data from (Muckrock)[https://www.muckrock.com/news/archives/2016/apr/16/join-muckrock-and-buzzfeed-hack-foia-april-23rd/] by [Andrew Tran](http://www.twitter.com/abtran), [Kai Teoh](http://www.twitter.com/jkteoh), and [Hilary Fung](http://www.twitter.com/hil_fung) at the [FOIA Data Hackday](https://github.com/FOIA-data-hackathon) hosted by Buzzfeed. 

### Notes

* We only noticed FOIAMapper's excellent [FOIA scorecard](https://foiamapper.com/agencies/) for federal agencies halfway through our project. But we continued with our project since it had data on federal agencies as well as state and local agencies.

* The [live page](http://foia-data-hackathon.github.io/foia-scores/) only lists the first hundred results so the search function is the best way to dig through other scores.

### What's in the repo

* [`data/requests.csv`](https://github.com/FOIA-data-hackathon/foia-scores/tree/master/data) with metadata about 19,000 FOIA requests made through Muckrock.com
* [`parser.R`](https://github.com/FOIA-data-hackathon/foia-scores/blob/master/parser.R) goes through the `requests.csv` file and creates a histogram PNG of the distribution of days it takes an agency to fulfill a FOIA request and also generates `agencies.json`.
* [`agencies.json`](https://github.com/FOIA-data-hackathon/foia-scores/blob/master/agencies.json) is the generated file used to run [FOIA Scores](http://foia-data-hackathon.github.io/foia-scores/).
* [`pngs`](https://github.com/FOIA-data-hackathon/foia-scores/tree/master/pngs) is the folder where all the auto-generated histogram PNGs reside. I probably should have changed the format to prevent blocky histogram outputs.
* [`img/shame-button.png`](https://github.com/FOIA-data-hackathon/foia-scores/blob/master/img/shame-button.png) in honor of our Buzzfeed host, a button attached to each agency with an average fulfillment rate of more than 100 days.
* Various [`js`](https://github.com/FOIA-data-hackathon/foia-scores/tree/master/js) and [`css`](https://github.com/FOIA-data-hackathon/foia-scores/tree/master/js) folders that make up the [site](http://foia-data-hackathon.github.io/foia-scores/).

### Things we would have included if we had more time
* The initial idea was to combine fulfillment stats from Muckrock, FOIAMapper, and FOIA.gov, but we only had a few hours so we just limited our analysis to Muckrock. 
* Search by keywords culled from the description field (as well as agency) to see average fulfillment days and completion rate.
* Add links to examples of succesful FOIA requests and rejected FOIA requests by agency.

## What's next?

Nothing, really. We leave it to you all to browse or update, if you'd like. 




