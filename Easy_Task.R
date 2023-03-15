library(cleanTS)

# Read sunspot.month dataset
dat <- timetk::tk_tbl(sunspot.month)
print(dat)

# Randomly insert missing values to simulate missing value imputation
set.seed(10)
rand.ind <- sample(nrow(dat), 100)
dat$value[rand.ind] <- NA

# Create `cleanTS` object
cTS <- cleanTS(dat, date_format = c("my"))
summary(cts)

# Cleaned Data
head(cTS$clean_data)

# Genearate animated plot
a <- animate_interval(cTS, interval = "10 year")
gen.animation(a, height = 700, width = 900)
interact_plot(cTS, interval = "10 year")
