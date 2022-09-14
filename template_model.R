ll_cty_m2_final_1_2_test1 <-
  brms::brm(
    prior = priors_r_1,
    center = TRUE,
    seed = 333,
    iter = 10000,
    warmup = 5000,
    chains = 4,
    cores = 16,
    data = data_ll_2_sample,
    family = multinomial(refcat = 'wordcount_other'),
    bf(
      nl = TRUE,
      wordcount_parameters | trials(wordcount_total) ~ 1,
      
      muwordcountfrench    ~
        sign_type +
        sign_intended_language +
        sign_type:sign_intended_language +
        sign_text_prominence +
        
        (1 + sign_type+ | ID1 | id_storefront_fc) +
        (1 + sign_type+ | ID2 | city_name:id_storefront_fc),
      
      muwordcountenglish   ~
        sign_type +
        sign_intended_language +
        sign_type:sign_intended_language +
        sign_text_prominence +
        
        (1 + sign_type + sign_intended_language |
           ID1 | id_storefront_fc) +
        (1 + sign_type | ID2 | city_name:id_storefront_fc),
      
      muwordcountcognates  ~
        sign_type +
        sign_intended_language +
        sign_type:sign_intended_language +
        sign_text_prominence +
        
        (1 + sign_type + sign_intended_language |
           ID1 | id_storefront_fc) +
        (1 + sign_type | ID2 | city_name:id_storefront_fc),
      
      muwordcountilh       ~
        sign_type +
        sign_intended_language +
        sign_type:sign_intended_language +
        sign_text_prominence +
        
        (1 + sign_type + sign_intended_language |
           ID1 | id_storefront_fc) +
        (1 + sign_type | ID2 | city_name:id_storefront_fc)
    )
  )