# frozen_string_literal: true

TEST_SUM_1 = 0
TEST_SUM_2 = 8
TEST_SUM_3 = 16
TEST_SUM_4 = 32
TEST_SUM_5 = 64
TEST_SUM_6 = 128
TEST_SUM_7 = 256
TEST_SUM_8 = 512
TEST_SUM_9 = -1 # Impossible number

RANDOM_SUM = rand(999)

TEST_DATE_1 = '01-01-2001'
TEST_DATE_2 = '02-01-2001'
TEST_DATE_3 = '01-02-2002'
TEST_DATE_4 = '21-07-2010'
TEST_DATE_5 = '13-11-2011'
TEST_DATE_6 = '00-01-2001' # Impossible day
TEST_DATE_7 = '29-02-2001' # Impossible day
TEST_DATE_9 = '04-13-2001' # Impossible month
TEST_DATE_8 = '01-01-2099' # Impossible year

RANDOM_DATE = Time.at(rand * Time.now.to_i).strftime('%d-%m-%Y')
