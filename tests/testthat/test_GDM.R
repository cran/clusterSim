context("gdm")

test_that("gdm", {
  data(data_ratio)
  d1w <- GDM(data_ratio, method="GDM1", weightsType="different1",
  weights=c(0.4,0.1,0.3,0.15,0.05))
  d1ws<-.GDM.single.column(data_ratio, method="GDM1", weightsType="different1",
  weights=c(0.4,0.1,0.3,0.15,0.05))
  expect_equal(as.vector(as.matrix(d1w)[,1]),as.vector(d1ws))
  data(data_ordinal)
  d2w <- GDM(data_ordinal, method="GDM2", weightsType="different2",
  weights=c(1,3,0.5,1.5,1.8,0.2,0.4,0.6,0.2,0.4,0.9,1.5))
  d2ws <- .GDM.single.column(data_ordinal, method="GDM2", weightsType="different2",
  weights=c(1,3,0.5,1.5,1.8,0.2,0.4,0.6,0.2,0.4,0.9,1.5))
  expect_equal(as.vector(as.matrix(d2w)[,1]),as.vector(d2ws))
})
