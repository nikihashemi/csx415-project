#Test that over20 and state.failed columns are numeric
expect_is(test1$over20, "integer")
expect_is(test2$state.failed, "integer")