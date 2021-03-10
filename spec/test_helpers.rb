TEST_SUM_1 = 0
TEST_SUM_2 = 1
TEST_SUM_3 = 10
TEST_SUM_4 = 100
TEST_SUM_5 = 1000
TEST_SUM_6 = -1
TEST_SUM_7 = -10
TEST_SUM_8 = -100
TEST_SUM_9 = -1000

RANDOM_SUM = rand(-9999...9999)

TEST_DATE_1 = "01-01-2001"
TEST_DATE_2 = "02-01-2001"
TEST_DATE_3 = "01-02-2002"
TEST_DATE_4 = "21-07-2010"
TEST_DATE_5 = "13-11-2011"
TEST_DATE_6 = "00-01-2001" # Impossible day
TEST_DATE_7 = "29-02-2001" # Impossible day
TEST_DATE_8 = "01-01-2099" # Impossible day
TEST_DATE_9 = "04-13-2001" # Impossible month

RANDOM_DATE = Time.at(rand * Time.now.to_i).strftime("%d-%m-%Y")
