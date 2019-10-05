(define (problem dynamic1)
  (:domain lunarlockoutdynamic)

  (:objects
    Origin cityA cityB cityC cityD cityE cityF cityG cityH cityI cityJ - city
    hotelA_A hotelA_B hotelA_C hotelB_A hotelB_B hotelB_C hotelC_A hotelC_B hotelC_C hotelD_A hotelD_B hotelD_C hotelE_A hotelE_B hotelE_C hotelF_A hotelF_B hotelF_C hotelG_A hotelG_B hotelG_C hotelH_A hotelH_B hotelH_C hotelI_A hotelI_B hotelI_C hotelJ_A hotelJ_B hotelJ_C - hotel
  )

  (:init
    (currentLocation Origin)

    (hotelAt hotelA_A cityA)
    (hotelAt hotelA_B cityA)
    (hotelAt hotelA_C cityA)
    (hotelAt hotelB_A cityB)
    (hotelAt hotelB_B cityB)
    (hotelAt hotelB_C cityB)
  )

  (:goal
    (and
      (>= (citiesVisited) 10)
      (>= (totalDays) 20)
      (>= (totalcost) 100)
      (<= (totalcost) 1000000)
    )
  )
)